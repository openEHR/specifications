<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:lxslt="http://xml.apache.org/xslt" xmlns:redirect="org.apache.xalan.lib.Redirect"
	extension-element-prefixes="redirect">
	
	<!--Template for Class report-->
	<xsl:template name="CREATE_CLASS_REPORT">
		<xsl:variable name="checkVisibility">
			<xsl:call-template name="CHECK_VISIBILITY"/>
		</xsl:variable>
		<xsl:if test="string-length($checkVisibility) &gt; 0">
			<!-- Get Abstract or Concrete DL -->
			<xsl:variable name="classAbstract"
				select="Foundation.Core.GeneralizableElement.isAbstract/@xmi.value"/>
			<!-- Associations of this element -->
			<xsl:variable name="elementAssociations" select="key('AssociationByEndElementID',
				@xmi.id)"/>
			<!-- Remember what the elementAssociations were -->
			<xsl:variable name="eAwere" select="$elementAssociations"/>
			<!--	Choose what include in the report -->
			<xsl:variable name="hasStereotypes" select="$showStereotypesSection and
				Foundation.Core.ModelElement.stereotype"/>
			<xsl:variable name="showAnyInnerElement">
				<xsl:call-template name="SHOW_ANY_INNER_ELEMENTS"/>
			</xsl:variable>
			<xsl:variable name="hasInnerElements"
				select="string-length($showAnyInnerElement)&gt;0"/>
			<xsl:variable name="checkAttributes">
				<xsl:call-template name="HAS_VISIBLE_ATTRIBUTES"/>
			</xsl:variable>
			<xsl:variable name="hasAttributes" select="string-length($checkAttributes) &gt; 0"/>
			<xsl:variable name="checkOperations">
				<xsl:call-template name="HAS_VISIBLE_OPERATIONS"/>
			</xsl:variable>
			<xsl:variable name="hasOperations" select="string-length($checkOperations) &gt; 0"/>
			<xsl:variable name="hasTemplateParameters" select="$showTemplateParameters and
				Foundation.Core.ModelElement.templateParameter"/>
			<xsl:variable name="hasBindingsTmp">
				<xsl:call-template name="HAS_BINDINGS">
					<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="hasBindings" select="string-length($hasBindingsTmp) &gt; 0"/>
			<!--<xsl:variable name="lenbind" select="string-length($hasBindingsTmp)"></xsl:variable>-->
			<xsl:variable name="hasRelationsTmp">
				<xsl:call-template name="HAS_RELATIONS">
					<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="hasRelations" select="string-length($hasRelationsTmp) &gt; 0"/>
			<xsl:variable name="hasAnyInnerRelations">
				<xsl:call-template name="SHOW_ANY_INNER_RELATIONS"/>
			</xsl:variable>
			<xsl:variable name="hasInnerRelations" select="string-length($hasAnyInnerRelations)
				&gt;     0"/>
			<xsl:variable name="hasTaggedValues" select="$showTaggedValuesSection and
				Foundation.Core.ModelElement.taggedValue"/>
			<xsl:variable name="hasConstraints" select="$showConstraintsSection and
				Foundation.Core.ModelElement.constraint"/>
			<xsl:variable name="hasHyperlinks">
				<xsl:call-template name="HAS_HYPERLINKS"/>
			</xsl:variable>
			<xsl:variable name="hasRequirements">
				<xsl:call-template name="HAS_REQUIREMENTS"/>
			</xsl:variable>
			<!-- Create Class report -->
			<!-- -->
			<redirect:write file="{$reportDir}/{@xmi.id}Report.html">
				<html>
					<head>
						<title>Class <xsl:value-of select="Foundation.Core.ModelElement.name"/>
							Report </title>
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
										<a href="{@xmi.id}Report.html" target="_top"> Hide Browser
										</a> | <a href="indexLeft.html" target="_top">Browser on the
											left</a> | <a href="indexRight.html" target="_top"
											>Browser on the right</a>
										<xsl:if test="$generateDictionary"> | <a
												href="Dictionary.html" target="_self">Dictionary</a>
										</xsl:if>
										<xsl:if test="$showUMLInfo"> | <a href="UMLInfo/Class.html"
												target="_self">UML Info</a>
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
										<xsl:if test="$hasStereotypes"> | <a href="#stereotypes"
												target="_self">Stereotypes</a>
										</xsl:if>
										<xsl:if test="$hasAttributes"> | <a href="#attributes"
												target="_self">Attributes</a>
										</xsl:if>
										<xsl:if test="$hasOperations"> | <a href="#operations"
												target="_self">Operations</a>
										</xsl:if>
										<xsl:if test="$hasTemplateParameters"> | <a
												href="#template_parameters" target="_self">Template
												Parameters</a>
										</xsl:if>
										<xsl:if test="$hasInnerElements"> | <a
												href="#inner_elements" target="_self">Inner
											Elements</a>
										</xsl:if>
										<xsl:if test="$hasRelations"> | <a href="#relations"
												target="_self">Relations</a>
										</xsl:if>
										<xsl:if test="$hasInnerRelations"> | <a
												href="#inner_relations" target="_self">Inner
												Relations</a>
										</xsl:if>
										<xsl:if test="$hasTaggedValues"> | <a href="#tagged_values"
												target="_self">Tagged Values</a>
										</xsl:if>
										<xsl:if test="$hasConstraints"> | <a href="#constraints"
												target="_self">Constraints</a>
										</xsl:if>
										<xsl:if test="string-length($hasHyperlinks) &gt; 0"> |
												<a href="#hyperlinks" target="_self">Hyperlinks</a>
										</xsl:if>
										<xsl:if test="string-length($hasRequirements) &gt; 0"> |
												<a href="#requirements" target="_self"
											>Requirements</a>
										</xsl:if>
									</font>
								</td>
							</tr>
						</table>
						<hr noshade="" size="1"/>
						<p/>
						<!--            ===========  Report body ===========             -->
						<!--            =================================             -->
						<!--         Element type and name             -->
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
						<!-- Remember the name of THIS Class -->
						<xsl:variable name="fromClass">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:variable>
						
						<!-- Remember the from class to disk -->
						
						<xsl:call-template name="SET_VARIABLE">
							<xsl:with-param name="name" select="'fromc'"/>
							<xsl:with-param name="value" select="$fromClass"></xsl:with-param>
						</xsl:call-template>
						<!--This checks whether there are any equivalent attributes from associations from this class-->
						
					
							<xsl:call-template name="HAS_ATTR_ASSOCIATIONS">
								<xsl:with-param name="elementAssociations"
									select="$elementAssociations"/>
								<xsl:with-param name="fromClass" select="$fromClass"/>
							</xsl:call-template>
					<!-- Get the count idicator back from disk -->
						<xsl:variable name="ntodo">
							<xsl:call-template name="GET_VARIABLE">
								<xsl:with-param name="name" select="'nattr'"/>
							</xsl:call-template>
						</xsl:variable>
						<!--<xsl:text>ntodo191 is</xsl:text>
						<xsl:value-of select="$ntodo"/>-->
						
						<font size="+2">Class<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<b>
								<xsl:value-of select="$fromClass"/>
							</b>
							<xsl:if test="$classAbstract='true'">
								<xsl:text>{Abstract}</xsl:text>
							</xsl:if>
						</font>
						<!--         Class hierarchy          -->
						<xsl:call-template name="SUPER_ELEMENTS"/>
						<xsl:call-template name="SUB_ELEMENTS">
							<xsl:with-param name="title" select="string('Direct Subclassifiers:')"/>
						</xsl:call-template>
						<!--         Implementing classifiers     -->
						<xsl:call-template name="IMPLEMENTING_ELEMENTS">
							<xsl:with-param name="title" select="string('Implementing
								Classifiers:')"/>
						</xsl:call-template>
						<!--         Implemented classifiers     -->
						<xsl:call-template name="IMPLEMENTED_ELEMENTS">
							<xsl:with-param name="title" select="string('Implemented Classifiers:')"
							/>
						</xsl:call-template>
						<br/>
						<!--         Comment             -->
						<xsl:call-template name="SHOW_DOCUMENTATION">
							<xsl:with-param name="createReport" select="true()"/>
						</xsl:call-template>
						<!--            ===========  General information ===========             -->
						<!--<xsl:call-template name="SHOW_CLASSIFIER_GENERAL_INFO"/> -->
						<!--    =========  Class stereotypes [optional] ===========      -->
						<xsl:if test="$hasStereotypes">
							<br/>
							<xsl:call-template name="SHOW_STEREOTYPES"/>
						</xsl:if>
						<!--    =========  Class attributes [optional] ===========      -->
						<br/>
						<!--<p>Has Relations is <xsl:value-of select="$hasRelations"/>
						</p>
						<p>Has Bindings is <xsl:value-of select="$hasBindings"/>
						</p>-->
						<xsl:if test="$hasAttributes">
							<br/>
							<xsl:call-template name="SHOW_ATTRIBUTES"/>
						</xsl:if>
						<!--    =========  Class relations [optional] ===========      -->
						
						<!--<xsl:value-of select="$ntodo"/>
						<xsl:text>to do</xsl:text>-->
						
						<xsl:if test="$hasRelations and $ntodo='0111'">
							<br/>
							
							<!--<xsl:text>got into has rel and attrs=</xsl:text>-->
							<!--<xsl:value-of select="$fromClass"/>-->
							<xsl:call-template name="SHOW_RELATIONS">
								<xsl:with-param name="elementAssociations"
									select="$elementAssociations"/>
								<xsl:with-param name="fromClass" select="$fromClass"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$hasInnerRelations and $generateRelations">
							<br/>
							<xsl:call-template name="SHOW_INNER_RELATIONS"/>
						</xsl:if>
						<!--<p>Binding length= <xsl:value-of select="$lenbind"/></p>	-->
						<!--    =========  Bindings [optional] ===========      -->
						<br/>
						<xsl:if test="$hasBindings">
							<br/>
							<xsl:call-template name="SHOW_BINDINGS"/>
						</xsl:if>
						
						<!--    =========  Class template parameters [optional] ===========      -->
						<xsl:if test="$hasTemplateParameters">
							<br/>
							<xsl:call-template name="SHOW_TEMPLATE_PARAMETERS"/>
						</xsl:if>
						<!--    =========  Class inner elements [optional] ===========      -->
						<xsl:if test="$hasInnerElements">
							<br/>
							<xsl:call-template name="SHOW_INNER_ELEMENTS"/>
						</xsl:if>
						<!--    =========  Class operations [optional] ===========      -->
						<xsl:if test="$hasOperations">
							<br/>
							<xsl:call-template name="SHOW_OPERATIONS"/>
						</xsl:if>
						<!--    =========  Class tagged values [optional] ===========      -->
						<xsl:if test="$hasTaggedValues">
							<br/>
							<xsl:call-template name="SHOW_TAGGED_VALUES"/>
						</xsl:if>
						<!--    =========  Class constraints [optional] ===========      -->
						<xsl:if test="$hasConstraints">
							<br/>
							<xsl:call-template name="SHOW_CONSTRAINTS"/>
						</xsl:if>
						<!--    =========  Class hyperlinks [optional] ===========      -->
						<xsl:if test="string-length($hasHyperlinks) &gt; 0">
							<br/>
							<xsl:call-template name="SHOW_HYPERLINKS"/>
						</xsl:if>
						<xsl:if test="string-length($hasRequirements) &gt; 0">
							<br/>
							<xsl:call-template name="SHOW_REQUIREMENTS"/>
						</xsl:if>
						<xsl:call-template name="PARSE_ATTRIBUTES"/>
						<xsl:call-template name="PARSE_OPERATIONS"/>
						<xsl:call-template name="PARSE_INNER_ELEMENTS"/>
						<xsl:call-template name="PARSE_INNER_RELATIONS"/>
					</body>
				</html>
			</redirect:write>
			<!-- This element was reported -->
			<xsl:call-template name="REPORTED_ELEMENT"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
