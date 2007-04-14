<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Attributes listing
-->
	<xsl:template name="SHOW_ATTRIBUTES">
		<xsl:param name="attributesORqualifiers">ATTRIBUTES</xsl:param>
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="4">
					<b>
						<font size="+1">
							<a name="attributes">
								<xsl:choose>
									<xsl:when test="$attributesORqualifiers = 'QUALIFIERS'">Qualifiers</xsl:when>
									<xsl:otherwise>Attributes</xsl:otherwise>
								</xsl:choose>
							</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>Signature</b>
				</td>
				<td>
					<b>Optionality</b>
				</td>
				<td>
					<b>Multiplicity</b>
				</td>
				<td>
					<b>Documentation</b>
				</td>
				
			</tr>
			<xsl:for-each select="(Foundation.Core.Classifier.feature | Foundation.Core.AssociationEnd.qualifier)/Foundation.Core.Attribute">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="checkVisibility">
					<xsl:call-template name="CHECK_VISIBILITY"/>
				</xsl:variable>
				<xsl:if test="string-length($checkVisibility) > 0">
					<!-- Atribute type ID -->
					<xsl:variable name="attributeTypeID" select="Foundation.Core.StructuralFeature.type/*/@xmi.idref"/>
					<!--  Attribute initila value -->
					<xsl:variable name="attributeInitialValue" select="Foundation.Core.Attribute.initialValue/Foundation.Data_Types.Expression/Foundation.Data_Types.Expression.body"/>
					<tr>
						<!--  Show attribute name and return type-->
						<td>
							<xsl:variable name="attributeName">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$generateAttributes">
									<a href="#{@xmi.id}" target="_self">
										<xsl:copy-of select="$ATTRIBUTE_ICON"/>
									</a>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<a href="#{@xmi.id}" target="_self">
										<xsl:value-of select="$attributeName"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<xsl:copy-of select="$ATTRIBUTE_ICON"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="$attributeName"/>
								</xsl:otherwise>
							</xsl:choose>
							
							<!-- Type put after colon after Name to form Signature -->
							
							<xsl:text disable-output-escaping="yes">&amp;nbsp;:&amp;nbsp;</xsl:text>
						
							<!--  Process Multiplicity -->
							<xsl:variable name="mult">
								<xsl:for-each select="Foundation.Core.StructuralFeature.multiplicity">
								
									<xsl:call-template name="SHOW_MULTIPLICITY"/>
								</xsl:for-each>
							</xsl:variable>
							
							
							
							<xsl:variable name="low" select="'LO'"/>
							<!--<xsl:variable name="high" select="'HI'"/>-->
							
							<xsl:if test="$mult='0..*' or $mult = '1..*' or $mult = '*'">
								<xsl:variable name="high" select="-1"/>
								<xsl:call-template name="SET_VARIABLE">
									<xsl:with-param name="name" select="'high'"/>
									<xsl:with-param name="value" select="$high"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="not($mult = '0..*' or  $mult = '1..*' or $mult = '*')">
								<xsl:variable name="high" select="1"/>
								<xsl:call-template name="SET_VARIABLE">
									<xsl:with-param name="name" select="'high'"/>
									<xsl:with-param name="value" select="$high"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$mult ='0..*' or $mult = '0..1'">
								<xsl:variable name="low" select="0"/>
								<xsl:call-template name="SET_VARIABLE">
									<xsl:with-param name="name" select="'low'"/>
									<xsl:with-param name="value" select="$low"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$mult ='1..*' or $mult = '1'">
								<xsl:variable name="low" select="1"></xsl:variable>
								<xsl:call-template name="SET_VARIABLE">
									<xsl:with-param name="name" select="'low'"/>
									<xsl:with-param name="value" select="$low"/>
								</xsl:call-template>
							</xsl:if>
							<!-- recover the values of low and high -->
							<xsl:variable name="low">
								<xsl:call-template name="GET_VARIABLE">
									<xsl:with-param name="name" select="'low'"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:variable name="high">
								<xsl:call-template name="GET_VARIABLE">
									<xsl:with-param name="name" select="'high'"/>
								</xsl:call-template>
							</xsl:variable>
							
							<xsl:variable name="ordering" select="Foundation.Core.StructuralFeature.ordering/@xmi.value"></xsl:variable>
							
							
							<!--<xsl:text>$ordering87=</xsl:text>
							<xsl:value-of select="$ordering"/>-->
							
							
							<xsl:variable name="ord" select="'ordered'"/>
							<xsl:variable name="unord" select="'unordered'"/>
							<xsl:variable name="listt">
								<xsl:value-of select="'List'"/>
							</xsl:variable>
							<xsl:variable name="sett">
								<xsl:value-of select="'Set'"/>
							</xsl:variable>
							
							<!-- Remember the attribute type -->
							<xsl:variable name="attributeTypeNode" select="key('ElementByID', $attributeTypeID)"/>
							
							
							
							<xsl:call-template name="SET_VARIABLE">
								<xsl:with-param name="name" select="'attrtype'"/>
								<xsl:with-param name="value" select="$attributeTypeNode"/>
							</xsl:call-template>
							
							<!--<xsl:variable name="low"/>-->
							
								
										<!--get values of low and high parts of the multiplicity  -->
										<!--<xsl:variable name="lowerRange"
											select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.lower"/>
										<xsl:variable name="upperRange"
											select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.upper"/>
										<xsl:variable name="low">
											<xsl:value-of select="$lowerRange"/>
										</xsl:variable>
										<xsl:variable name="high">
											<xsl:value-of select="$upperRange"/>
										</xsl:variable>-->
							
										<!-- Get back the attribute type -->
										
										<xsl:variable name="attrtype">
												<xsl:call-template name="GET_VARIABLE">
													<xsl:with-param name="name" select="'attributeTypeNode'"/>
												</xsl:call-template>
											</xsl:variable>
											
										
										
										
										<xsl:if test="$high='-1'">
											<xsl:if test="$ordering=$ord">
												<xsl:value-of select="$listt"/>
											</xsl:if>
											<xsl:if test="$ordering=$unord">
												<xsl:value-of select="$sett"/>
											</xsl:if>
											<xsl:text>&lt;</xsl:text>
											<!-- Place the type of the attribute in carets preceded by List or Set -->
											<!--<xsl:variable name="attributeTypeNode" select="key('ElementByID', $attributeTypeID)"/>-->
											<xsl:if test="$attributeTypeNode">
												<xsl:call-template name="SHOW_LINK_TO_REPORT">
													<xsl:with-param name="elementNode" select="$attributeTypeNode"/>
												</xsl:call-template>
											</xsl:if>
											
											
											<xsl:text>&gt;</xsl:text>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
										<!-- But if high is not *, do it plain -->
										<!-- NB for this code o work there MUST be a far end multiplcity of some kind, else the far end class is not reported.-->
										<xsl:if test="$high!='-1'">
											
											<xsl:if test="$attributeTypeNode">
												<xsl:call-template name="SHOW_LINK_TO_REPORT">
													<xsl:with-param name="elementNode" select="$attributeTypeNode"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											
										</xsl:if>
									
							<!--</xsl:for-each>-->
						</td>
						<!-- NOW RECALCULATE THE EFFECTIVE MULTIPLICITY FOR THE NEXT COLUMN. -->
						<td>
							<!--  First get back the values of low and high-->
							
							<xsl:variable name="low">
								<xsl:call-template name="GET_VARIABLE">
									<xsl:with-param name="name" select="'low'"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:variable name="high">
								<xsl:call-template name="GET_VARIABLE">
									<xsl:with-param name="name" select="'high'"/>
								</xsl:call-template>
							</xsl:variable>
										<xsl:choose>
											<xsl:when test="$high='-1'">
												<xsl:if test="$low='-1'">
													<xsl:variable name="mult">
														<xsl:text>0..1</xsl:text>
													</xsl:variable>
													<xsl:value-of select="$mult"/>
												</xsl:if>
												<xsl:if test="$low='1'">
													<xsl:variable name="mult">
														<xsl:text>1</xsl:text>
													</xsl:variable>
													<xsl:value-of select="$mult"/>
												</xsl:if>
												<xsl:if test="$low='0'">
													<xsl:variable name="mult">
														<xsl:text>0..1</xsl:text>
													</xsl:variable>
													<xsl:value-of select="$mult"/>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="$low='1'">
													<xsl:variable name="mult">
														<xsl:text>1</xsl:text>
													</xsl:variable>
													<xsl:value-of select="$mult"/>
												</xsl:if>
												<xsl:if test="$low='0'">
													<xsl:variable name="mult">
														<xsl:text>0..1</xsl:text>
													</xsl:variable>
													<xsl:value-of select="$mult"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
						<!-- Show the original assocaition Multiplicity -->
						<td>
							<xsl:variable name="high">
								<xsl:call-template name="GET_VARIABLE">
									<xsl:with-param name="name" select="'high'"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$high != -1">
									<xsl:text>N/A</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="multiplicity">
										<xsl:for-each select="Foundation.Core.StructuralFeature.multiplicity">
											
											<xsl:call-template name="SHOW_MULTIPLICITY"/>
										</xsl:for-each>
									</xsl:variable>
									
									
									
									
									
									<xsl:if test="string-length($multiplicity) != 0">
										<xsl:value-of select="$multiplicity"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:variable name="ordering" select="Foundation.Core.StructuralFeature.ordering/@xmi.value"/>
									<!--<xsl:variable name="ordering">
										<xsl:value-of
											select="Foundation.Core.AssociationEnd.ordering/@xmi.value"
											/>
									</xsl:variable>-->
									<xsl:if test="$ordering='ordered'">
										<xsl:value-of select="$ordering"/>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						
							
							
							
							
							
		<!--8888888888888888888888888888888888					
							<xsl:variable name="attributeTypeNode" select="key('ElementByID', $attributeTypeID)"/>
							<xsl:if test="$attributeTypeNode">
								<xsl:call-template name="SHOW_LINK_TO_REPORT">
									<xsl:with-param name="elementNode" select="$attributeTypeNode"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
						
						<xsl:if test="string-length($multiplicity) != 0">
							<td>
								<xsl:value-of select="$multiplicity"/>-->
						
								<!--         Attribute ordering    show only if ordered     -->
								
								<!--<xsl:if test="$ordering='ordered'">
									<xsl:value-of select="Foundation.Core.StructuralFeature.ordering/@xmi.value"/>-->
									<!--<xsl:value-of select="$ordering"/>
								</xsl:if>
							</td>
						</xsl:if>-->
						
																		
						<!--  Show documentation -->
						<td>
							<xsl:call-template name="SHOW_DOCUMENTATION"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
