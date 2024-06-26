filename = statistical-convex-cocompactness.pdf

build-pdf:
	latexmk main.tex

clean:
	find ./build/ -type f -not -name '*.pdf' -exec rm {} +
	rm -rf ./web/

web:
	mkdir ./web/
	cp ./main.pdf ./web/${filename}
	echo "Link to latest <a href="${filename}">compiled pdf</a>." > ./web/index.html

arxiv: build-pdf
	mkdir arxiv-build;
	cp -r main.tex appendix.tex entropy-equality.tex introduction.tex linear-gap.tex preliminaries.tex thin-part.tex weak-convex-core.tex mathpreamble.sty references.bib build/main.bbl images/ arxiv-build/;
	tar -czf arxiv-submission.tar.gz -C arxiv-build .;
	rm -rf arxiv-build
