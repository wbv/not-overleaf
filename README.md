"Overleaf"
==========
This is how I write LaTeX documents. I like Overleaf, but I like maintaining
control of my own source, documents, and ridiculous build processes (should
I choose to add weird features like automatic generation of figures, tables,
etc).

You'll need:
- GNU Make
- TexLive (or something equivalent latex distribution supplying pdflatex)
- Bash (or any shell, really)

Customize the Makefile with:
- The name of the pdf you want to generate
- The name of your latex source code file
- Any dependency files used in your latex document (images, tables)
- Any PDFLaTeX flags you need (e.g. --shell-escape)

In its own terminal, run `make loop` or type the command it runs manually:

```
while :; do make < /dev/null; sleep 1; done
```

Open your PDF in one window, and edit your source code in another. Any time you
save your TeX file, the pdf will automatically be regenerated, and most PDF
readers (Evince, for me) will notice and will refresh your view automatically.

If your PDF doesn't update, that's a good sign that PDFLaTex ran into an error.
You'll need to run check the terminal you were running the infinite loop of
"make" in to see the error. To read the log more easily, pause the `make loop`
and simply run `make` once.
