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

```
xmllint --format CH310663327779.xml -o CH310663327779.xml
xmllint --format CH667432068228.xml -o CH667432068228.xml
xmllint --format parceldescription_extract_fo.xslt -o parceldescription_extract_fo.xslt
java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH310663327779.xml -xsl:parceldescription_extract_fo.xslt -o:CH310663327779.fo
../../apps/fop-2.3/fop/fop -fo CH310663327779.fo -pdf CH310663327779.pdf -c fop.xconf
../../apps/fop-2.3/fop/fop -fo CH310663327779.fo -rtf CH310663327779.rtf -c fop.xconf

java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH667432068228.xml -xsl:parceldescription_extract_fo.xslt -o:CH667432068228.fo
../../apps/fop-2.3/fop/fop -fo CH667432068228.fo -pdf CH667432068228.pdf -c fop.xconf

```

**ÖREB**:

```

```






## TODO
- DISTINCT der Dokumente pro Gruppe (wie im statischen Auszug). Für Verifikation ist das hier aber einfacher zu lesen.
