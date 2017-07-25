# mkv-split-chapters

This is a simple tool that takes one mkv file with several chapters and extracts each chapter into a mkv file.

## Installation

```
$ git clone https://github.com/dpsenner/mkv-split-chapters.git
$ cd mkv-split-chapters
$ sudo ln -s $(readlink -f mkv-split-chapters/mkv-split-chapters.sh) /usr/local/bin/mkv-split-chapters
```

## Usage

```
$ ls
some-mkv-file.mkv
$ mkv-split-chapters some-mkv-file.mkv
Filename: some-mkv-file
Extension: mkv
Filedir: .
ffmpeg -i some-mkv-file.mkv -ss 0.000000 -to 394.800000 -acodec copy -vcodec copy ./some-mkv-file-#00.mkv
[...]
ffmpeg -i some-mkv-file.mkv -ss 394.800000 -to 767.160000 -acodec copy -vcodec copy ./some-mkv-file-#01.mkv
[...]
ffmpeg -i some-mkv-file.mkv -ss 757.160000 -to 1216.720000 -acodec copy -vcodec copy ./some-mkv-file-#02.mkv
[...]
```

