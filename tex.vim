function! ViewPDF(forward)
    let pdf = system('echo -n *.synctex.gz')[:-12].'.pdf'
    let info = system('pdfinfo '.pdf)
    let w = str2float(matchstr(info,'\vPage size: *\zs(\d*\.?\d*)'))
    let h = str2float(matchstr(info,'\vPage size:.*x \zs(\d*\.?\d*)'))
    if a:forward
        let sync = system('synctex view -i '.line('.').':'.col('.').':'.expand('%').' -o '.pdf)
        let page = matchstr(sync,'\vPage:\zs(\d*)')
        let x = str2float(matchstr(sync,'\vx:\zs(\d*.?\d*)'))
        let y = str2float(matchstr(sync,'\vy:\zs(\d*.?\d*)'))
	let args = ' -e pageIndex '.(page - 1).' -e offsetX '.string(x / w).' -e offsetY '.string(y / h)
    else
	let args = ''
    endif
    let run = system('am start -a android.intent.action.VIEW -d "file://$PWD/'.pdf.'"'.args.' org.sufficientlysecure.viewer/org.ebookdroid.ui.viewer.ViewerActivity')
    let pos = system("echo 'HTTP/1.0 200 OK\nContent-Length: 1\n' | nc -l 8080")
    let bpage = matchstr(pos,'\vpage\=\zs(\d*)')
    let bx = str2float(matchstr(pos,'\vx\=\zs(\d*.?\d*)'))
    let by = str2float(matchstr(pos,'\vy\=\zs(\d*.?\d*)'))
    let bsync = system('synctex edit -o '.(bpage + 1).':'.string(bx * w).':'.string(by * h).':'.pdf)
    let input = matchstr(bsync,'\vInput:.*/\./\zs(.*)\ze\nLine')
    let line = matchstr(bsync,'\vLine:\zs(\d*)')
    exec 'ex '.input
    exec line
endfunction

command V call ViewPDF(0)
command F call ViewPDF(1)
