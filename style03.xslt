<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="iso-8859-1"/>
    <xsl:template match="Gedichtsammlung">
        <html>
            <body>
                <xsl:value-of select="."/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>