<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:gml="https://www.opengis.net/gml/3.2"  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:extract="http://schemas.geo.admin.ch/V_D/OeREB/1.0/Extract" xmlns:data="http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData" exclude-result-prefixes="gml xlink extract data" version="3.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:decimal-format name="swiss" decimal-separator="." grouping-separator="'"/>  
  <xsl:template match="extract:GetExtractByIdResponse/data:Extract">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsd="https://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="mainPage" page-height="297mm" page-width="210mm" margin-top="10mm" margin-bottom="12mm" margin-left="18mm" margin-right="18mm"> 
          <fo:region-body margin-top="30mm" background-color="yellow"/>
          <fo:region-before extent="30mm" background-color="transparent"/>
          <fo:region-after extent="3mm" background-color="khaki"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
    <fo:page-sequence master-reference="mainPage" id="page-sequence-id">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block>
            <fo:block-container absolute-position="absolute" top="0mm" left="0mm" background-color="transparent">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:external-graphic width="44mm" content-width="scale-to-fit" >
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="data:FederalLogo"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>

            <fo:block-container absolute-position="absolute" top="0mm" left="60mm" background-color="transparent">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:external-graphic border="0pt solid black" width="30mm" height="13mm" scaling="uniform" content-width="scale-to-fit" content-height="scale-to-fit" text-align="center">
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="data:CantonalLogo"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>

            <fo:block-container absolute-position="absolute" top="0mm" left="95mm" background-color="transparent">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:external-graphic width="30mm" height="13mm" scaling="uniform" content-width="scale-to-fit" content-height="scale-to-fit" text-align="center">
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="data:MunicipalityLogo"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>

            <fo:block-container absolute-position="absolute" top="0mm" left="139mm" background-color="transparent">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:external-graphic width="35mm" height="10mm" scaling="non-uniform" content-width="scale-to-fit" content-height="scale-to-fit">
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="data:LogoPLRCadastre"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>

            <fo:block-container absolute-position="absolute" top="19mm" left="0mm">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.2pt"/>
              </fo:block>
            </fo:block-container>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
            <fo:block-container absolute-position="absolute" top="0mm" left="0mm">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.8pt"/>
              </fo:block>
              <fo:table table-layout="fixed" width="100%" margin-top="0.5mm" font-size="6.5pt" font-weight="400" font-family="Cadastra">
                <fo:table-column column-width="50%"/>
                <fo:table-column column-width="50%"/>
                <fo:table-body>
                  <fo:table-row vertical-align="bottom">
                    <fo:table-cell vertical-align="bottom">
                      <fo:block vertical-align="bottom">
                        <xsl:value-of select="format-dateTime(data:CreationDate,'[D01].[M01].[Y0001]')"/><fo:inline padding-left="1em"><xsl:value-of select="format-dateTime(data:CreationDate,'[H01]:[m01]:[s01]')"/></fo:inline><fo:inline padding-left="1em"><xsl:value-of select="data:ExtractIdentifier"/></fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right">
                      <fo:block>Seite <fo:page-number/>/<fo:page-number-citation-last ref-id="page-sequence-id"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>

            </fo:block-container>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <!--font size should be 18pt but that seems to large and will lead to non-directive conform line break behaviour-->
          <fo:block-container height="28mm" background-color="green">
            <fo:block line-height="21pt" linefeed-treatment="preserve" font-weight="700" font-size="17.7pt" font-family="Cadastra">Auszug aus dem Kataster der&#x000A;öffentlich-rechtlichen Eigentumsbeschränkungen&#x000A;(ÖREB-Kataster)</fo:block>
          </fo:block-container>            
          <!--<xsl:apply-templates/>-->

            <fo:block-container height="109mm" background-color="gold">
              <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm">
                <fo:external-graphic border="0.2pt solid black" width="174mm" height="99mm" scaling="uniform" content-width="scale-to-fit" content-height="scale-to-fit">
                  <xsl:attribute name="src">
                    <xsl:text>url('data:</xsl:text>
                    <xsl:text>image/png;base64,</xsl:text>
                    <xsl:value-of select="data:RealEstate/data:PlanForLandRegisterMainPage"/>
                    <xsl:text>')</xsl:text>
                  </xsl:attribute>
                </fo:external-graphic>
              </fo:block>
            </fo:block-container>

            <fo:block-container font-weight="400" font-size="8.5pt" font-family="Cadastra" background-color="orange">
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="68mm"/>
                <fo:table-column column-width="106mm"/>
                <fo:table-body>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block font-weight="700">Grundstück-Nr.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block font-weight="700"><xsl:value-of select="data:RealEstate/data:Number"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>E-GRID</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block><xsl:value-of select="data:RealEstate/data:EGRID"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>Gemeinde (BFS-Nr.)</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block><xsl:value-of select="data:RealEstate/data:Municipality"/> (<xsl:value-of select="data:RealEstate/data:FosNr"/>)</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>Grundbuchkreis</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block><xsl:value-of select="data:RealEstate/data:SubunitOfLandRegister"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>Fläche</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block line-height-shift-adjustment="disregard-shifts"><xsl:value-of select="format-number(data:RealEstate/data:LandRegistryArea, &quot;#'###&quot;, &quot;swiss&quot;)"/> m<fo:inline baseline-shift="super" font-size="60%">2</fo:inline></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block-container>

            <fo:block-container margin-top="10mm" font-weight="400" font-size="8.5pt" font-family="Cadastra" background-color="aquamarine">
              <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="68mm"/>
                <fo:table-column column-width="106mm"/>
                <fo:table-body>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block font-weight="700">Auszugsnummer</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block font-weight="700"><xsl:value-of select="data:ExtractIdentifier"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>Erstellungsdatum des Auszugs</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block><xsl:value-of select="format-dateTime(data:CreationDate,'[D01].[M01].[Y0001]')"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row border-bottom="0.2pt solid black" vertical-align="middle" line-height="6mm">
                    <fo:table-cell>
                      <fo:block>Katasterverantwortliche Stelle</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <!-- THIS IS UGLY!!!!! AND HIGHLY FORBIDDEN. But I think the namespace in the input xml is wrong (httpS instead of only http) -->
                      <fo:block><xsl:value-of select="*[local-name()='PLRCadastreAuthority']/*[local-name()='Name']/*[local-name()='LocalisedText']/*[local-name()='Text']"/>, <xsl:value-of select="*[local-name()='PLRCadastreAuthority']/*[local-name()='Street']"/><xsl:text> </xsl:text><xsl:value-of select="*[local-name()='PLRCadastreAuthority']/*[local-name()='Number']"/>, <xsl:value-of select="*[local-name()='PLRCadastreAuthority']/*[local-name()='PostalCode']"/><xsl:text> </xsl:text><xsl:value-of select="*[local-name()='PLRCadastreAuthority']/*[local-name()='City']"/></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block-container>
>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="data:Extract">
    <fo:block-container font-size="12pt" margin-left="5mm" margin-bottom="5mm">
      <fo:block>
           gaga
        </fo:block>
      <fo:block>
        <xsl:value-of select="data:CreationDate"/>
      </fo:block>
      <fo:block>
        <xsl:value-of select="format-dateTime(data:CreationDate, '[D01].[M01].[Y0001]')"/>
      </fo:block>
      <!-- <xsl:apply-templates select="data:CreationDate"/> -->
    </fo:block-container>
  </xsl:template>
  <!--
    <xsl:template match="data:CreationDate">
        <fo:block>
            <xsl:value-of select="."/>
        </fo:block>
        <fo:block>
           asdfasdfasdf
        </fo:block>
        
    </xsl:template>
    -->
</xsl:stylesheet>
