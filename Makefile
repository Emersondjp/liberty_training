SRC = $(wildcard *.tex)
#SUBSRC = $(addprefix chapters/,$(wildcard chapters/*.tex))
SUBSRC = $(wildcard chapters/*.tex)

PDFS = $(SRC:.tex=.pdf)

all: pdf

en: clean
	xelatex liberty_training.tex

pdf: $(PDFS)

$(PDFS):  $(SRC) $(SUBSRC) training.cls
	xelatex $<
	evince $@

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
	$(RM) chapters/*.log chapters/*.aux chapters/*.bbl chapters/*.blg chapters/*.synctex.gz chapters/*.out chapters/*.toc chapters/*.lof chapters/*.idx chapters/*.ilg chapters/*.ind chapters/*.pdf

