"Overleaf"
==========
You'll need:
	- GNU Make
	- TexLive (or something equivalent latex distribution supplying pdflatex)
	- Bash (or any shell, really)

Customize the Makefile with:
	- The name of the pdf you want to generate
	- The name of your latex source code file
	- Any dependency files used in your latex document (images, tables)
	- Any PDFLaTeX flags you need (e.g. --shell-escape)

In its own terminal, run the script in build.sh, either typing it manually
inline (to see the output of pdflatex):

```
while :; do make < /dev/null; sleep 1; done
```

or lazily run it in the background and hide any failure:

```
./build.sh &
```

Open your PDF in one window, and edit your source code in another. Any time you
save your TeX file, the pdf will automatically be regenerated, and most PDF
readers (Evince, for me) will notice and will refresh your view automatically.

If your PDF doesn't update, that's a good sign that PDFLaTex ran into an error.
You'll need to run make on its own to see what happened, or check the terminal
you were running the infinite loop of "make" in if you chose that option.
