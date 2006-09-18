<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Key for Diagram element retrieval by ID
-->
	<!--
Template for inner elements listing
-->
	<xsl:template name="SHOW_INNER_ELEMENTS">
		<table cellspacing="0" border="1" width="100%" cellpadding="0">
			<tr bgcolor="#CCCCFF">
				<td colspan="2">
					<b>
						<font size="+1">
							<a name="inner_elements">Inner Elements</a>
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
			<xsl:if test="$generateActors">
				<xsl:call-template name="LIST_INNER_ACTORS"/>
			</xsl:if>
			<xsl:if test="$generateUseCases">
				<xsl:call-template name="LIST_INNER_USE_CASES"/>
			</xsl:if>
			<xsl:if test="$generateInterfaces">
				<xsl:call-template name="LIST_INNER_INTERFACES"/>
			</xsl:if>
			<xsl:if test="$generateClasses">
				<xsl:call-template name="LIST_INNER_CLASSES"/>
			</xsl:if>
			<xsl:call-template name="LIST_INNER_DATA_TYPES_PRIMITIVES_ENUMS"/>
			<xsl:if test="$generateSignals">
				<xsl:call-template name="LIST_INNER_SIGNALS"/>
			</xsl:if>
			<xsl:call-template name="LIST_INNER_MODELS"/>
			<xsl:call-template name="LIST_INNER_PACKAGES"/>
			<xsl:call-template name="LIST_INNER_SUBSYSTEMS"/>
			<xsl:if test="$generateComponents">
				<xsl:call-template name="LIST_INNER_COMPONENTS"/>
			</xsl:if>
			<xsl:if test="$generateComponentInstances">
				<xsl:call-template name="LIST_INNER_COMPONENT_INSTANCES"/>
			</xsl:if>
			<xsl:if test="$generateNodes">
				<xsl:call-template name="LIST_INNER_NODES"/>
			</xsl:if>
			<xsl:if test="$generateNodeInstances">
				<xsl:call-template name="LIST_INNER_NODE_INSTANCES"/>
			</xsl:if>
			<xsl:if test="$generateArtifacts">
				<xsl:call-template name="LIST_INNER_ARTIFACTS"/>
			</xsl:if>
			<xsl:call-template name="LIST_INNER_COLLABORATIONS"/>
			<xsl:if test="$generateInstances">
				<xsl:call-template name="LIST_INNER_INSTANCES"/>
			</xsl:if>
			<xsl:if test="$generateClassifierRoles">
				<xsl:call-template name="LIST_INNER_CLASSIFIER_ROLES"/>
			</xsl:if>
			<xsl:if test="$generateActivity">
				<xsl:call-template name="LIST_INNER_CLASSIFIERS_IN_STATE"/>
				<xsl:call-template name="LIST_INNER_ACTIVITY_GRAPHS"/>
			</xsl:if>
			<xsl:if test="$generateState">
				<xsl:call-template name="LIST_INNER_STATE_MACHINES"/>
			</xsl:if>
			<xsl:call-template name="LIST_INNER_DIAGRAMS"/>
			<xsl:if test="$generateStereotypes">
				<xsl:call-template name="LIST_INNER_STEREOTYPES"/>
			</xsl:if>
			<xsl:if test="$generateTagDefinitions">
				<xsl:call-template name="LIST_INNER_TAG_DEFINITIONS"/>
			</xsl:if>
			<xsl:if test="$generateConstraints">
				<xsl:call-template name="LIST_INNER_CONSTRAINTS"/>
			</xsl:if>
		</table>
	</xsl:template>
	<!--
Template for Actors listing
-->
	<xsl:template name="LIST_INNER_ACTORS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Use_Cases.Actor">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$ACTOR_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Actor</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Artifact listing
-->
	<xsl:template name="LIST_INNER_ARTIFACTS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Artifact">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$ARTIFACT_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Artifact</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Use Cases listing
-->
	<xsl:template name="LIST_INNER_USE_CASES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Use_Cases.UseCase">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$USE_CASE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Use Case</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Interfaces listing
-->
	<xsl:template name="LIST_INNER_INTERFACES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Interface">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$INTERFACE_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Interface</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Classes listing
-->
	<xsl:template name="LIST_INNER_CLASSES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Class">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$CLASS_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Class</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Data Types listing
