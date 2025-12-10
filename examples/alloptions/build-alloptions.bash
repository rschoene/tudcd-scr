#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

if [[ -f "out.pdf" ]]; then
  rm out.pdf
fi


for mainfile in main*.tex; do
    #echo $mainfile
    class=${mainfile%.*}
    class=${class##main-}
    for logocolor in logocolor-*; do
        #echo $logocolor
        color=${logocolor%.*}
        color=${color##logocolor-}
        echo $color
        for logolang in logolang-*; do
            lang=${logolang%.*}
            lang=${lang##logolang-}
            #echo $logolang
            for usemargin in margin-*.tex; do
                margin=${usemargin%.*}
                margin=${margin##margin-}

                echo "\\subtitle{Mit $color, $lang, $margin}" > tempsubtitle.tex

                cat $mainfile $logocolor $logolang $usemargin tempsubtitle.tex "content-$class.tex" > tempmain.tex

                pdflatex "-jobname=main-$class-$color-$lang-$margin" tempmain.tex
            done
        done
    done
done

qpdf --empty --pages *.pdf -- out.pdf
mv out.pdf ../out.pdf
rm *.pdf
rm *.log
rm *.aux
mv ../out.pdf out.pdf