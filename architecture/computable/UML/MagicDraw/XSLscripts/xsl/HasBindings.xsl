<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="HAS_BINDINGS">
		<xsl:param name="elementAssociations"/>
		<xsl:if test="not($showNoneRelations) and  ($showAllRelations and 
				(Foundation.Core.ModelElement.clientDependency or 
				Foundation.Core.ModelElement.supplierDependency ))">
			HAS_BINDINGS
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
