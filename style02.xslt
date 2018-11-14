<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="iso-8859-1" />
    <xsl:template match="Gedichtsammlung">
        <html>
            <body>
                <h1>Gedichtsammlung</h1>
                <p>
                    <xsl:call-template name="Titel"/>
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="Titel">
        <br/>Titel: <xsl:apply-templates select="Gedicht/Titel"/>
    </xsl:template>
    <xsl:template match="Titel">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
</xsl:stylesheet>
