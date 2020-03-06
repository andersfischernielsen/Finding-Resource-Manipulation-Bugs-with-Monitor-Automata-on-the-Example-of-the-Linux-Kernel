FILES = *.tex *.bib */*.tex */images/*.pdf

TEX = pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape
BIB = bibtex

default: report.pdf

report.pdf: $(FILES) report.bbl report.blg
	$(TEX) report.tex

report.bbl report.blg: bibliography.bib report.aux
	$(BIB) report.aux
	$(TEX) report.tex

report.aux: $(FILES)
	$(TEX) report.tex

clean:
	rm -rf *.aux *.blg *.bbl *.log *.out *.tdo *.synctex.gz *.toc report.pdf
	rm -rf */*.aux
