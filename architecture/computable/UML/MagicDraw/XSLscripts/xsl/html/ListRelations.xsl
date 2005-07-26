<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--- global variables -->
	<xsl:variable name="high"/>
	<xsl:variable name="low"/>
	<xsl:variable name="endname"/>
	<xsl:variable name="newlow"/>
	<xsl:variable name="newhigh"/>
	<xsl:variable name="mult"/>
	<xsl:variable name="name1"/>
	<xsl:variable name="name2"/>
	<!--	<xsl:variable name="fromClass"/>-->
	<!-- Template for associations
-->
	<xsl:template name="SHOW_ASSOCIATIONS">
		<xsl:param name="elementAssociations"/>
		<xsl:param name="fromClass"/>
		<xsl:if test="$elementAssociations">
			<xsl:variable name="relationEndElementID" select="@xmi.id"/>
			<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="ordering"/>
			<xsl:for-each select="$elementAssociations">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first"
					select="Foundation.Core.ModelElement.name"/>
				
		<!-- Before starting another row, make sure this is not a reverse association that is not to be processed -->		
				
				<xsl:call-template name="DOING_THIS_ASSOCIATIONS">
					<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
					<xsl:with-param name="fromClass" select="$fromClass"/>
				</xsl:call-template>	
				
				<!-- Get back the indicator from disk -->
				
				<xsl:variable name="doingthisone">
					<xsl:call-template name="GET_VARIABLE">
						<xsl:with-param name="name" select="'doing'"/>
					</xsl:call-template>
				</xsl:variable>
			<xsl:if test="$doingthisone='0222'">
				
				<tr>
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
					</td>
				
				
				
				
				<xsl:call-template name="SHOW_ATTR_ASSOCIATIONS">
					<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
					<xsl:with-param name="fromClass" select="$fromClass"/>
				</xsl:call-template>
				</tr>
			</xsl:if>	
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--
Template for generalizations
-->
	<xsl:template name="SHOW_GENERALIZATIONS">
		<xsl:for-each select="(Foundation.Core.GeneralizableElement.generalization |
			Foundation.Core.GeneralizableElement.specialization)/Foundation.Core.Generalization">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="relation" select="key('GeneralizationByID',@xmi.idref)"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.idref"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$GENERALIZATION_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$GENERALIZATION_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<!--<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$relation/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="$relation/Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>-->
					<!--<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Generalization.html" target="_self">generalization</a>
						</xsl:when>
						<xsl:otherwise>generalization</xsl:otherwise>
					</xsl:choose>-->
				</td>
				<!--<td>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>-->
				<!--<td>
					<xsl:variable name="relationEndID" select="$relation/Foundation.Core.Generalization.child/*/@xmi.idref"/>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="$relationEndID"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<a href="{$linkToReport}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="key('ElementByID',$relationEndID)/Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>-->
				<td>
					<xsl:variable name="relationEndID"
						select="$relation/Foundation.Core.Generalization.parent/*/@xmi.idref"/>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="$relationEndID"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<a href="{$linkToReport}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name"
								select="key('ElementByID',$relationEndID)/Foundation.Core.ModelElement.name"
							/>
						</xsl:call-template>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for dependency
-->
	<xsl:template name="SHOW_DEPENDENCIES">
		<xsl:for-each select="(Foundation.Core.ModelElement.clientDependency |
			Foundation.Core.ModelElement.supplierDependency)/Foundation.Core.Dependency">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="relation" select="key('DependencyByID',@xmi.idref)"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.idref"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$DEPENDENCY_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$DEPENDENCY_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="$relation/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="$relation/Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Dependency.html" target="_self">dependency</a>
						</xsl:when>
						<xsl:otherwise>dependency</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.client/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.supplier/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for abstraction
-->
	<xsl:template name="SHOW_ABSTRACTIONS">
		<xsl:for-each select="(Foundation.Core.ModelElement.clientDependency |
			Foundation.Core.ModelElement.supplierDependency)/Foundation.Core.Abstraction">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="relation" select="key('AbstractionByID',@xmi.idref)"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.idref"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$DEPENDENCY_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$DEPENDENCY_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="$relation/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="$relation/Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Abstraction.html" target="_self">abstraction</a>
						</xsl:when>
						<xsl:otherwise>abstraction</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.client/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.supplier/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for binding
