<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Model or Package report creation
-->
	<xsl:template name="CREATE_MODEL-PACKAGE_REPORT">
		<xsl:param name="reportType">PACKAGE</xsl:param>
		<xsl:param name="fullParentName"/>
		<!-- Full element name  -->
		<xsl:variable name="full_name">
			<xsl:if test="$fullParentName">
				<xsl:value-of select="$fullParentName"/>::</xsl:if>
			<xsl:call-template name="SHOW_NAME">
				<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
			</xsl:call-template>
		</xsl:variable>
		<!--	Choose what include in the report -->
		<xsl:variable name="hasStereotypes" select="$showStereotypesSection and Foundation.Core.ModelElement.stereotype"/>
		<xsl:variable name="showAnyInnerElement">
			<xsl:call-template name="SHOW_ANY_INNER_ELEMENTS"/>
		</xsl:variable>
		<xsl:variable name="hasInnerElements" select="string-length($showAnyInnerElement)>0 and 
		($selectedPackagesIDs/self::node() = @xmi.id or $generateRecursively)"/>
		<xsl:variable name="hasRelationsTmp">
			<xsl:call-template name="HAS_RELATIONS"/>
		</xsl:variable>
		<xsl:variable name="hasRelations" select="string-length($hasRelationsTmp) > 0"/>
		<xsl:variable name="hasAnyInnerRelations">
			<xsl:call-template name="SHOW_ANY_INNER_RELATIONS"/>
		</xsl:variable>
		<xsl:variable name="hasInnerRelations" select="string-length($hasAnyInnerRelations) > 0"/>
		<xsl:variable name="hasTaggedValues" select="$showTaggedValuesSection and Foundation.Core.ModelElement.taggedValue"/>
		<xsl:variable name="hasConstraints" select="$showConstraintsSection and Foundation.Core.ModelElement.constraint"/>
		<xsl:variable name="hasHyperlinks">
			<xsl:call-template name="HAS_HYPERLINKS"/>
		</xsl:variable>
		<xsl:variable name="hasRequirements">
			<xsl:call-template name="HAS_REQUIREMENTS"/>
		</xsl:variable>
		<!-- Create Model or Package report -->
		<p/>
		<hr noshade="" size="1"/>
		<p/>
		<a name="{@xmi.id}">
			<font size="+2">
				<xsl:choose>
					<xsl:when test="@xmi.id = $rootModelID">Project <xsl:value-of select="$projectName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(Model<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<b>
							<xsl:value-of select="Foundation.Core.ModelElement.name"/>
						</b>)
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$reportType = 'MODEL'">Model</xsl:when>
							<xsl:otherwise>Package</xsl:otherwise>
						</xsl:choose>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<b>
							<xsl:value-of select="$full_name"/>
						</b>
					</xsl:otherwise>
				</xsl:choose>
			</font>
		</a>
		<p/>
		<!-- Comment -->
		<xsl:call-template name="SHOW_DOCUMENTATION"/>
		<p/>
		
		<!--    =========  Model/Package stereotypes [optional] ===========      -->
		<xsl:if test="$hasStereotypes">
			<br/>
			<xsl:call-template name="SHOW_STEREOTYPES"/>
		</xsl:if>
		<xsl:if test="$hasInnerElements">
			<br/>
			<xsl:call-template name="SHOW_INNER_ELEMENTS"/>
		</xsl:if>
		<xsl:if test="$hasRelations">
			<br/>
			<xsl:call-template name="SHOW_RELATIONS"/>
		</xsl:if>
		<xsl:if test="$hasInnerRelations and $generateRelations">
			<br/>
			<xsl:call-template name="SHOW_INNER_RELATIONS"/>
		</xsl:if>
		<xsl:if test="$hasTaggedValues">
			<br/>
			<xsl:call-template name="SHOW_TAGGED_VALUES"/>
		</xsl:if>
		<xsl:if test="$hasConstraints">
			<br/>
			<xsl:call-template name="SHOW_CONSTRAINTS"/>
		</xsl:if>
		<!--    =========  Hyperlinks [optional] ===========      -->
		<xsl:if test="string-length($hasHyperlinks) > 0">
			<br/>
			<xsl:call-template name="SHOW_HYPERLINKS"/>
		</xsl:if>
		<xsl:if test="string-length($hasRequirements) > 0">
			<br/>
			<xsl:call-template name="SHOW_REQUIREMENTS"/>
		</xsl:if>
		<xsl:call-template name="PARSE_COMMENT"/>
		<!-- This element was reported -->
		<xsl:call-template name="REPORTED_ELEMENT"/>
		<xsl:call-template name="REPORTED_PART"/>
	</xsl:template>
</xsl:stylesheet>
