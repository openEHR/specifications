<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Tagged values tabel
-->
	<xsl:template name="SHOW_TAGGED_VALUES">
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<!-- if documentation is not included do not show documentation column -->
				<xsl:variable name="colspanNumber">
					<xsl:choose>
						<xsl:when test="$showDocumentation">3</xsl:when>
						<xsl:otherwise>2</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<td colspan="{$colspanNumber}">
					<b>
						<font size="+1">
							<a name="tagged_values">Tagged Values</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Tag Definition/Tag Name</b>
				</td>
				<td>
					<b>Value</b>
				</td>
				<xsl:if test="$showDocumentation">
					<td>
						<b>Documentation</b>
					</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="Foundation.Core.ModelElement.taggedValue/Foundation.Extension_Mechanisms.TaggedValue">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="tagDefinitionNode" select="key('TagDefinitionByID', Foundation.Extension_Mechanisms.TaggedValue.type/Foundation.Extension_Mechanisms.TagDefinition/@xmi.idref)"/>
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="$tagDefinitionNode">
								<b>Tag<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Definition:</b>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:choose>
									<xsl:when test="$generateTagDefinitions">
										<xsl:call-template name="SHOW_LINK_TO_REPORT">
											<xsl:with-param name="elementNode" select="$tagDefinitionNode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="SHOW_NAME">
											<xsl:with-param name="name" select="$tagDefinitionNode/Foundation.Core.ModelElement.name"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;:&amp;nbsp;</xsl:text>
								<xsl:for-each select="$tagDefinitionNode">
									<xsl:call-template name="SHOW_TAG_DEFINITION_TYPE"/>
								</xsl:for-each>
								<xsl:variable name="multiplicity">
									<xsl:for-each select="$tagDefinitionNode/Foundation.Extension_Mechanisms.TagDefinition.multiplicity">
										<xsl:call-template name="SHOW_MULTIPLICITY"/>
									</xsl:for-each>
								</xsl:variable>
								<xsl:if test="string-length($multiplicity) != 0">[<xsl:value-of select="$multiplicity"/>]</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<b>Tag<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Name:</b>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<!-- Value -->
					<td>
						<xsl:call-template name="SHOW_TAGGED_VALUE_VALUES">
							<xsl:with-param name="tagDefinitionNode" select="$tagDefinitionNode"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$showDocumentation">
						<td>
							<xsl:call-template name="SHOW_DOCUMENTATION"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Show tagged value values -->
	<xsl:template name="SHOW_TAGGED_VALUE_VALUES">
		<xsl:param name="tagDefinitionNode"/>
		<xsl:choose>
			<xsl:when test="$tagDefinitionNode/Foundation.Extension_Mechanisms.TagDefinition.tagType = 'String' or $tagDefinitionNode/Foundation.Extension_Mechanisms.TagDefinition.tagType ='Boolean'">
				<xsl:for-each select="Foundation.Extension_Mechanisms.TaggedValue.dataValue">
					<xsl:if test="position() != 1">
						<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
					</xsl:if>
					<xsl:call-template name="SHOW_PREFORMATTED_TEXT">
						<xsl:with-param name="text" select="current()"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="typeElement" select="key('ElementByID', $tagDefinitionNode/Foundation.Extension_Mechanisms.TagDefinition.tagType)"/>
				<xsl:choose>
					<xsl:when test="$typeElement and (local-name($typeElement) != 'Foundation.Core.Enumeration')">
						<xsl:for-each select="Foundation.Extension_Mechanisms.TaggedValue.dataValue">
							<xsl:if test="position() != 1">
								<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
							</xsl:if>
							<xsl:value-of select="self::*"/>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="Foundation.Extension_Mechanisms.TaggedValue.referenceValue/*">
							<xsl:sort data-type="text" order="ascending" select="local-name(self::*)"/>
							<xsl:variable name="elementNode" select="key('ElementByID', @xmi.idref)"/>
							<xsl:if test="position() != 1">
								<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
							</xsl:if>
							<xsl:call-template name="SHOW_LINK_TO_REPORT">
								<xsl:with-param name="elementNode" select="$elementNode"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
