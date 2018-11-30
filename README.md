# xslfo-test

```
java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:Gedichte.xml -xsl:style01.xslt -o:output.html

../../apps/fop-2.3/fop/fop -fo belp.fo -pdf belp.pdf -c fop.xconf
../../apps/fop-2.3/fop/fop -fo parcel_extract.fo -pdf parcel_extract.pdf -c fop.xconf


java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:parcel_extract.xml -xsl:parcel_extract.xslt -o:parcel_extract.fo
xmllint --format parcel_extract.fo -o parcel_extract.fo

xmllint --format CH970687433258.xml -o CH970687433258.xml
xmllint --format landuseplans_extract_html.xslt -o landuseplans_extract_html.xslt
java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH970687433258.xml -xsl:landuseplans_extract_html.xslt -o:CH970687433258.html

```

## TODO
- DISTINCT der Dokumente pro Gruppe (wie im statischen Auszug). Für Verifikation ist das hier aber einfacher zu lesen.
