<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:extract="http://geo.so.ch/schema/AGI/LandRegisterParcelDescription/1.0/Extract">

 <xsl:template match="extract:GetExtractByXYResponse">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsd="https://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <fo:layout-master-set>
    <fo:simple-page-master master-name="mainPage" page-height="297mm" page-width="210mm" margin-top="12mm" margin-bottom="12mm" margin-left="15mm" margin-right="12mm">
      <fo:region-body margin-top="45mm" background-color="#FFFF00"/>
      <fo:region-before extent="40mm" background-color="#FFFFFF"/>
      <fo:region-after extent="10mm" background-color="#00FFFF"/>
    </fo:simple-page-master>
  </fo:layout-master-set>

    <html> 
      <head> 
        <title> <xsl:value-of select="title"/>
      </title>
     </head>
     <body bgcolor="#ffffff">
      <xsl:value-of select="RealEstate/EGRID"/>
     </body>
    </html>
</fo:root>

   </xsl:template>

 </xsl:stylesheet>
