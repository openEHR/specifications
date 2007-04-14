<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:redirect="org.apache.xalan.lib.Redirect" extension-element-prefixes="redirect">
	<!--
Template for Model or Package report creation
-->
	<xsl:template name="CREATE_MODEL-PACKAGE_REPORT">
		<xsl:param name="reportType">PACKAGE</xsl:param>
		<xsl:param name="full_name"/>
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
		<redirect:write file="{$reportDir}/{@xmi.id}Report.html">
			<html>
				<head>
					<title>
						<xsl:choose>
							<xsl:when test="$reportType = 'MODEL'">Model</xsl:when>
							<xsl:otherwise>Package</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="$full_name"/> Report</title>
				</head>
				<body bgcolor="#FFFFFF">
					<table width="100%" border="0" bgcolor="#EEEEFF">
						<tr>
							<td width="1" bgcolor="#EEEEFF">
								<font face="Courier New, Courier, mono" size="-1">
									<b>View:</b>
								</font>
							</td>
							<td bgcolor="#EEEEFF">
								<font size="-1">
									<a href="{@xmi.id}Report.html" target="_top">
									Hide Browser
								</a>
| <a href="indexLeft.html" target="_top">Browser on the left</a> | <a href="indexRight.html" target="_top">Browser on the right</a>
									<xsl:if test="$generateDictionary"> | <a href="Dictionary.html" target="_self">Dictionary</a>
									</xsl:if>
									<xsl:if test="$showUMLInfo"> | <xsl:choose>
											<xsl:when test="$reportType = 'MODEL'">
												<a href="UMLInfo/Model.html" target="_self">UML Info</a>
											</xsl:when>
											<xsl:otherwise>
												<a href="UMLInfo/Package.html" target="_self">UML Info</a>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</font>
							</td>
						</tr>
						<tr>
							<td width="1" bgcolor="#EEEEFF">
								<font face="Courier New, Courier, mono" size="-1">
									<b>Report:</b>
								</font>
							</td>
							<td bgcolor="#EEEEFF">
								<font size="-1">
									<xsl:if test="@xmi.id != $rootModelID">
										<a href="#general" target="_self">General Info</a>
									</xsl:if>
									<xsl:if test="$hasStereotypes"> | <a href="#stereotypes" target="_self">Stereotypes</a>
									</xsl:if>
									<xsl:if test="$hasInnerElements"> | <a href="#inner_elements" target="_self">Inner Elements</a>
									</xsl:if>
									<xsl:if test="$hasRelations"> | <a href="#relations" target="_self">Relations</a>
									</xsl:if>
									<xsl:if test="$hasInnerRelations"> | <a href="#inner_relations" target="_self">Inner Relations</a>
									</xsl:if>
									<xsl:if test="$hasTaggedValues"> | <a href="#tagged_values" target="_self">Tagged Values</a>
									</xsl:if>
									<xsl:if test="$hasConstraints"> | <a href="#constraints" target="_self">Constraints</a>
									</xsl:if>
									<xsl:if test="string-length($hasHyperlinks) > 0"> | <a href="#hyperlinks" target="_self">Hyperlinks</a>
									</xsl:if>
									<xsl:if test="string-length($hasRequirements) > 0"> | <a href="#requirements" target="_self">Requirements</a>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
					<hr noshade="" size="1"/>
					<p/>

<!-- First show parent package -->
					<xsl:if test="../../@xmi.id != $rootModelID">
						<xsl:if test="../../Foundation.Core.Namespace.ownedElement = ..">
							<xsl:text>Parent Package: </xsl:text>
							<a href="{../../@xmi.id}Report.html" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="../../Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
							<br/>
						</xsl:if>
					</xsl:if>
					
					
					
					
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
					<p/>
					<!-- Comment -->
					<xsl:call-template name="SHOW_DOCUMENTATION">
						<xsl:with-param name="createReport" select="true()"/>
					</xsl:call-template>
					<p/>
					<xsl:if test="@xmi.id != $rootModelID">
						
					</xsl:if>
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
					<xsl:if test="string-length($hasHyperlinks) > 0">
						<br/>
						<xsl:call-template name="SHOW_HYPERLINKS"/>
					</xsl:if>
					<xsl:if test="string-length($hasRequirements) > 0">
						<br/>
						<xsl:call-template name="SHOW_REQUIREMENTS"/>
					</xsl:if>
					<xsl:call-template name="PARSE_INNER_ELEMENTS"/>
					<xsl:call-template name="PARSE_INNER_RELATIONS"/>
				</body>
			</html>
		</redirect:write>
		<!-- This element was reported -->
		<xsl:call-template name="REPORTED_ELEMENT"/>
		<xsl:call-template name="REPORTED_PART"/>
	</xsl:template>
</xsl:stylesheet>
