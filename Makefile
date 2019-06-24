SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: pdf

en: clean
	xelatex liberty_training.tex

pdf: $(PDFS)

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf

