CC=pdflatex
BIB=bibtex
SRC=src
all: 
	cd $(SRC) && $(CC) sbc-template.tex 
	cd $(SRC) && $(BIB) sbc-template.aux
	cd $(SRC) && $(CC) sbc-template.tex
	cd $(SRC) && $(CC) sbc-template.tex
	mv $(SRC)/sbc-template.pdf ./relatorio.pdf
	@rm -rf $(SRC)/*.log $(SRC)/*.aux $(SRC)/*.blg $(SRC)/*.bbl 

clean:
	@rm -rf *.pdf *.log $(SRC)/*.log $(SRC)/*.aux $(SRC)/*.blg $(SRC)/*.bbl 
