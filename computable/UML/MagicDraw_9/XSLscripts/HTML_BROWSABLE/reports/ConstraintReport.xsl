<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:redirect="org.apache.xalan.lib.Redirect" extension-element-prefixes="redirect">
	<!--
Template for Stereotype report
-->
	
	<!--
	-->
	<xsl:template name="CONSTRAINT_REPORT">
		<!-- Create Constraint report -->
		<!-- -->
		<a name="{@xmi.id}"/>
		<hr noshade="" size="1"/>
		<p/>
		<!--            ===========  Report body ===========             -->
		<!--            =================================             -->
		<!--         Element type and name             -->
		<xsl:if test="../../@xmi.id != $rootModelID">
			<xsl:if test="../../Foundation.Core.Namespace.ownedElement = ..">
				<a href="{../../@xmi.id}Report.html" target="_self">
					<xsl:call-template name="SHOW_NAME">
						<xsl:with-param name="name" select="../../Foundation.Core.ModelElement.name"/>
					</xsl:call-template>
				</a>
				<br/>
			</xsl:if>
		</xsl:if>
		<font size="+2">Constraint<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<b>
				<xsl:call-template name="SHOW_NAME">
					<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
				</xsl:call-template>
			</b>
		</font>
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
			<!--         name [mandatory]         -->
			<tr>
				<td width="1">
					<b>Name</b>
				</td>
				<td>
					<xsl:call-template name="SHOW_NAME">
						<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--         Constraint expression          -->
			<tr>
				<td width="1">
					<b>Expression</b>
				</td>
				<td>
					<xsl:value-of select="Foundation.Core.Constraint.body/Foundation.Data_Types.BooleanExpression/Foundation.Data_Types.Expression.body"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
			</tr>
			<!-- Constraint base classes -->
			<xsl:if test="XMI.extension/Constraint.baseClass">
				<tr>
					<td width="1" nowrap="">
						<b>Base<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Classes<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
						</b>
					</td>
					<td>
						<xsl:call-template name="COMMA_LIST">
							<xsl:with-param name="elements" select="XMI.extension/Constraint.baseClass"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<!-- State/Activity diagram -->
			<xsl:call-template name="SHOW_STATE_ACTIVITY_DIAGRAM"/>
		</table>
		<!--    =========  Constraint constrained elements [optional] ===========      -->
		<xsl:if test="Foundation.Core.Constraint.constrainedElement">
			<br/>
			<table width="100%" border="1" cellspacing="0">
				<tr bgcolor="#CCCCFF">
					<td colspan="2">
						<b>
							<font size="+1">
								<a name="constrainedElements">Constrained Elements</a>
							</font>
						</b>
					</td>
				</tr>
				<tr>
					<td>
						<b>Name</b>
					</td>
					<td>
						<b>Type</b>
					</td>
				</tr>
				<xsl:for-each select="Foundation.Core.Constraint.constrainedElement/*">
					<xsl:variable name="elementNode" select="key('ElementByID', @xmi.idref)"/>
					<tr>
						<td>
							<xsl:call-template name="SHOW_LINK_TO_REPORT">
								<xsl:with-param name="elementNode" select="$elementNode"/>
							</xsl:call-template>
						</td>
						<td>
							<xsl:call-template name="ELEMENT_TYPE">
								<xsl:with-param name="elementNode" select="$elementNode"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<!--    =========  Classifier In State hyperlinks [optional] ===========      -->
		<xsl:variable name="hasHyperlinks">
			<xsl:call-template name="HAS_HYPERLINKS"/>
		</xsl:variable>
		<xsl:if test="string-length($hasHyperlinks) > 0">
			<br/>
			<xsl:call-template name="SHOW_HYPERLINKS"/>
		</xsl:if>
		<xsl:variable name="hasRequirements">
			<xsl:call-template name="HAS_REQUIREMENTS"/>
		</xsl:variable>
		<xsl:if test="string-length($hasRequirements) > 0">
			<br/>
			<xsl:call-template name="SHOW_REQUIREMENTS"/>
		</xsl:if>
		<p/>
		<!-- This element was reported -->
		<xsl:call-template name="REPORTED_ELEMENT"/>
	</xsl:template><xsl:template name="CREATE_CONSTRAINT_REPORT">
		<!--	Choose what include in the report -->
		<xsl:variable name="hasConstrainedElements" select="Foundation.Core.Constraint.constrainedElement"/>
		<xsl:variable name="hasHyperlinks">
			<xsl:call-template name="HAS_HYPERLINKS"/>
		</xsl:variable>
		<xsl:variable name="hasRequirements">
			<xsl:call-template name="HAS_REQUIREMENTS"/>
		</xsl:variable>
		<!-- Create Tad Gefinition report -->
		<!-- -->
		<redirect:write file="{$reportDir}/{@xmi.id}Report.html">
			<html>
				<head>
					<title>Constraint <xsl:value-of select="Foundation.Core.ModelElement.name"/> Report
					</title>
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
									<xsl:if test="$showUMLInfo"> | <a href="UMLInfo/Constraint.html" target="_self">UML Info</a>
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
									<xsl:if test="$hasConstrainedElements"> | <a href="#constrainedElements" target="_self">Constrained Elements</a>
									</xsl:if>
									<xsl:if test="string-length($hasHyperlinks) > 0"> | <a href="#hyperlinks" target="_self">Hyperlinks</a>
									</xsl:if>
									<xsl:if test="string-length($hasRequirements) > 0"> | <a href="#requirements" target="_self">Requirements</a>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
					<xsl:call-template name="CONSTRAINT_REPORT"/>
				</body>
			</html>
		</redirect:write>
	</xsl:template>
</xsl:stylesheet>
