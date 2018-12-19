<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" version="1.0" indent="yes"/>
  <xsl:template match="AuthorList">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <!-- Layout for the table of content -->
        <fo:simple-page-master master-name="table" page-height="29.7cm" page-width="21cm" margin="1cm">
          <fo:region-body column-count="1" background-color="transparent"/>
          <fo:region-after extent="2cm"/>
        </fo:simple-page-master>
        <!-- Layout for individual sheets -->
        <fo:simple-page-master master-name="sheet" page-height="21cm" page-width="29.7cm" margin="2cm">
          <fo:region-body column-count="1" background-color="transparent"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <!-- First part of the PDF output: table of content -->
      <fo:page-sequence master-reference="table">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates select="Author" mode="toc"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
      <!-- Second part of the PDF output: sheets for authors -->
      <xsl:apply-templates select="Author" mode="sheet"/>
    </fo:root>
  </xsl:template>
  <xsl:template match="Author" mode="toc">
    <fo:block>
        Must put here the table of content
      </fo:block>
  </xsl:template>
  <xsl:template match="Author" mode="sheet">
    <fo:page-sequence master-reference="sheet">
      <fo:flow flow-name="xsl-region-body">
        <fo:block font-family="sans-serif" font-size="22pt" text-align="center">
          <xsl:apply-templates select="name"/>
        </fo:block>
        <fo:block font-family="sans-serif" font-size="12pt" text-align="justify">
          <xsl:apply-templates select="biography"/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>
</xsl:stylesheet>
