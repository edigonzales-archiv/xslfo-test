<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:gml="https://www.opengis.net/gml/3.2"  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:extract="http://schemas.geo.admin.ch/V_D/OeREB/1.0/Extract" xmlns:data="http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData" exclude-result-prefixes="gml xlink extract data" version="3.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:decimal-format name="swiss" decimal-separator="." grouping-separator="'"/>  
  <xsl:template match="extract:GetExtractByIdResponse/data:Extract">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsd="https://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="mainPage" page-height="297mm" page-width="210mm" margin-top="10mm" margin-bottom="12mm" margin-left="18mm" margin-right="18mm"> 
          <fo:region-body margin-top="30mm" margin-bottom="5mm" background-color="transparent"/>
          <fo:region-before extent="30mm" background-color="transparent"/>
          <fo:region-after extent="3mm" background-color="transparent"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
    <fo:page-sequence master-reference="mainPage" id="page-sequence-id">
        <fo:flow flow-name="xsl-region-body">
          <!--font size should be 18pt but that seems to large and will lead to non-directive conform line break behaviour-->
          <fo:block-container height="28mm" background-color="transparent">
            <fo:block line-height="21pt" linefeed-treatment="preserve" font-weight="700" font-size="17.7pt" font-family="Cadastra">Auszug aus dem Kataster der&#x000A;öffentlich-rechtlichen Eigentumsbeschränkungen&#x000A;(ÖREB-Kataster)</fo:block>
          </fo:block-container>            

          <fo:block-container height="109mm" background-color="transparent">
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

          <!-- print table of contents -->
          <!--<xsl:apply-templates select="data:RealEstate" mode="toc" />-->

        </fo:flow>
      </fo:page-sequence>
      <!-- print grouped RestrictionOnLandownership pdf pages -->
      <xsl:apply-templates select="data:RealEstate" mode="sheet"/>
    </fo:root>
  </xsl:template>

  <!-- Template for pdf restriction on landownership pages aka "the real output". Sorting is bit of a hack. Perhaps this whole TOC thing can -->
  <!-- be made much simpler with better apply-templates strategy.-->
  <xsl:template match="data:RealEstate" mode="sheet">
    <fo:page-sequence master-reference="mainPage" id="page-sequence-id">
      <fo:flow flow-name="xsl-region-body">
        <fo:block>
            <xsl:for-each-group select="data:RestrictionOnLandownership" group-by="data:Theme">
            <!-- Wie geht das, wenn die Namen beliebig sein können? Nach Themen-Code? -->
              <xsl:sort data-type="number" order="ascending" select="(number(data:Theme/data:Code='LandUsePlans') * 1) + (number(data:Theme/data:Code='MotorwaysProjectPlaningZones') * 2) + (number(data:Theme/data:Code='MotorwaysBuildingLines') * 3) + (number(data:Theme/data:Code='RailwaysProjectPlanningZones') * 4) + (number(data:Theme/data:Code='RailwaysBuildingLines') * 5) + (number(data:Theme/data:Code='AirportsProjectPlanningZones') * 6) + (number(data:Theme/data:Code='AirportsBuildingLines') * 7) + (number(data:Theme/data:Code='AirportsSecurityZonePlans') * 8) + (number(data:Theme/data:Code='ContaminatedSites') * 9) + (number(data:Theme/data:Code='ContaminatedMilitarySites') * 10) + (number(data:Theme/data:Code='ContaminatedCivilAviationSites') * 11) + (number(data:Theme/data:Code='ContaminatedPublicTransportSites') * 12) + (number(data:Theme/data:Code='GroundwaterProtectionZones') * 13) + (number(data:Theme/data:Code='GroundwaterProtectionSites') * 14) + (number(data:Theme/data:Code='NoiseSensitivityLevels') * 15) + (number(data:Theme/data:Code='ForestPerimeters') * 16) + (number(data:Theme/data:Code='ForestDistanceLines') * 17)"/>
              <fo:block-container height="13mm" background-color="transparent">
                <fo:block id="{generate-id()}" page-break-before="always" line-height="18pt" linefeed-treatment="preserve" font-weight="700" font-size="15pt" font-family="Cadastra"><xsl:value-of select="data:Theme/data:Text/data:Text"/> (data:Theme/data:Text/data:Text)</fo:block>
              </fo:block-container> 
              <fo:block-container height="105mm" background-color="gold">
                <fo:block font-size="0pt" padding="0mm" margin="0mm" line-height="0mm" font-family="Cadastra">Platzhalter unsichtbar</fo:block>
              </fo:block-container>            


              <xsl:if test="current-group()/data:SubTheme">
                <fo:block line-height="18pt" linefeed-treatment="preserve" font-weight="400" font-size="12pt" font-family="Cadastra">Es hat SubThemes</fo:block>
              </xsl:if>

              <xsl:if test="not(current-group()/data:SubTheme)">
                <fo:block line-height="18pt" linefeed-treatment="preserve" font-weight="400" font-size="12pt" font-family="Cadastra">Es hat keine SubThemes</fo:block>
              </xsl:if>


              <xsl:for-each select="current-group()/data:SubTheme"> 
                <fo:block line-height="18pt" linefeed-treatment="preserve" font-weight="700" font-size="12pt" font-family="Cadastra"><xsl:value-of select="."/> (data:SubTheme)</fo:block>
              </xsl:for-each>



          

            </xsl:for-each-group>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <!-- Template for the table of contents. Sorting is bit of a hack. Perhaps this whole TOC thing can -->
  <!-- be made much simpler with better apply-templates strategy.-->
  <xsl:template match="data:RealEstate" mode="toc">
    <fo:block-container margin-bottom="10mm" font-weight="400" font-size="8.5pt" font-family="Cadastra" background-color="transparent">
      <fo:table table-layout="fixed" width="100%">
        <fo:table-column column-width="7mm"/>
        <fo:table-column column-width="167mm"/>
        <fo:table-body>
          <fo:table-row vertical-align="middle">
            <fo:table-cell>
              <fo:block margin-top="1mm" margin-bottom="2.8mm" font-weight="700" font-size="6.5pt">Seite</fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block/>
            </fo:table-cell>
          </fo:table-row>
          <xsl:for-each-group select="data:RestrictionOnLandownership" group-by="data:SubTheme">
          <xsl:sort data-type="number" order="ascending" select="(number(data:Theme/data:Code='LandUsePlans') * 1) + (number(data:Theme/data:Code='MotorwaysProjectPlaningZones') * 2) + (number(data:Theme/data:Code='MotorwaysBuildingLines') * 3) + (number(data:Theme/data:Code='RailwaysProjectPlanningZones') * 4) + (number(data:Theme/data:Code='RailwaysBuildingLines') * 5) + (number(data:Theme/data:Code='AirportsProjectPlanningZones') * 6) + (number(data:Theme/data:Code='AirportsBuildingLines') * 7) + (number(data:Theme/data:Code='AirportsSecurityZonePlans') * 8) + (number(data:Theme/data:Code='ContaminatedSites') * 9) + (number(data:Theme/data:Code='ContaminatedMilitarySites') * 10) + (number(data:Theme/data:Code='ContaminatedCivilAviationSites') * 11) + (number(data:Theme/data:Code='ContaminatedPublicTransportSites') * 12) + (number(data:Theme/data:Code='GroundwaterProtectionZones') * 13) + (number(data:Theme/data:Code='GroundwaterProtectionSites') * 14) + (number(data:Theme/data:Code='NoiseSensitivityLevels') * 15) + (number(data:Theme/data:Code='ForestPerimeters') * 16) + (number(data:Theme/data:Code='ForestDistanceLines') * 17)"/>
            <fo:table-row line-height="6mm" border-bottom="0.2pt solid black" vertical-align="middle">
              <fo:table-cell>
                <fo:block>
                  <fo:basic-link internal-destination="{generate-id(.)}">
                    <fo:page-number-citation ref-id="{generate-id(.)}"/>
                  </fo:basic-link>  
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block>
                  <fo:basic-link internal-destination="{generate-id(.)}">
                    <xsl:value-of select="data:Theme/data:Text/data:Text"/>
                  </fo:basic-link>  
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </xsl:for-each-group>
        </fo:table-body>
      </fo:table>
    </fo:block-container>
  </xsl:template>



</xsl:stylesheet>
