<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template name="MODEL_REPORT">
		<xsl:for-each select="/XMI/XMI.content/Model_Management.Model">
			<xsl:call-template name="PARSE_PACKAGES"/>
		</xsl:for-each>
	</xsl:template>
	<!-- ================================================= -->
	<xsl:template name="PARSE_PACKAGES">
		<xsl:param name="isAncestorSelected" select="false()"/>
		<xsl:param name="parentFullName"/>
		<xsl:variable name="isSelected" select="$selectedPackagesIDs/self::node() = @xmi.id"/>
		<xsl:variable name="parentPath">
			<xsl:value-of select="$parentFullName"/>
			<xsl:if test="string-length($parentFullName) > 0">
				<xsl:value-of select="string('::')"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="packageName">
			<xsl:if test="@xmi.id != $rootModelID">
				<xsl:call-template name="SHOW_NAME"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="processChildren" select="$isSelected or ($isAncestorSelected and $generateRecursively)"/>
		<xsl:variable name="packageFullName" select="concat($parentPath, $packageName)"/>
		<xsl:if test="$isSelected or $isAncestorSelected">
			<xsl:call-template name="CREATE_MODEL-PACKAGE-SUBSYSTEM_REPORT">
				<xsl:with-param name="packageFullName" select="$packageFullName"/>
			</xsl:call-template>
			<xsl:if test="$processChildren">
				<xsl:call-template name="PARSE_INNER_ELEMENTS"/>
				<xsl:if test="$generateRelations">
					<xsl:call-template name="PARSE_INNER_RELATIONS"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Model_Management.Model | Foundation.Core.Namespace.ownedElement/Model_Management.Package | Foundation.Core.Namespace.ownedElement/Model_Management.Subsystem">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="@xmi.id"/>
			<xsl:call-template name="PARSE_PACKAGES">
				<xsl:with-param name="isAncestorSelected" select="$processChildren"/>
				<xsl:with-param name="parentFullName" select="$packageFullName"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
		<xsl:template name="CREATE_MODEL-PACKAGE-SUBSYSTEM_REPORT">
		<xsl:param name="packageFullName"/>
		<xsl:choose>
			<xsl:when test="local-name() = 'Model_Management.Model'">
				<xsl:call-template name="CREATE_MODEL-PACKAGE_REPORT">
					<xsl:with-param name="reportType">MODEL</xsl:with-param>
					<xsl:with-param name="full_name" select="$packageFullName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="local-name() = 'Model_Management.Package'">
				<xsl:call-template name="CREATE_MODEL-PACKAGE_REPORT">
					<xsl:with-param name="reportType">PACKAGE</xsl:with-param>
					<xsl:with-param name="full_name" select="$packageFullName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="local-name() = 'Model_Management.Subsystem'">
				<xsl:call-template name="CREATE_SUBSYSTEM_REPORT">
					<xsl:with-param name="full_name" select="$packageFullName"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- Template for creating report of model, package or subsystem -->
	
</xsl:stylesheet>
