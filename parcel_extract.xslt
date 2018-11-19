<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:extract="http://geo.so.ch/schema/AGI/LandRegisterParcelDescription/1.0/Extract" exclude-result-prefixes="extract" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:decimal-format name="swiss" decimal-separator="." grouping-separator="&apos;"/>
  <xsl:template match="extract:GetExtractByXYResponse">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsd="https://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="mainPage" page-height="297mm" page-width="210mm" margin-top="12mm" margin-bottom="12mm" margin-left="15mm" margin-right="12mm">
          <fo:region-body margin-top="45mm" background-color="#FFFF00"/>
          <fo:region-before extent="40mm" background-color="#FFFFFF"/>
          <fo:region-after extent="10mm" background-color="#00FFFF"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="mainPage" id="my-sequence-id">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block>
            <fo:block-container absolute-position="absolute" top="6.7mm" left="0mm" line-height="1em" background-color="#FFFFFF">
              <fo:block font-size="10pt" font-style="italic" font-weight="700" font-family="Frutiger">
                <xsl:value-of select="extract:Extract/extract:ResponsibleOffice/extract:Name"/>
              </fo:block>
              <fo:block font-size="10pt" font-style="italic" font-weight="400" font-family="Frutiger" margin-left="6mm" margin-top="1mm">
                <fo:block>
              Rötistrasse 4
            </fo:block>
                <fo:block>
              4501 Solothurn
            </fo:block>
                <fo:block>
              Telefon 032 627 75 92
            </fo:block>
                <fo:block>
              agi@bd.so.ch
            </fo:block>
                <fo:block>
              www.agi.so.ch
            </fo:block>
              </fo:block>
            </fo:block-container>
            <fo:block-container absolute-position="absolute" top="0mm" left="123mm" background-color="#FFFFFF">
              <fo:block>
                <fo:external-graphic height="6.7mm" width="60mm" content-width="scale-to-fit" content-height="scale-to-fit">
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="extract:Extract/extract:CantonalLogo"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container wrap-option="wrap" hyphenate="false" hyphenation-character="-" font-weight="700" font-size="14pt" font-family="Frutiger">
            <fo:table table-layout="fixed" width="100%">
              <fo:table-column column-width="90mm"/>
              <fo:table-column column-width="90mm"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block>Grundstücksbeschrieb</fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block>GB-Nr. 7517</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block-container>
          <fo:block-container wrap-option="wrap" hyphenate="false" hyphenation-character="-" font-weight="400" font-size="10pt" font-family="Frutiger">
            <fo:table table-layout="fixed" width="100%" margin-top="8mm">
              <fo:table-column column-width="40mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="20mm"/>
              <fo:table-column column-width="40mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>Gemeinde:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block>Grenchen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block/>
                  </fo:table-cell>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>EGRID:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block>CH667432068228</fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>Grundbuch:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block>Grenchen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block/>
                  </fo:table-cell>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>NBIdent:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block>SO0200002546</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block-container>
          <fo:block-container wrap-option="wrap" hyphenate="false" hyphenation-character="-" font-weight="400" font-size="10pt" font-family="Frutiger">
            <fo:table table-layout="fixed" width="100%" margin-top="12mm">
              <fo:table-column column-width="40mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>Grundstücksart:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                    <fo:block>Liegenschaft</fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell font-weight="700" padding-top="2mm">
                    <fo:block>Grundstücksfläche:</fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-top="2mm">
                  <!--use area!!!! not number-->
                    <fo:block><xsl:value-of select='format-number(extract:Extract/extract:RealEstate/extract:Number, "#&apos;###", "swiss")'/> m<fo:inline baseline-shift="30%" font-size="70%">2</fo:inline></fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
