<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--
Mini Template to show element name
-->
    <xsl:template name="MINI_SHOW_NAME">
        <xsl:param name="name" select="Foundation.Core.ModelElement.name"/>
        <xsl:value-of select="$name"/>
    </xsl:template>
</xsl:stylesheet>