-->
	<xsl:template name="LIST_INNER_DATA_TYPES_PRIMITIVES_ENUMS">
		<xsl:if test="$generateDataTypes">
			<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.DataType | 
		Foundation.Core.Namespace.ownedElement/Foundation.Core.Primitive | 
		Foundation.Core.Namespace.ownedElement/Foundation.Core.ProgrammingLanguageDataType">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="local-name(self::*)"/>
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="checkVisibility">
					<xsl:call-template name="CHECK_VISIBILITY"/>
				</xsl:variable>
				<xsl:if test="string-length($checkVisibility) > 0">
					<tr>
						<td>
							<a href="#{@xmi.id}" target="_self">
								<xsl:choose>
									<xsl:when test="local-name(self::*) = 'Foundation.Core.DataType'">
										<xsl:copy-of select="$DATA_TYPE_ICON"/>
									</xsl:when>
									<xsl:when test="local-name(self::*) = 'Foundation.Core.Primitive'">
										<xsl:copy-of select="$PRIMITIVE_ICON"/>
									</xsl:when>
									<xsl:when test="local-name(self::*) = 'Foundation.Core.ProgrammingLanguageDataType'">
										<xsl:copy-of select="$PROGRAMMING_LANGUAGE_DATA_TYPE_ICON"/>
									</xsl:when>
								</xsl:choose>
							</a>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<a href="#{@xmi.id}" target="_self">
								<xsl:call-template name="SHOW_NAME">
									<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
								</xsl:call-template>
							</a>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="local-name(self::*) = 'Foundation.Core.DataType'">Data Type</xsl:when>
								<xsl:when test="local-name(self::*) = 'Foundation.Core.Primitive'">Primitive</xsl:when>
								<xsl:when test="local-name(self::*) = 'Foundation.Core.ProgrammingLanguageDataType'">Programming Language Data Type</xsl:when>
							</xsl:choose>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="$generateEnumerations">
			<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Enumeration">
				<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
				<xsl:variable name="checkVisibility">
					<xsl:call-template name="CHECK_VISIBILITY"/>
				</xsl:variable>
				<xsl:if test="string-length($checkVisibility) > 0">
					<tr>
						<td>
							<a href="#{@xmi.id}" target="_self">
								<xsl:copy-of select="$ENUMERATION_ICON"/>
							</a>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<a href="#{@xmi.id}" target="_self">
								<xsl:call-template name="SHOW_NAME"/>
							</a>
						</td>
						<td>Enumeration</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--
Template for Instances listing
-->
	<xsl:template name="LIST_INNER_INSTANCES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.DataValue | 
		Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.Instance | 
		Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.Object | 
		Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Use_Cases.UseCaseInstance | 
		Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.SubsystemInstance">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="local-name(self::*)"/>
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:choose>
							<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.DataValue' or local-name(self::*) = 'Behavioral_Elements.Common_Behavior.Instance'">
								<xsl:copy-of select="$INSTANCE_ICON"/>
							</xsl:when>
							<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.Object'">
								<xsl:copy-of select="$OBJECT_ICON"/>
							</xsl:when>
							<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Use_Cases.UseCaseInstance'">
								<xsl:copy-of select="$USE_CASE_INSTANCE_ICON"/>
							</xsl:when>
							<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.SubsystemInstance'">
								<xsl:copy-of select="$SUBSYSTEM_INSTANCE_ICON"/>
							</xsl:when>
						</xsl:choose>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.DataValue'">Data Value</xsl:when>
						<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.Instance'">Instance</xsl:when>
						<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.Object'">Object</xsl:when>
						<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Use_Cases.UseCaseInstance'">Use Case Instance</xsl:when>
						<xsl:when test="local-name(self::*) = 'Behavioral_Elements.Common_Behavior.SubsystemInstance'">Subsystem Instance</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Classifier Role listing
-->
	<xsl:template name="LIST_INNER_CLASSIFIER_ROLES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Collaborations.ClassifierRole">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$CLASSIFIER_ROLE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Classifier Role</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Classifiers In State listing
-->
	<xsl:template name="LIST_INNER_CLASSIFIERS_IN_STATE">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Activity_Graphs.ClassifierInState">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$CLASSIFIER_IN_STATE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Classifier In State</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Models listing
-->
	<xsl:template name="LIST_INNER_MODELS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Model_Management.Model">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$MODEL_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Model</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Packages listing
-->
	<xsl:template name="LIST_INNER_PACKAGES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Model_Management.Package">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$PACKAGE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Package </td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Subsystems listing
-->
	<xsl:template name="LIST_INNER_SUBSYSTEMS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Model_Management.Subsystem">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$SUBSYSTEM_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Subsystem</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Component listing
-->
	<xsl:template name="LIST_INNER_COMPONENTS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Component">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$COMPONENT_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Component</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Component Instance listing
