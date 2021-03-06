# Document Viewer

With the power of [Termux](https://termux.com/), [TeX Live](https://wiki.termux.com/wiki/TeX_Live) and [Vim](https://wiki.termux.com/wiki/Text_Editors#Vim), one can edit and compile LaTeX files directly on Android phones and tablets. However, to work efficiently one often need to do forward and backward search between LaTeX source files and compiled PDF files. This repo is a fork of [Document Viewer](https://github.com/SufficientlySecure/document-viewer/) with SyncTeX support to achieve these tasks on Android.

## Installation

 - Build and install this app (see the original README below) and the [Termux](https://termux.com/) app.
 - In Termux, install TeX Live, Vim, and Netcat.
 - Add the code in [`tex.vim`](tex.vim) to your `.vimrc` or `ftplugin/tex.vim`.

## Usage

It is best used with a hardware keyboard.

![Demo gif](demo.gif?raw=true)

- In vim, enter `:F` to do forward search, or `:V` to view the output PDF without forward search (jump to Document Viewer).
- In Document Viewer, double tapping on the document to do backward search (jump back to Vim).

Note:
- The TeX files must be compiled with SyncTeX enabled (`-synctex=1`).
- When opening a TeX file in Vim, the working directory must be public (`/storage/emulated/0/...`) rather than private (`~/storage/shared/...`), and the path must be related to the directory of the main TeX file of the entire project.
- In order for backward search to work, Document Reader must be started directly from vim with the above commands. Switching back to the app may not work.
- To go back to vim from Document Reader without doing backward search, press the return button directly or use a "Close" action in Document Reader (configurable from the menu).
- The "Recent Book" activity of Document Reader must not be in the background, or one will not jump back directly to vim.
- Split screen is not supported.

## Below is the original README

# Document Viewer

[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="80">](https://f-droid.org/app/org.sufficientlysecure.viewer)

Document Viewer is a highly customizable document viewer for Android.

Supports the following formats:
* PDF
* DjVu
* EPUB
* XPS (OpenXPS)
* CBZ (Comic Books, no support for rar compressed CBR)
* FictionBook (fb2)

Collaboration with electronic publication sites and access to online ebook catalogs is allowed by the supported OPDS protocol.

FAQ, information about supported MIME types, and available Intents can be found in the [Wiki](https://github.com/dschuermann/document-viewer/wiki).

## [Changelog](https://raw.githubusercontent.com/SufficientlySecure/document-viewer/HEAD/document-viewer/src/main/assets/about/en/changelog.wiki)

## Development

Document Viewer is a fork of the last GPL version of EBookDroid (http://code.google.com/p/ebookdroid/).

We need your support to fix outstanding bugs, join development by forking the project!

## Building

**NOTE: NDK r14b fails to compile DV - use r15 or r13b. (See [#245](https://github.com/SufficientlySecure/document-viewer/issues/245))**

### Build with Gradle

1. Have Android SDK "tools", "platform-tools", and "build-tools" directories in your PATH (http://developer.android.com/sdk/index.html)
2. Open the Android SDK Manager (shell command: ``android``).  
Expand the Tools directory and select "Android SDK Build-tools" newest version.  
Expand the Extras directory and install "Android Support Repository"  
Select everything for the newest SDK
3. Export ANDROID_HOME pointing to your Android SDK
5. Pull in submodules with ``./init.sh``
5. Build native libraries with ``cd document-viewer; ndk-build``
6. Execute ``./gradlew build``

### NDK Debugging

1. ``cd document-viewer; ndk-build -j8 NDK_DEBUG=1``
2. From Android Studio: Run -> Debug... to build and install the APK and launch it on the device. 
3. ``cp src/main/AndroidManifest.xml . # Hack required for ndk-gdb to find everything``
4. ``ndk-gdb``

### Development with Android Studio

I am using the newest [Android Studio](http://developer.android.com/sdk/installing/studio.html) for development. Development with Eclipse is currently not possible because I am using the new [project structure](http://developer.android.com/sdk/installing/studio-tips.html).

1. Clone the project from github
2. From Android Studio: File -> Import Project -> Select the cloned top folder
3. Import project from external model -> choose Gradle

## Font Pack

The [Document Viewer Fontpack](https://github.com/PrivacyApps/document-viewer-fontpack) is no longer supported. Our MuPDF patches to support this no longer apply cleanly, so support for the font pack was dropped.

# Licenses
Document Viewer is licensed under the GPLv3+.  
The file LICENSE includes the full license text.

## Details
Document Viewer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Document Viewer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Document Viewer.  If not, see <http://www.gnu.org/licenses/>.

## Java Libraries
* JCIFS  
  http://jcifs.samba.org/  
  LGPL v2.1

* Color Picker by Daniel Nilsson  
  http://code.google.com/p/color-picker-view/  
  Apache License v2

## C Libraries

* MuPDF - a lightweight PDF, EPUB, CBZ and XPS viewer   
  http://www.mupdf.com/  
  AGPLv3+

* djvu - a lightweight DJVU viewer based on DjVuLibre  
  http://djvu.sourceforge.net/  
  GPLv2
    
## Images

* application_icon.svg  
  http://rrze-icon-set.berlios.de/  
  Creative Commons Attribution Share-Alike licence 3.0
