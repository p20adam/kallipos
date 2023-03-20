pandoc text/pre.txt --lua-filter=epigraph.lua --to markdown | pandoc --top-level-division=chapter --to latex > latex/pre.tex
pandoc text/intro.txt --lua-filter=epigraph.lua --to markdown | pandoc --top-level-division=chapter --to latex > latex/intro.tex

for filename in text/ch.txt; do
  [ -e "$filename" ] || continue
  pandoc --lua-filter=extras.lua "$filename" --to markdown | pandoc --lua-filter=mylua.lua --to markdown | pandoc --lua-filter=ext
ras.lua --to markdown | pandoc --lua-filter=epigraph.lua --to markdown | pandoc --lua-filter=figure.lua --to markdown | pandoc --lua-filter
=footnote.lua --to markdown | pandoc --filter pandoc-fignos --to markdown | pandoc --metadata-file=meta.yml --top-level-division=chapter --
citeproc --bibliography=bibliography/"$(basename "$filename" .txt).bib" --reference-location=section --wrap=none --to latex > latex/"$(base
name "$filename" .txt).tex"
done

pandoc text/web.txt --lua-filter=epigraph.lua --to markdown | pandoc --top-level-division=chapter --to latex > latex/web.tex
pandoc text/bio.txt --top-level-division=chapter --to latex > latex/bio.tex

for filename in text/apx.txt; do
  [ -e "$filename" ] || continue
  pandoc --lua-filter=extras.lua "$filename" --to markdown | pandoc --lua-filter=mylua.lua --to markdown | pandoc --lua-filter=ext
ras.lua --to markdown | pandoc --lua-filter=epigraph.lua --to markdown | pandoc --lua-filter=figure.lua --to markdown | pandoc --filter pan
doc-fignos --to markdown | pandoc --metadata-file=meta.yml --top-level-division=chapter --citeproc --bibliography=bibliography/"$(basename
"$filename" .txt).bib" --reference-location=section --to latex > latex/"$(basename "$filename" .txt).tex"
done