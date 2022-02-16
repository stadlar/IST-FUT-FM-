# alias pandocker='docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker'
# docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` artifactory.arionbanki.is/docker.io-remote/pandoc/latex:latest --lua-filter=pagebreak.lua  -f markdown+hard_line_breaks -s '310.md' -t pdf -o 310_A.pdf --highlight-style tango

function ex()
{
  fullname=$1
  echo "$fullname"
  # artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker
  docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) kristinn/pandocker:buster-full-latest "Vinnusvæði/Verkþáttur 5/${fullname}.md" -o "Vinnusvæði/Verkþáttur 5/${fullname}.pdf" --from markdown --filter pandoc-include --template 'lib/ist.tex' --listings --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache --citeproc --top-level-division=chapter --pdf-engine=xelatex
}
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)
ex "ÍST TS 310_2020 Domestic payments and deposits"
# docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker 'Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md' -o 'Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.pdf' --from markdown --filter pandoc-include --template 'lib/ist.tex' --listings --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache --top-level-division=chapter
# echo '313'
ex "ÍST TS 313_2021 Foreign payments"
# docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker 'Vinnusvæði/Verkþáttur 5/ÍST TS 313_2021 Foreign payments.md' -o 'Vinnusvæði/Verkþáttur 5/ÍST TS 313_2021 Foreign payments.pdf' --from markdown --template 'lib/ist.tex' --listings --filter pandoc-include --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache --top-level-division=chapter
echo 'done'