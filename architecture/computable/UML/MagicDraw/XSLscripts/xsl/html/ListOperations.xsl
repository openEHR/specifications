<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Operations listing
-->
	<xsl:template name="SHOW_OPERATIONS">
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="3">
					<b>
						<font size="+1">
							<a name="operations">Operations</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Signature</b>
				</td>
				<td>
					<b>Constraints</b>
				</td>
				<td>
					<b>Documentation</b>
				</td>
			</tr>
			<xsl:for-each select="Foundation.Core.Classifier.feature/Foundation.Core.Operation">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="checkVisibility">SHOW_OPERATIONS
					<xsl:call-template name="CHECK_VISIBILITY"/>
				</xsl:variable>
				<xsl:if test="string-length($checkVisibility) > 0">
					<!-- Retunr parameter type ID -->
					<xsl:variable name="returnParameterTypeID" select="Foundation.Core.BehavioralFeature.parameter/Foundation.Core.Parameter/Foundation.Core.Parameter.kind[@xmi.value = 'return']/../Foundation.Core.Parameter.type/*/@xmi.idref"/>
					<tr>
						<td>
							<xsl:choose>
								<xsl:when test="$generateOperations">
									<a href="#{@xmi.id}" target="_self">
										<xsl:copy-of select="$OPERATION_ICON"/>
									</a>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<a href="#{@xmi.id}" target="_self">
										<xsl:call-template name="SHOW_OPERATION_NAME"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<xsl:copy-of select="$OPERATION_ICON"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:call-template name="SHOW_OPERATION_NAME"/>
								</xsl:otherwise>
							</xsl:choose>
					<!--	</td> -->
						<!-- Show operation return type -->
					<!--	<td> -->
							:
							<xsl:variable name="returnParameterTypeNode" select="key('ElementByID', $returnParameterTypeID)"/>
							<xsl:if test="$returnParameterTypeNode">
								<xsl:call-template name="SHOW_LINK_TO_REPORT">
									<xsl:with-param name="elementNode" select="$returnParameterTypeNode"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
						
						<!-- Show any constraints -->
						
						<xsl:variable name="hasConstraints" select="$showConstraintsSection and Foundation.Core.ModelElement.constraint"/>
						
						
						
						<td>
							<xsl:if test="$hasConstraints">
			<br/>
			<xsl:call-template name="SHOW_OPERATION_CONSTRAINTS"/>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
						
						<!-- Show any documentation -->
						
						<td><xsl:call-template name="SHOW_DOCUMENTATION"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
