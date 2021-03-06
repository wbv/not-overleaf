#!/usr/bin/make

# Makefile - Run with GNU Make to create a LaTeX Document
# Copyright (C) 2020  Walter B. Vaughan
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <https://www.gnu.org/licenses/>.


# change this to the full filename of the document you want to generate
# i.e. mydocument.pdf
DOC := mydocument.pdf 

# change this to the name of your main latex source code
# i.e. main.tex
SRC := main.tex



# INCLUDEDFILES variable optionally lets you specify dependencies of your
# document (i.e. included figures, tables, etc.)

# ex. consider all png, jpg, and svg files in this directory as
# dependencies so the document will update if any of them update
#INCLUDEDFILES := $(wildcard *.png *.jpg *.svg)

# ex. somedata.csv is read into or used inside the document, as well
#INCLUDEDFILES := somedata.csv



# flags you use to call pdflatex with.. unlikely you'll need to change this
# i.e. -halt-on-error makes pdflatex just exit when it encounters an error
LATEXFLAGS := -halt-on-error

DOCBASE := $(patsubst %.pdf,%,$(DOC))
TMPFILES := log aux nav toc out bbl blg

all: $(DOC)

$(DOC): $(SRC) $(INCLUDEDFILES)
	pdflatex $(LATEXFLAGS) -jobname $(DOCBASE) $(SRC)
	pdflatex $(LATEXFLAGS) -jobname $(DOCBASE) $(SRC)
	pdflatex $(LATEXFLAGS) -jobname $(DOCBASE) $(SRC)
	$(foreach EXT,$(TMPFILES),rm -f $(DOCBASE).$(EXT);)

loop:
	while :; do $(MAKE) < /dev/null; sleep 1; done

clean:
	rm -f $(DOC)
	$(foreach EXT,$(TMPFILES),rm -f $(DOCBASE).$(EXT);)

.PHONY: clean all loop
