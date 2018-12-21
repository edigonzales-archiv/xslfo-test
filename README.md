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
../../apps/fop-2.3/fop/fop -fo CH667432068228.fo -pdf CH667432068228_.pdf -c fop.xconf

```

**ÖREB**:

```
https://oereb.gis-daten.ch/oereb/extract/reduced/xml/CH907705273474
https://oereb.gis-daten.ch/oereb/extract/reduced/xml/CH527898340565
CH527898340565

https://geoview.bl.ch/main/oereb/extract/reduced/xml/geometry/CH167807397430?WITHIMAGES
https://geoview.bl.ch/main/oereb/extract/reduced/xml/geometry/CH567107399166?WITHIMAGES

https://maps.zh.ch/oerebauszug.pdf?bfs=261&nr=RI4014
http://maps.zh.ch/oereb/extract/reduced/xml/CH607722082391?WITHIMAGES&auszug_art=1 

java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH907705273474.xml -xsl:oereb_title_page.xslt -o:CH907705273474.fo
../../../apps/fop-2.3/fop/fop -fo CH907705273474.fo -pdf CH907705273474_.pdf -c fop.xconf


(Zwei Grundnutzungstypen -> wegen Distinct)
java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH527898340565.xml -xsl:oereb_title_page.xslt -o:CH527898340565.fo
../../../apps/fop-2.3/fop/fop -fo CH527898340565.fo -pdf CH527898340565_.pdf -c fop.xconf

java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:CH527898340565_group_by.xml -xsl:oereb_group_by.xslt -o:CH527898340565_group_by.fo
../../../apps/fop-2.3/fop/fop -fo CH527898340565_group_by.fo -pdf CH527898340565_group_by.pdf -c fop.xconf

java -jar /Users/stefan/apps/saxonHE990/saxon9he.jar -s:BL/CH567107399166_geometry_images.xml -xsl:oereb_title_page_bl.xslt -o:CH567107399166_geometry_images.fo
../../../apps/fop-2.3/fop/fop -fo CH567107399166_geometry_images.fo -pdf CH567107399166_geometry_images.pdf -c fop.xconf

```

## Distinct-Problematik

Eine Lösung ist via distinct-values(current-group()/.....). Das ist aber mühsam, weil dann nicht ein Node verfügbar ist, sondern nur der AtomicValue.
```
              <xsl:for-each select="distinct-values(current-group()/data:Map/data:Image)">
                <fo:block linefeed-treatment="preserve" font-weight="400" font-size="11pt" font-family="Cadastra">abc</fo:block>
              </xsl:for-each>
```



## TODO
- DISTINCT der Dokumente pro Gruppe (wie im statischen Auszug). Für Verifikation ist das hier aber einfacher zu lesen.
