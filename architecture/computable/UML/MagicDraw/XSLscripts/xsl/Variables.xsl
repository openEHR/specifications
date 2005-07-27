<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:redirect="org.apache.xalan.lib.Redirect" extension-element-prefixes="redirect">
	<xsl:variable name="FIGURE_NUMBER" select="string('figureNumber')"/>
	<xsl:template name="INIT_VARIABLES">
		<xsl:call-template name="SET_VARIABLE">
			<xsl:with-param name="name" select="$FIGURE_NUMBER"/>
			<xsl:with-param name="value" select="string('1')"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="VARIABLE_FILE_NAME">
		<xsl:param name="name"/>
		<xsl:value-of select="concat($reportDir, '/', $name, '.xml')"/>
	</xsl:template>
	<!-- Set variable value -->
	<xsl:template name="SET_VARIABLE">
		<xsl:param name="name"/>
		<xsl:param name="value"/>
		<xsl:variable name="fileName">
			<xsl:call-template name="VARIABLE_FILE_NAME">
				<xsl:with-param name="name" select="$name"/>
			</xsl:call-template>
		</xsl:variable>
		<redirect:write file="{$fileName}">
			<value>
				<xsl:value-of select="$value"/>
			</value>
		</redirect:write>
	</xsl:template>
	<!-- Get variable value -->
	<xsl:template name="GET_VARIABLE">
		<xsl:param name="name"/>
		<xsl:variable name="fileName">
			<xsl:call-template name="VARIABLE_FILE_NAME">
				<xsl:with-param name="name" select="$name"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- Do not cache document -->
		<xsl:for-each select="document($fileName)">
			<?xalan:doc-cache-off?>
			<xsl:value-of select="value"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