Template for constraints table
-->
	<xsl:template name="SHOW_CONSTRAINTS">
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<!-- if documentation is not included do not show documentation column -->
				<xsl:variable name="colspanNumber">
					<xsl:choose>
						<xsl:when test="$showDocumentation">3</xsl:when>
						<xsl:otherwise>2</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<td colspan="{$colspanNumber}">
					<b>
						<font size="+1">
							<a name="constraints">Class Constraints</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Name</b>
				</td>
				<td>
					<b>Expression</b>
				</td>
				<xsl:if test="$showDocumentation">
					<td>
						<b>Documentation</b>
					</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="Foundation.Core.ModelElement.constraint/Foundation.Core.Constraint">
				<xsl:variable name="constraintNode" select="key('ConstraintByID', @xmi.idref)"/>
				<tr align="left" valign="top">
					<td>
						<xsl:choose>
							<xsl:when test="$generateConstraints">
								<xsl:call-template name="SHOW_LINK_TO_REPORT">
									<xsl:with-param name="elementNode" select="$constraintNode"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$constraintNode/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="$constraintNode/Foundation.Core.Constraint.body/Foundation.Data_Types.BooleanExpression/Foundation.Data_Types.Expression.body"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$showDocumentation">
						<td>
							<xsl:for-each select="$constraintNode">
								<xsl:call-template name="SHOW_DOCUMENTATION"/>
							</xsl:for-each>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
	
	<!-- 
Template for showung Operations Constraint within Operation section of Class report -->
	
	
	<xsl:template name="SHOW_OPERATION_CONSTRAINTS">
		<!--<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">-->
				<!-- if documentation is not included do not show documentation column -->
				<!--<xsl:variable name="colspanNumber">
					<xsl:choose>
						<xsl:when test="$showDocumentation">3</xsl:when>
						<xsl:otherwise>2</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<td colspan="{$colspanNumber}">
					<b>
						<font size="+1">
							<a name="constraints">Constraints</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Name</b>
				</td>
				<td>
					<b>Expression</b>
				</td>
				<xsl:if test="$showDocumentation">
					<td>
						<b>Documentation</b>
					</td>
				</xsl:if>
			</tr>-->
			<xsl:for-each select="Foundation.Core.ModelElement.constraint/Foundation.Core.Constraint">
				<xsl:variable name="constraintNode" select="key('ConstraintByID', @xmi.idref)"/>
				
					
					
						<xsl:value-of select="$constraintNode/Foundation.Core.Constraint.body/Foundation.Data_Types.BooleanExpression/Foundation.Data_Types.Expression.body"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					
					
				
			</xsl:for-each>
		
	</xsl:template>
	
	
	
	
	
	
	
	<!--
Template for stereotype constraints table
-->
	<xsl:template name="SHOW_STEREOTYPE_CONSTRAINTS">
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<!-- if documentation is not included do not show documentation column -->
				<xsl:variable name="colspanNumber">
					<xsl:choose>
						<xsl:when test="$showDocumentation">4</xsl:when>
						<xsl:otherwise>3</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<td colspan="{$colspanNumber}">
					<b>
						<font size="+1">
							<a name="stereotypeConstraints">Stereotype Constraints</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Name</b>
				</td>
				<td>
					<b>Expression</b>
				</td>
				<xsl:if test="$showDocumentation">
					<td>
						<b>Documentation</b>
					</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="Foundation.Extension_Mechanisms.Stereotype.stereotypeConstraint/Foundation.Core.Constraint">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<tr align="left" valign="top">
					<td>
						<xsl:choose>
							<xsl:when test="$generateConstraints">
								<a href="#{@xmi.id}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
									</xsl:call-template>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="Foundation.Core.Constraint.body/Foundation.Data_Types.BooleanExpression/Foundation.Data_Types.Expression.body"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$showDocumentation">
						<td>
							<xsl:call-template name="SHOW_DOCUMENTATION"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
