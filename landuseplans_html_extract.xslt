<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:extract="http://schemas.geo.admin.ch/V_D/OeREB/1.0/Extract" xmlns:data="http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData" exclude-result-prefixes="extract data" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="extract:GetExtractByIdResponse">
    <html>
      <head>
        <title>
          <xsl:value-of select="title"/>
        </title>
      </head>
      <body bgcolor="#ffffff">
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="title">
    <h1 align="center">
      <xsl:apply-templates/>
    </h1>
  </xsl:template>
  <xsl:template match="content">
    <p align="center">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="comment">
    <hr/>
    <i>
      <xsl:apply-templates/>
    </i>
  </xsl:template>
</xsl:stylesheet>