-->
	<xsl:template name="LIST_INNER_COMPONENT_INSTANCES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.ComponentInstance">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$COMPONENT_INSTANCE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Component Instance</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Nodes listing
-->
	<xsl:template name="LIST_INNER_NODES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Node">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$NODE_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Node</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Node Instances listing
-->
	<xsl:template name="LIST_INNER_NODE_INSTANCES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.NodeInstance">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$NODE_INSTANCE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Node Instance</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Collaborations listing
-->
	<xsl:template name="LIST_INNER_COLLABORATIONS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Collaborations.Collaboration">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="diagramNode" select="key('DiagramByID', XMI.extension/mainDiagram/@xmi.idref)"/>
			<xsl:variable name="isDiagram" select="$diagramNode/parentID/@xmi.idref  = @xmi.id"/>
			<xsl:variable name="interactionType">
				<xsl:choose>
					<xsl:when test="$isDiagram">
						<xsl:value-of select="$diagramNode/umlType"/>
					</xsl:when>
					<xsl:otherwise>Collaboration</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="($generateCollaborationDiagrams and $interactionType = 'Collaboration Diagram') or ($generateSequenceDiagrams and $interactionType = 'Sequence Diagram') or ($generateCollaborations and $interactionType = 'Collaboration')">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:choose>
								<xsl:when test="$isDiagram">
									<xsl:call-template name="DIAGRAM_ICON_BY_TYPE">
										<xsl:with-param name="diagramType" select="$diagramNode/type"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:copy-of select="$COLLABORATION_ICON"/>
								</xsl:otherwise>
							</xsl:choose>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME"/>
						</a>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="$isDiagram">
								<xsl:value-of select="$diagramNode/type"/>
							</xsl:when>
							<xsl:otherwise>Collaboration</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for ActivityGraphs listing
-->
	<xsl:template name="LIST_INNER_ACTIVITY_GRAPHS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Activity_Graphs.ActivityGraph">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$ACTIVITY_GRAPH_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Activity Graph</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for StateMachines listing
-->
	<xsl:template name="LIST_INNER_STATE_MACHINES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.State_Machines.StateMachine">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$STATE_MACHINE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>State Machine</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Diagrams listing
-->
	<xsl:template name="LIST_INNER_DIAGRAMS">
		<xsl:for-each select="key('DiagramByParentID', @xmi.id)">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:if test="($diagramList/self::node() = @xmi.id) and ((type = 'Class Diagram') or (type = 'Use Case Diagram') or (type = 'Implementation Diagram'))">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="DIAGRAM_ICON_BY_TYPE">
								<xsl:with-param name="diagramType" select="type"/>
							</xsl:call-template>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>
						<xsl:value-of select="type"/>
					</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Stereotypes listing
-->
	<xsl:template name="LIST_INNER_STEREOTYPES">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Extension_Mechanisms.Stereotype">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$STEREOTYPE_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Stereotype</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Tag Definitions listing
-->
	<xsl:template name="LIST_INNER_TAG_DEFINITIONS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Extension_Mechanisms.TagDefinition">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$TAG_DEFINITION_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Tag Definition</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Constraints listing
-->
	<xsl:template name="LIST_INNER_CONSTRAINTS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Foundation.Core.Constraint">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<tr>
				<td>
					<a href="#{@xmi.id}" target="_self">
						<xsl:copy-of select="$CONSTRAINT_ICON"/>
					</a>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<a href="#{@xmi.id}" target="_self">
						<xsl:call-template name="SHOW_NAME">
							<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
						</xsl:call-template>
					</a>
				</td>
				<td>Constraint</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!--
Template for Signals listing
-->
	<xsl:template name="LIST_INNER_SIGNALS">
		<xsl:for-each select="Foundation.Core.Namespace.ownedElement/Behavioral_Elements.Common_Behavior.Signal">
			<xsl:sort data-type="text" order="ascending" case-order="upper-first" select="Foundation.Core.ModelElement.name"/>
			<xsl:variable name="checkVisibility">
				<xsl:call-template name="CHECK_VISIBILITY"/>
			</xsl:variable>
			<xsl:if test="string-length($checkVisibility) > 0">
				<tr>
					<td>
						<a href="#{@xmi.id}" target="_self">
							<xsl:copy-of select="$SIGNAL_ICON"/>
						</a>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<a href="#{@xmi.id}" target="_self">
							<xsl:call-template name="SHOW_NAME">
								<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
							</xsl:call-template>
						</a>
					</td>
					<td>Signal</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
