<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="SHOW_ATTR_ASSOCIATIONS">
		<xsl:param name="elementAssociations"/>
		<xsl:param name="fromClass"/>
		<xsl:call-template name="SET_VARIABLE">
			<xsl:with-param name="name" select="'nattr'"/>
			<xsl:with-param name="value" select="'0'"/>
		</xsl:call-template>
		<xsl:if test="$elementAssociations">
			<xsl:variable name="relationEndElementID" select="@xmi.id"/>
			<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="ordering"/>
			<!--<xsl:for-each select="$elementAssociations">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first"
					select="Foundation.Core.Association.connection/Foundation.Core.AssociationEnd"/>-->
			<xsl:for-each
				select="Foundation.Core.Association.connection/Foundation.Core.AssociationEnd">
				<xsl:if test="position() = 1">
					<xsl:variable name="name1">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="key('ElementByID',
								Foundation.Core.AssociationEnd.type/*/@xmi.idref)/Foundation.Core.ModelElement.name"
							/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Save the near end classname (into file name1) -->
					<xsl:call-template name="SET_VARIABLE">
						<xsl:with-param name="name" select="'name1'"/>
						<xsl:with-param name="value" select="$name1"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="position() = 2">
					<xsl:variable name="name2">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="key('ElementByID',
								Foundation.Core.AssociationEnd.type/*/@xmi.idref)/Foundation.Core.ModelElement.name"
							/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Save the far end classname (into file name2) -->
					<xsl:call-template name="SET_VARIABLE">
						<xsl:with-param name="name" select="'name2'"/>
						<xsl:with-param name="value" select="$name2"/>
					</xsl:call-template>
				</xsl:if>
				<!-- Recover the name1 and name2 values from the disk -->
				<xsl:variable name="name1">
					<xsl:call-template name="GET_VARIABLE">
						<xsl:with-param name="name" select="'name1'"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="name2">
					<xsl:call-template name="GET_VARIABLE">
						<xsl:with-param name="name" select="'name2'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--<xsl:value-of select="$name1"/>
					<xsl:value-of select="$name2"/>
					<xsl:text>from</xsl:text>
					<xsl:value-of select="$fromClass"/>-->
				<xsl:if test="(position() = 2 and $fromClass != $name2) or (position() = 2 and
					$name1 = $name2)">
					<!-- only do the far end for the class whose equivalent attribute this association is-->
					<!--<xsl:text>66</xsl:text>-->
					<!--<tr>
							<td>
								<xsl:variable name="linkToReport">
									<xsl:call-template name="HREF_TO_REPORT">
										<xsl:with-param name="elementID" select="@xmi.id"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="linkToReport"
									select="normalize-space($linkToReport)"/>
								<xsl:choose>
									<xsl:when test="$generateRelations">
										<a href="{$linkToReport}" target="_self">
											<xsl:copy-of select="$ASSOCIATION_ICON"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<xsl:copy-of select="$ASSOCIATION_ICON"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>-->
					<td>
						<xsl:variable name="ordering">
							<xsl:value-of
								select="Foundation.Core.AssociationEnd.ordering/@xmi.value"/>
						</xsl:variable>
						<xsl:variable name="ord" select="'ordered'"/>
						<xsl:variable name="unord" select="'unordered'"/>
						<xsl:variable name="listt">
							<xsl:value-of select="'List'"/>
						</xsl:variable>
						<xsl:variable name="sett">
							<xsl:value-of select="'Set'"/>
						</xsl:variable>
						<!-- Name of far end association -->
						
						<xsl:variable name="assocname">
							
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
							
						</xsl:variable>
						<!-- Place the far end association name -->
						<xsl:value-of select="$assocname"/>
						
						<!-- Type put after colon after Name to form Signature-->
						<xsl:text disable-output-escaping="yes">&amp;nbsp;:&amp;nbsp;</xsl:text>
						<!--New variant to determine whether this is a container relation or not and whether List or Set -->
						<xsl:variable name="low"/>
						<xsl:for-each select="Foundation.Core.AssociationEnd.multiplicity">
							<xsl:choose>
								<xsl:when
									test="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange">
									<xsl:variable name="associationEndElementName"
										select="key('ElementByID',
										Foundation.Core.AssociationEnd.type/*/@xmi.idref)/Foundation.Core.ModelElement.name"/>
									<!--get values of low and high parts of the multiplicity  -->
									<xsl:variable name="lowerRange"
										select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.lower"/>
									<xsl:variable name="upperRange"
										select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.upper"/>
									<xsl:variable name="low">
										<xsl:value-of select="$lowerRange"/>
									</xsl:variable>
									<xsl:variable name="high">
										<xsl:value-of select="$upperRange"/>
									</xsl:variable>
									<xsl:if test="$high='-1'">
										<xsl:if test="$ordering=$ord">
											<xsl:value-of select="$listt"/>
										</xsl:if>
										<xsl:if test="$ordering=$unord">
											<xsl:value-of select="$sett"/>
										</xsl:if>
										<xsl:text>&lt;</xsl:text>
										<!-- Place the name of the far end class in carets preceded by List or Set -->
										<xsl:variable name="endname">
											<xsl:call-template name="GET_VARIABLE">
												<xsl:with-param name="name" select="'name2'"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$endname"/>
										<xsl:text>&gt;</xsl:text>
									</xsl:if>
									<!-- But if high is not *, do it plain -->
									<!-- NB for this code o work there MUST be a far end multiplcity of some kind, else the far end class is not reported.-->
									<xsl:if test="$high!='-1'">
										<xsl:variable name="endname">
											<xsl:call-template name="GET_VARIABLE">
												<xsl:with-param name="name" select="'name2'"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$endname"/>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</td>
					<!-- NOW RECALCULATE THE EFFECTIVE MULTIPLICITY FOR THE NEXT COLUMN. -->
					<td>
						<xsl:for-each select="Foundation.Core.AssociationEnd.multiplicity">
							<xsl:choose>
								<xsl:when
									test="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange">
									<xsl:variable name="associationEndElementName"
										select="key('ElementByID',
										Foundation.Core.AssociationEnd.type/*/@xmi.idref)/Foundation.Core.ModelElement.name"/>
									<!--get values of low and high parts of the multiplicity  -->
									<xsl:variable name="lowerRange"
										select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.lower"/>
									<xsl:variable name="upperRange"
										select="Foundation.Data_Types.Multiplicity/Foundation.Data_Types.Multiplicity.range/Foundation.Data_Types.MultiplicityRange/Foundation.Data_Types.MultiplicityRange.upper"/>
									<xsl:variable name="low">
										<xsl:value-of select="$lowerRange"/>
									</xsl:variable>
									<xsl:variable name="high">
										<xsl:value-of select="$upperRange"/>
									</xsl:variable>
									<!-- Remember $high across contexts -->
									<xsl:call-template name="SET_VARIABLE">
										<xsl:with-param name="name" select="'high'"/>
										<xsl:with-param name="value" select="$high"/>
									</xsl:call-template>
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
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
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
									<xsl:for-each
										select="Foundation.Core.AssociationEnd.multiplicity">
										<xsl:call-template name="SHOW_MULTIPLICITY"/>
									</xsl:for-each>
								</xsl:variable>
								<xsl:if test="string-length($multiplicity) != 0">
									<xsl:value-of select="$multiplicity"/>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:variable name="ordering">
									<xsl:value-of
										select="Foundation.Core.AssociationEnd.ordering/@xmi.value"
									/>
								</xsl:variable>
								<xsl:if test="$ordering='ordered'">
									<xsl:value-of select="$ordering"/>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<!--<xsl:for-each select="Foundation.Core.AssociationEnd.multiplicity">
									<xsl:call-template name="SHOW_MULTIPLICITY"/>-->
					<!--         Attribute ordering    show only if ordered     -->
					<!--<xsl:variable name="ordering" select="Foundation.Core.StructuralFeature.ordering/@xmi.value"></xsl:variable>
									
									
									<xsl:if test="$ordering='ordered'">
										<xsl:value-of select="Foundation.Core.StructuralFeature.ordering/@xmi.value"/>
									</xsl:if>
								</xsl:for-each>-->
					<!-- Documentation -->
					<td>
						<xsl:call-template name="SHOW_DOCUMENTATION"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<!--</tr>-->
				</xsl:if>
			</xsl:for-each>
			<!--</xsl:for-each>-->
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
