<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:extract="http://schemas.geo.admin.ch/V_D/OeREB/1.0/Extract" xmlns:data="http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData" exclude-result-prefixes="extract data" version="1.0">
  <xsl:output method="html" version="5" indent="yes"/>
  <xsl:decimal-format name="swiss" decimal-separator="." grouping-separator="'"/>
  <xsl:template match="extract:GetExtractByIdResponse">
    <html>
      <head>
        <title>
          <xsl:value-of select="data:Extract/data:RealEstate/data:EGRID"/>
          <xsl:text> at </xsl:text>
          <xsl:value-of select="format-dateTime(data:Extract/data:CreationDate,'[Y0001]-[M01]-[D01] [H01]:[m01]:[s01]')"/>
        </title>
      </head>
      <body bgcolor="#FFFFFF">
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="data:Extract">
    <xsl:apply-templates select="data:RealEstate"/>
  </xsl:template>
  <xsl:template match="data:RealEstate">
    <table border="1px" style="width:100%">
      <tr>
        <td>GB-Nr.:</td>
        <td>
          <xsl:value-of select="data:Number"/>
        </td>
      </tr>
      <tr>
        <td>EGRID:</td>
        <td>
          <xsl:value-of select="data:EGRID"/>
        </td>
      </tr>
      <tr>
        <td>NBIdent:</td>
        <td>
          <xsl:value-of select="data:IdentDN"/>
        </td>
      </tr>
      <tr>
        <td>Art:</td>
        <xsl:choose>
          <xsl:when test="data:Type = 'RealEstate'">
            <td>Liegenschaft</td>
          </xsl:when>
          <xsl:otherwise>
            <td>Baurecht</td>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
      <tr>
        <td>Fläche:</td>
        <td><xsl:value-of select="format-number(data:LandRegistryArea, &quot;#'###&quot;, &quot;swiss&quot;)"/>
           m<sup>2</sup> 
        </td>
      </tr>
      <tr>
        <td>Gemeinde:</td>
        <td>
          <xsl:value-of select="data:Municipality"/>
        </td>
      </tr>
      <tr>
        <td>BFS-Nr.:</td>
        <td>
          <xsl:value-of select="data:FosNr"/>
        </td>
      </tr>
      <tr>
        <td>Grundbuch:</td>
        <td>
          <xsl:value-of select="data:SubunitOfLandRegister"/>
        </td>
      </tr>
    </table>
    <br/>
    <br/>
    <!--
    <xsl:apply-templates select="data:RestrictionOnLandownership"/>
    -->
    <!-- Ich möchte eine hardcodierte Sortierung. Wie mache ich das ohne mehrfache for each Gruppen zu schreiben?-->
    <!-- 
    <xsl:for-each-group select="data:RestrictionOnLandownership[data:SubTheme='Erschliessung (Linienobjekt)']" group-by="data:SubTheme">
<xsl:value-of select="data:SubTheme"/>
<hr/>
    </xsl:for-each-group>
    -->    
    <xsl:for-each-group select="data:RestrictionOnLandownership" group-by="data:SubTheme">
    <xsl:sort data-type="number" order="ascending" select="((data:SubTheme='Grundnutzung') * 1) + 
          ((data:SubTheme='Überlagernde Festlegung') * 2) + 
          ((data:SubTheme='Erschliessung (Linienobjekt)') * 3) + 
          ((data:SubTheme='Kiwi') * 4) +
          ((data:SubTheme='Orange') * 5)"/>    
      <xsl:value-of select="data:SubTheme"/>
      <xsl:for-each select="current-group()">
      <xsl:value-of select="data:Information/data:LocalisedText/data:Text"/>
      </xsl:for-each>

      <hr/>
    </xsl:for-each-group>    
  </xsl:template>

  <xsl:template match="data:RestrictionOnLandownership"><hr/><i><xsl:value-of select="data:SubTheme"/></i>
     :::::: 
    <i><xsl:value-of select="data:Information/data:LocalisedText/data:Text"/></i>
  </xsl:template>
</xsl:stylesheet>
