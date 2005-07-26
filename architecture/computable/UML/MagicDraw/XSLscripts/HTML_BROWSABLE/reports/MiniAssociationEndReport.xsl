<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Association End ordering only report
-->
	<xsl:template name="MINI_CREATE_ASSOCIATION_END_REPORT">
		<xsl:param name="associationEndElementName"/>
		<xsl:value-of select="Foundation.Core.AssociationEnd.ordering/@xmi.value"/>
	</xsl:template>
</xsl:stylesheet>
