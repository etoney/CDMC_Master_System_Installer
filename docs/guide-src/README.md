# The Master Mix System User Guide: source

`content.md` is the guide's text (GitHub-flavoured Markdown, with `@@FIG key|Caption@@` for a
screenshot `shot_key.jpg` and `@@MAP@@` for the drawn session map). `build.py` turns it into
`docs/Mix System User Guide.pdf`, the PDF the installer puts in Guides.

Build on Linux (needs pandoc, Playwright with Chromium, pypdf, reportlab, and the DejaVu and TeX Gyre Heros Condensed fonts):

    python3 build.py            # writes ../Mix System User Guide.pdf

Every session that changes the guide: pull first, edit content.md here, build, commit both the
source and the PDF, push. Don't edit the PDF from another copy of the source.