-->
	<xsl:template name="SHOW_BINDINGS">
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="4">
					<b>
						<font size="+1">
							<a name="relations">Bindings </a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td>
					<b>Client</b>
				</td>
				<td>
					<b>Supplier</b>
				</td>
				<td>
					<b>Documentation</b>
				</td>
			</tr>
			<xsl:for-each select="(Foundation.Core.ModelElement.clientDependency |
				Foundation.Core.ModelElement.supplierDependency)/Foundation.Core.Binding">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first"
					select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="relation" select="key('BindingByID',@xmi.idref)"/>
				<tr>
					<td>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="@xmi.idref"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<xsl:choose>
							<xsl:when test="$generateRelations">
								<a href="{$linkToReport}" target="_self">
									<xsl:copy-of select="$DEPENDENCY_ICON"/>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:copy-of select="$DEPENDENCY_ICON"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<td>
						<xsl:call-template name="SHOW_LINK_TO_REPORT">
							<xsl:with-param name="elementNode" select="key('ElementByID',
								$relation/Foundation.Core.Dependency.client/*/@xmi.idref)"/>
						</xsl:call-template>
					</td>
					<td>
						<xsl:call-template name="SHOW_LINK_TO_REPORT">
							<xsl:with-param name="elementNode" select="key('ElementByID',
								$relation/Foundation.Core.Dependency.supplier/*/@xmi.idref)"/>
						</xsl:call-template>
					</td>
					<!--  Show documentation -->
					<td>
						<xsl:call-template name="SHOW_DOCUMENTATION"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--
Template for permissions
-->
	<xsl:template name="SHOW_PERMISSIONS">
		<xsl:for-each select="(Foundation.Core.ModelElement.clientDependency |
			Foundation.Core.ModelElement.supplierDependency)/Foundation.Core.Permission">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="relation" select="key('PermissionByID',@xmi.idref)"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.idref"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$DEPENDENCY_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$DEPENDENCY_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="$relation/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="$relation/Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Permission.html" target="_self">permission</a>
						</xsl:when>
						<xsl:otherwise>permission</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.client/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.supplier/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for dependency
