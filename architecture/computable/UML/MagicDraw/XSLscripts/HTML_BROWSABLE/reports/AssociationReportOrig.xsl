<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:redirect="org.apache.xalan.lib.Redirect" extension-element-prefixes="redirect">
	<!--
Template for Association report
-->
	<xsl:template name="CREATE_ASSOCIATION_REPORT">
		<xsl:variable name="hasStereotypes" select="$showStereotypesSection and Foundation.Core.ModelElement.stereotype"/>
		<xsl:variable name="hasRelationsTmp">
			<xsl:call-template name="HAS_RELATIONS"/>
		</xsl:variable>
		<xsl:variable name="hasRelations" select="string-length($hasRelationsTmp) > 0"/>
		<xsl:variable name="hasTaggedValues" select="$showTaggedValuesSection and Foundation.Core.ModelElement.taggedValue"/>
		<xsl:variable name="hasConstraints" select="$showConstraintsSection and Foundation.Core.ModelElement.constraint"/>
		<xsl:variable name="hasHyperlinks">
			<xsl:call-template name="HAS_HYPERLINKS"/>
		</xsl:variable>
		<xsl:variable name="hasRequirements">
			<xsl:call-template name="HAS_REQUIREMENTS"/>
		</xsl:variable>
		<!-- Create Association report -->
		<!-- -->
		<redirect:write file="{$reportDir}/{@xmi.id}Report.html">
			<html>
				<head>
					<title>Association <xsl:value-of select="Foundation.Core.ModelElement.name"/> Report</title>
				</head>
				<body bgcolor="#FFFFFF">
					<a name="{@xmi.id}"/>
					<!--            ===========  Report header ===========             -->
					<!--            ===================================             -->
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
									<xsl:if test="$showUMLInfo"> | <a href="UMLInfo/Association.html" target="_self">UML Info</a>
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
									<a href="#general" target="_self">General Info</a>
									<xsl:if test="$hasStereotypes"> | <a href="#stereotypes" target="_self">Stereotypes</a>
									</xsl:if> | <a href="#association_end" target="_self">Association Ends</a>
									<xsl:if test="$hasRelations"> | <a href="#relations" target="_self">Relations</a>
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
					<!--            ===========  Report body ===========             -->
					<!--            =================================             -->
					<p/>
					<!--         Element type and name             -->
					<font size="+2">Association<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<b>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</b>
					</font>
					<p/>
					<!--         Association hierarchy          -->
					<xsl:call-template name="SUPER_ELEMENTS">
						<xsl:with-param name="elementType" select="string('Association')"/>
					</xsl:call-template>
					<xsl:call-template name="SUB_ELEMENTS">
						<xsl:with-param name="title" select="string('Direct Derived Associations:')"/>
						<xsl:with-param name="elementType" select="string('Association')"/>
					</xsl:call-template>
					<p/>
					<!--         Comment             -->
					<xsl:call-template name="SHOW_DOCUMENTATION">
						<xsl:with-param name="createReport" select="true()"/>
					</xsl:call-template>
					<p/>
					<!--            ===========  General information ===========             -->
					<table width="100%" border="1" cellspacing="0">
						<tr bgcolor="#CCCCFF">
							<td colspan="2">
								<b>
									<font size="+1">
										<a name="general">General Info
										</a>
									</font>
								</b>
							</td>
						</tr>
						<!--         Association name    [mandatory]         -->
						<tr>
							<td width="1">
								<b>Name<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
								</b>
							</td>
							<td>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- State/Activity diagram -->
						<xsl:call-template name="SHOW_STATE_ACTIVITY_DIAGRAM"/>
						<!-- Generalizable element general info -->
						<xsl:call-template name="SHOW_GENERALIZABLE_GENERAL_INFO"/>
					</table>
					<!--    =========  Association stereotypes [optional] ===========      -->
					<xsl:if test="$hasStereotypes">
						<br/>
						<xsl:call-template name="SHOW_STEREOTYPES"/>
					</xsl:if>
					<br/>
					<!--       Association Ends      [mandatory]        -->
					<table width="100%" border="1" cellspacing="0">
						<tr bgcolor="#CCCCFF">
							<td colspan="4">
								<b>
									<font size="+1">
										<a name="association_end">Association Ends</a>
									</font>
								</b>
							</td>
						</tr>
						<tr>
							<td bgcolor="#CCCCCC">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td>
								<b>Name</b>
							</td>
							<td>
								<b>Multiplicity</b>
							</td>
							<td>
								<b>Element</b>
							</td>
						</tr>
						<xsl:for-each select="Foundation.Core.Association.connection/Foundation.Core.AssociationEnd">
							<tr>
								<td nowrap="">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<b>End<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>A</b>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<b>End<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>B</b>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<a href="#{@xmi.id}" target="_self">
										<xsl:call-template name="SHOW_NAME">
											<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
										</xsl:call-template>
									</a>
								</td>
								<td>
									<!--         Association End  multiplicity       -->
									<xsl:for-each select="Foundation.Core.AssociationEnd.multiplicity">
										<xsl:call-template name="SHOW_MULTIPLICITY"/>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td>
									<a href="{Foundation.Core.AssociationEnd.type/*/@xmi.idref}Report.html" target="_self">
										<xsl:call-template name="SHOW_NAME">
											<xsl:with-param name="name" select="key('ElementByID', Foundation.Core.AssociationEnd.type/*/@xmi.idref)/Foundation.Core.ModelElement.name"/>
										</xsl:call-template>
									</a>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<!--    =========  Association relations [optional] ===========      -->
					<xsl:if test="$hasRelations">
						<br/>
						<xsl:call-template name="SHOW_RELATIONS"/>
					</xsl:if>
					<!--    =========  Association tagged values [optional] ===========      -->
					<xsl:if test="$hasTaggedValues">
						<br/>
						<xsl:call-template name="SHOW_TAGGED_VALUES"/>
					</xsl:if>
					<!--    =========  Association constraints [optional] ===========      -->
					<xsl:if test="$hasConstraints">
						<br/>
						<xsl:call-template name="SHOW_CONSTRAINTS"/>
					</xsl:if>
					<!--    =========  Association hyperlinks [optional] ===========      -->
					<xsl:if test="string-length($hasHyperlinks) > 0">
						<br/>
						<xsl:call-template name="SHOW_HYPERLINKS"/>
					</xsl:if>
					<xsl:if test="string-length($hasRequirements) > 0">
						<br/>
						<xsl:call-template name="SHOW_REQUIREMENTS"/>
					</xsl:if>
					<xsl:call-template name="PARSE_ASSOCIATION_ENDS"/>
				</body>
			</html>
		</redirect:write>
		<!-- This element was reported -->
		<xsl:call-template name="REPORTED_ELEMENT"/>
	</xsl:template>
</xsl:stylesheet>
