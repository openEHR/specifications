<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
Template for Class or Interface report
-->
	<xsl:template name="CREATE_INTERFACE_REPORT">
		<!-- Associations of this element -->
		<xsl:variable name="elementAssociations" select="key('AssociationByEndElementID', @xmi.id)"/>
		<xsl:variable name="checkVisibility">
			<xsl:call-template name="CHECK_VISIBILITY"/>
		</xsl:variable>
		<xsl:if test="string-length($checkVisibility) &gt; 0">
			<!-- Associations of this element -->
			<!-- Get Abstract or Concrete DL -->
			<xsl:variable name="interfaceAbstract"
				select="Foundation.Core.GeneralizableElement.isAbstract/@xmi.value"/>
			<xsl:variable name="elementAssociations" select="key('AssociationByEndElementID',
				@xmi.id)"/>
					<!--	Choose what include in the report -->
		<xsl:variable name="hasStereotypes" select="$showStereotypesSection and Foundation.Core.ModelElement.stereotype"/>
		<xsl:variable name="showAnyInnerElement">
			<xsl:call-template name="SHOW_ANY_INNER_ELEMENTS"/>
		</xsl:variable>
		<xsl:variable name="hasInnerElements" select="string-length($showAnyInnerElement)>0"/>
		<xsl:variable name="checkAttributes">
			<xsl:call-template name="HAS_VISIBLE_ATTRIBUTES"/>
		</xsl:variable>
		<xsl:variable name="hasAttributes" select="string-length($checkAttributes) > 0"/>
		<xsl:variable name="checkOperations">
			<xsl:call-template name="HAS_VISIBLE_OPERATIONS"/>
		</xsl:variable>
		<xsl:variable name="hasOperations" select="string-length($checkOperations) > 0"/>
		<xsl:variable name="hasTemplateParameters" select="$showTemplateParameters and Foundation.Core.ModelElement.templateParameter"/>
		<xsl:variable name="hasRelationsTmp">
			<xsl:call-template name="HAS_RELATIONS">
				<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
			</xsl:call-template>
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
		<!-- Create Class or Interface report -->
		<!-- -->
		<p/>
		<a name="{@xmi.id}"/>
		<hr noshade="" size="1"/>
		<p/>
		<!--            ===========  Report body ===========             -->
		<!--            =================================             -->
		<!--         Element type and name             -->
		<xsl:if test="../../Foundation.Core.Namespace.ownedElement = ..">
			<xsl:if test="../../@xmi.id != $rootModelID">
				<a href="#{../../@xmi.id}" target="_self">
					<xsl:call-template name="SHOW_NAME">
						<xsl:with-param name="name" select="../../Foundation.Core.ModelElement.name"/>
					</xsl:call-template>
				</a>
				<br/>
			</xsl:if>
		</xsl:if>
		<font size="+2">Interface<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<b>
				<xsl:call-template name="SHOW_NAME">
					<xsl:with-param name="name" select="Foundation.Core.ModelElement.name"/>
				</xsl:call-template>
				<xsl:if test="$interfaceAbstract='true'">
					<xsl:text>{Abstract}</xsl:text>
				</xsl:if>
			</b>
		</font>
		<p/>
		<!--         Interface hierarchy          -->
		<xsl:call-template name="SUPER_ELEMENTS"/>
		<xsl:call-template name="SUB_ELEMENTS">
			<xsl:with-param name="title" select="string('Direct Subclassifiers:')"/>
		</xsl:call-template>
		<!--         Implementing classifiers     -->
		<xsl:call-template name="IMPLEMENTING_ELEMENTS">
			<xsl:with-param name="title" select="string('Implementing Classifiers:')"/>
		</xsl:call-template>
		<!--         Implemented classifiers     -->
		<xsl:call-template name="IMPLEMENTED_ELEMENTS">
			<xsl:with-param name="title" select="string('Implemented Classifiers:')"/>
		</xsl:call-template>
		<p/>
		<!--         Comment             -->
		<xsl:call-template name="SHOW_DOCUMENTATION"/>
		<p/>
		<!--            ===========  General information ===========             -->
		<xsl:call-template name="SHOW_CLASSIFIER_GENERAL_INFO"/>
		<!--    =========  Interface stereotypes [optional] ===========      -->
		<xsl:if test="$hasStereotypes">
			<br/>
			<xsl:call-template name="SHOW_STEREOTYPES"/>
		</xsl:if>
		<!--    =========  Interface attributes [optional] ===========      -->
		<xsl:if test="$hasAttributes">
			<br/>
			<xsl:call-template name="SHOW_ATTRIBUTES"/>
		</xsl:if>
		<!--    =========  Interface operations [optional] ===========      -->
		<xsl:if test="$hasOperations">
			<br/>
			<xsl:call-template name="SHOW_OPERATIONS"/>
		</xsl:if>
		<!--    =========  Interface template parameters [optional] ===========      -->
		<xsl:if test="$hasTemplateParameters">
			<br/>
			<xsl:call-template name="SHOW_TEMPLATE_PARAMETERS"/>
		</xsl:if>
		<!--    =========  Interface inner elements [optional] ===========      -->
		<xsl:if test="$hasInnerElements">
			<br/>
			<xsl:call-template name="SHOW_INNER_ELEMENTS"/>
		</xsl:if>
		<!--    =========  Interface relations [optional] ===========      -->
		<xsl:if test="$hasRelations">
			<br/>
			<xsl:call-template name="SHOW_RELATIONS">
				<xsl:with-param name="elementAssociations" select="$elementAssociations"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$hasInnerRelations and $generateRelations">
			<br/>
			<xsl:call-template name="SHOW_INNER_RELATIONS"/>
		</xsl:if>
		<!--    =========  Interface tagged values [optional] ===========      -->
		<xsl:if test="$hasTaggedValues">
			<br/>
			<xsl:call-template name="SHOW_TAGGED_VALUES"/>
		</xsl:if>
		<!--    =========  Interface constraints [optional] ===========      -->
		<xsl:if test="$hasConstraints">
			<br/>
			<xsl:call-template name="SHOW_CONSTRAINTS"/>
		</xsl:if>
		<!--    =========  Hyperlinks [optional] ===========      -->
		<xsl:if test="string-length($hasHyperlinks) > 0">
			<br/>
			<xsl:call-template name="SHOW_HYPERLINKS"/>
		</xsl:if>
		<xsl:if test="string-length($hasRequirements) > 0">
			<br/>
			<xsl:call-template name="SHOW_REQUIREMENTS"/>
		</xsl:if>
		<xsl:call-template name="PARSE_COMMENT"/>
		<!-- This element was reported -->
		<xsl:call-template name="REPORTED_ELEMENT"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
