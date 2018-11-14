<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="iso-8859-1"/>
  <xsl:template match="/">
    <html>
      <body>
        <h2>
          <xsl:apply-templates/>
        </h2>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