-->
	<xsl:template name="SHOW_USAGES">
		<xsl:for-each select="(Foundation.Core.ModelElement.clientDependency |
			Foundation.Core.ModelElement.supplierDependency)/Foundation.Core.Usage">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="relation" select="key('UsageByID',@xmi.idref)"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.idref"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$DEPENDENCY_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$DEPENDENCY_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="$relation/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="$relation/Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Usage.html" target="_self">usage</a>
						</xsl:when>
						<xsl:otherwise>usage</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.client/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="SHOW_LINK_TO_REPORT">
						<xsl:with-param name="elementNode" select="key('ElementByID',
							$relation/Foundation.Core.Dependency.supplier/*/@xmi.idref)"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for extend relationships
-->
	<xsl:template name="SHOW_EXTEND_RELATIONSHIPS">
		<xsl:variable name="relationEndElementID" select="@xmi.id"/>
		<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
		<xsl:for-each select="key('ExtendRelationshipByID',
			Behavioral_Elements.Use_Cases.UseCase.extend/Behavioral_Elements.Use_Cases.Extend/@xmi.idref)">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.id"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$LINK_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$LINK_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Extend.html" target="_self">extend</a>
						</xsl:when>
						<xsl:otherwise>extend</xsl:otherwise>
					</xsl:choose>
				</td>
				<xsl:variable name="baseUseCaseID"
					select="Behavioral_Elements.Use_Cases.Extend.base/Behavioral_Elements.Use_Cases.UseCase/@xmi.idref"/>
				<xsl:variable name="extensionUseCaseID"
					select="Behavioral_Elements.Use_Cases.Extend.extension/Behavioral_Elements.Use_Cases.UseCase/@xmi.idref"/>
				<xsl:choose>
					<xsl:when test="$extensionUseCaseID = $relationEndElementID">
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$extensionUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$relationEndElementName"/>
								</xsl:call-template>
							</a>
						</td>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$baseUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="key('UseCaseByID',$baseUseCaseID)/Foundation.Core.ModelElement.name"
									/>
								</xsl:call-template>
							</a>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$extensionUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="key('UseCaseByID',$extensionUseCaseID)/Foundation.Core.ModelElement.name"
									/>
								</xsl:call-template>
							</a>
						</td>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$relationEndElementID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$relationEndElementName"/>
								</xsl:call-template>
							</a>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for include relationships
-->
	<xsl:template name="SHOW_INCLUDE_RELATIONSHIPS">
		<xsl:variable name="relationEndElementID" select="@xmi.id"/>
		<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
		<xsl:for-each select="key('IncludeRelationshipByID',
			Behavioral_Elements.Use_Cases.UseCase.include/Behavioral_Elements.Use_Cases.Include/@xmi.idref)">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first"
				select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="@xmi.id"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:copy-of select="$LINK_ICON"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:copy-of select="$LINK_ICON"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:choose>
						<xsl:when test="$generateRelations">
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name"
									select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="$showUMLInfo">
							<a href="UMLInfo/Include.html" target="_self">include</a>
						</xsl:when>
						<xsl:otherwise>include</xsl:otherwise>
					</xsl:choose>
				</td>
				<xsl:variable name="baseUseCaseID"
					select="Behavioral_Elements.Use_Cases.Include.base/Behavioral_Elements.Use_Cases.UseCase/@xmi.idref"/>
				<xsl:variable name="additionUseCaseID"
					select="Behavioral_Elements.Use_Cases.Include.addition/Behavioral_Elements.Use_Cases.UseCase/@xmi.idref"/>
				<xsl:choose>
					<xsl:when test="$additionUseCaseID = $relationEndElementID">
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$additionUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$relationEndElementName"/>
								</xsl:call-template>
							</a>
						</td>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$baseUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="key('UseCaseByID',$baseUseCaseID)/Foundation.Core.ModelElement.name"
									/>
								</xsl:call-template>
							</a>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$additionUseCaseID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="key('UseCaseByID',$additionUseCaseID)/Foundation.Core.ModelElement.name"
									/>
								</xsl:call-template>
							</a>
						</td>
						<xsl:variable name="linkToReport">
							<xsl:call-template name="HREF_TO_REPORT">
								<xsl:with-param name="elementID" select="$relationEndElementID"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
						<td>
							<a href="{$linkToReport}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="$relationEndElementName"/>
								</xsl:call-template>
							</a>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Template to determine if there are any associations to be listed as attributes, excluding ones that point to THIS class , unless recursive-->
	<!-- It sets the disk variable nattr to '0' if there are no equivalent atttributes to do, and to '0111' if there are -->
	<xsl:template name="HAS_ATTR_ASSOCIATIONS">
		<xsl:param name="elementAssociations"/>
		<xsl:param name="fromClass"/>
		<!--<xsl:text>$elementAssociations in HAS_ATTR_ASSOCIATIONS= </xsl:text>
		<xsl:value-of select="$elementAssociations"/>-->
		<!-- Set the count of derived attributes for this class to the string "0" -->
		<xsl:call-template name="SET_VARIABLE">
			<xsl:with-param name="name" select="'nattr'"/>
			<xsl:with-param name="value" select="'0'"/>
		</xsl:call-template>
		<xsl:if test="$elementAssociations">
			<xsl:variable name="relationEndElementID" select="@xmi.id"/>
			<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="ordering"/>
			<xsl:for-each select="$elementAssociations">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first"
					select="Foundation.Core.Association.connection/Foundation.Core.AssociationEnd"/>
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
					
					<xsl:if test="(position() = 2 and $fromClass != $name2) or (position() = 2 and $name1 = $name2)">
						<!-- only do the far end for the class whose equivalent attribute this association is-->
						<!-- Increase the stored count of equivalent attributes to do to '0111' -->
						<xsl:call-template name="SET_VARIABLE">
							<xsl:with-param name="name" select="'nattr'"/>
							<xsl:with-param name="value" select="'0111'"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:for-each>
				
				
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<!-- Template to determine if THIS association is to be processed (it may be the null end, so don'te-->
	<!-- It sets the disk variable doing to '0' if there this attribute is not to be translated to an association, and to '0222' if ir is -->
	<xsl:template name="DOING_THIS_ASSOCIATIONS">
		<xsl:param name="elementAssociations"/>
		<xsl:param name="fromClass"/>
		
		<!-- Set the doing indicator to the string "0" -->
		<xsl:call-template name="SET_VARIABLE">
			<xsl:with-param name="name" select="'doing'"/>
			<xsl:with-param name="value" select="'0'"/>
		</xsl:call-template>
		
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
					
					<xsl:if test="(position() = 2 and $fromClass != $name2) or (position() = 2 and $name1 = $name2)">
						<!-- only do the far end for the class whose equivalent attribute this association is-->
						<!-- Increase the stored count of equivalent attributes to do to '0111' -->
						<xsl:call-template name="SET_VARIABLE">
							<xsl:with-param name="name" select="'doing'"/>
							<xsl:with-param name="value" select="'0222'"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:for-each>
				
				
		
	</xsl:template>
	
	
	<!--Template for relations tabel -->
	<xsl:template name="SHOW_RELATIONS">
		<xsl:param name="elementAssociations"/>
		<xsl:param name="fromClass"/>
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="5">
					<b>
						<font size="+1">
							<a name="relations">Attributes from Associations</a>
						</font>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:text> </xsl:text>
					<!--<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-->
				</td>
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
			<xsl:if test="not($showNoneRelations)">
				<xsl:call-template name="SHOW_ASSOCIATIONS">
					<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
					<xsl:with-param name="fromClass" select="$fromClass"/>
				</xsl:call-template>
			</xsl:if>
			<!--<xsl:call-template name="SHOW_BINDINGS"/>-->
			<!--<xsl:if test="$showAllRelations">
				<xsl:call-template name="SHOW_GENERALIZATIONS"/>
				<xsl:call-template name="SHOW_ABSTRACTIONS"/>
				<xsl:call-template name="SHOW_BINDINGS"/>
				<xsl:call-template name="SHOW_DEPENDENCIES"/>
				<xsl:call-template name="SHOW_PERMISSIONS"/>
				<xsl:call-template name="SHOW_USAGES"/>
				<xsl:call-template name="SHOW_EXTEND_RELATIONSHIPS"/>
				<xsl:call-template name="SHOW_INCLUDE_RELATIONSHIPS"/>
				<xsl:call-template name="SHOW_LINKS"/>
			</xsl:if>-->
		</table>
	</xsl:template>
	<!--
Template for classifier role relations tabel
-->
	<xsl:template name="SHOW_CLASSIFIER_ROLE_RELATIONS">
		<xsl:param name="elementAssociationRoles"/>
		<xsl:variable name="relationEndElementID" select="@xmi.id"/>
		<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
		<table width="100%" border="1" cellspacing="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="4">
					<b>
						<font size="+1">
							<a name="relations">Relations</a>
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
				<td>
					<b>Begins</b>
				</td>
				<td>
					<b>Ends</b>
				</td>
			</tr>
			<xsl:for-each select="$elementAssociationRoles">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first"
					select="Foundation.Core.ModelElement.name"/>
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="$generateRelations">
								<xsl:variable name="linkToReport">
									<xsl:call-template name="HREF_TO_REPORT">
										<xsl:with-param name="elementID" select="@xmi.id"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="linkToReport"
									select="normalize-space($linkToReport)"/>
								<a href="{$linkToReport}" target="_self">
									<xsl:copy-of select="$ASSOCIATION_ICON"/>
								</a>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name"
											select="Foundation.Core.ModelElement.name"/>
									</xsl:call-template>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:copy-of select="$ASSOCIATION_ICON"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="$showUMLInfo">
								<a href="UMLInfo/AssociationRole.html" target="_self">association
									role</a>
							</xsl:when>
							<xsl:otherwise>association role</xsl:otherwise>
						</xsl:choose>
					</td>
					<xsl:for-each
						select="Foundation.Core.Association.connection/Behavioral_Elements.Collaborations.AssociationEndRole
						/Foundation.Core.AssociationEnd.type/Behavioral_Elements.Collaborations.ClassifierRole">
						<xsl:choose>
							<xsl:when test="$relationEndElementID = @xmi.idref">
								<xsl:variable name="linkToReport">
									<xsl:call-template name="HREF_TO_REPORT">
										<xsl:with-param name="elementID"
											select="$relationEndElementID"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="linkToReport"
									select="normalize-space($linkToReport)"/>
								<td>
									<a href="{$linkToReport}" target="_self">
										<xsl:call-template name="SHOW_NAME">
											<xsl:with-param name="name"
												select="$relationEndElementName"/>
										</xsl:call-template>
									</a>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="linkToReport">
									<xsl:call-template name="HREF_TO_REPORT">
										<xsl:with-param name="elementID" select="@xmi.idref"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="linkToReport"
									select="normalize-space($linkToReport)"/>
								<td>
									<a href="{$linkToReport}" target="_self">
										<xsl:call-template name="SHOW_NAME">
											<xsl:with-param name="name"
												select="key('ClassifierRoleByID',@xmi.idref)/Foundation.Core.ModelElement.name"
											/>
										</xsl:call-template>
									</a>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--
Template for links
-->
	<xsl:template name="SHOW_LINKS">
		<xsl:variable name="relationEndElementID" select="@xmi.id"/>
		<xsl:variable name="relationEndElementName" select="Foundation.Core.ModelElement.name"/>
		<xsl:for-each
			select="Behavioral_Elements.Common_Behavior.Instance.linkEnd/Behavioral_Elements.Common_Behavior.LinkEnd">
			<xsl:variable name="linkNode" select="key('LinkByLinkEndID', @xmi.idref)"/>
			<xsl:variable name="firstLinkEndID"
				select="$linkNode/Behavioral_Elements.Common_Behavior.Link.connection/Behavioral_Elements.Common_Behavior.LinkEnd[1]/@xmi.id"/>
			<xsl:variable name="firstLinkEndInstanceID"
				select="$linkNode/Behavioral_Elements.Common_Behavior.Link.connection/Behavioral_Elements.Common_Behavior.LinkEnd[1]/Behavioral_Elements.Common_Behavior.LinkEnd.instance/*/@xmi.idref"/>
			<xsl:variable name="secondLinkEndInstanceID"
				select="$linkNode/Behavioral_Elements.Common_Behavior.Link.connection/Behavioral_Elements.Common_Behavior.LinkEnd[2]/Behavioral_Elements.Common_Behavior.LinkEnd.instance/*/@xmi.idref"/>
			<!-- Link to itself must be listed only once -->
			<xsl:if test="($firstLinkEndInstanceID != $secondLinkEndInstanceID) or
				(($firstLinkEndInstanceID = $secondLinkEndInstanceID) and ($firstLinkEndID =
				@xmi.idref))">
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="$generateRelations">
								<xsl:variable name="linkToReport">
									<xsl:call-template name="HREF_TO_REPORT">
										<xsl:with-param name="elementID" select="$linkNode/@xmi.id"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="linkToReport"
									select="normalize-space($linkToReport)"/>
								<a href="{$linkToReport}" target="_self">
									<xsl:copy-of select="$LINK_ICON"/>
								</a>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name"
											select="$linkNode/Foundation.Core.ModelElement.name"/>
									</xsl:call-template>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:copy-of select="$LINK_ICON"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name"
										select="$linkNode/Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="$showUMLInfo">
								<a href="UMLInfo/Link.html" target="_self">link</a>
							</xsl:when>
							<xsl:otherwise>link</xsl:otherwise>
						</xsl:choose>
					</td>
					<!-- Link ends are saved reversed so we must process the second and only then the first end -->
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="$secondLinkEndInstanceID"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$relationEndElementID = $secondLinkEndInstanceID">
							<td>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name" select="$relationEndElementName"
										/>
									</xsl:call-template>
								</a>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name"
											select="key('ElementByID',$secondLinkEndInstanceID)/Foundation.Core.ModelElement.name"
										/>
									</xsl:call-template>
								</a>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:variable name="linkToReport">
						<xsl:call-template name="HREF_TO_REPORT">
							<xsl:with-param name="elementID" select="$firstLinkEndInstanceID"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="linkToReport" select="normalize-space($linkToReport)"/>
					<xsl:choose>
						<xsl:when test="$relationEndElementID = $firstLinkEndInstanceID">
							<td>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name" select="$relationEndElementName"
										/>
									</xsl:call-template>
								</a>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<a href="{$linkToReport}" target="_self">
									<xsl:call-template name="SHOW_NAME">
										<xsl:with-param name="name"
											select="key('ElementByID',$firstLinkEndInstanceID)/Foundation.Core.ModelElement.name"
										/>
									</xsl:call-template>
								</a>
							</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
