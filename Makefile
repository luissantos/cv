all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 -V fontsize=12pt \
	-o luis-santos-resume.tex resume.md; \
	context luis-santos-resume.tex

html: resume.html index.html
resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css --section-divs \
        --from markdown --to html \
        -o resume.html resume.md

index.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css --section-divs \
        --from markdown --to html \
        -o index.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -f markdown+smart -t markdown-smart resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -f markdown+smart -t markdown-smart resume.md -o resume.rtf

clean:
	rm -f resume.html
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
	rm -f luis-santos-resume.*
	rm -f resume.docx
	rm -f resume.rtf
