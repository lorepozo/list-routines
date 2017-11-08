TEX = xelatex -shell-escape -interaction=nonstopmode -file-line-error

PRE := $(wildcard ./*.tex)
OBJ := $(PRE:%.tex=%.pdf)

BIB := $(wildcard ./*.bib)

all: $(OBJ)

bib: $(BIB)
	bibtex $(^:.bib=)

%.pdf: %.tex
	$(TEX) $^

clean:
	$(RM) *.aux *.log *.out *.bbl *.blg

cleanall: clean
	$(RM) $(OBJ)
