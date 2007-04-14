<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Element type -->
	<xsl:template name="ELEMENT_TYPE">
		<xsl:param name="elementNode" select="current()"/>
		<xsl:variable name="elementTagName" select="local-name($elementNode)"/>
		<xsl:choose>
			<xsl:when test="$elementTagName = 'Model_Management.Model'">
				<xsl:choose>
					<xsl:when test="@xmi.id = $rootModelID">Project model</xsl:when>
					<xsl:otherwise>Model</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$elementTagName = 'Model_Management.Package'">Package</xsl:when>
			<xsl:when test="$elementTagName = 'Model_Management.Subsystem'">Subsystem</xsl:when>
			<xsl:when test="$elementTagName = 'XMI'">Project</xsl:when>
			<xsl:when test="$elementTagName = 'mdElement'">
				<xsl:value-of select="$elementNode/type"/>
			</xsl:when>
			<xsl:when test="$elementTagName = 'Behavioral_Elements.State_Machines.CompositeState'">
				<xsl:choose>
					<xsl:when test="$elementNode/Behavioral_Elements.State_Machines.CompositeState.isConcurrent/@xmi.value = 'true'">ConcurrentState</xsl:when>
					<xsl:otherwise>CompositeState</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$elementTagName = 'Behavioral_Elements.State_Machines.Pseudostate'">
				<xsl:choose>
					<xsl:when test="Behavioral_Elements.State_Machines.Pseudostate.kind/@xmi.value = 'initial'">InitialPseudostate</xsl:when>
					<xsl:when test="Behavioral_Elements.State_Machines.Pseudostate.kind/@xmi.value = 'deepHistory'">DeepHistory</xsl:when>
					<xsl:when test="Behavioral_Elements.State_Machines.Pseudostate.kind/@xmi.value = 'shallowHistory'">ShallowHistory</xsl:when>
					<xsl:when test="Behavioral_Elements.State_Machines.Pseudostate.kind/@xmi.value = 'junction'">
						<xsl:choose>
							<xsl:when test="$elementNode/ancestor::Behavioral_Elements.Activity_Graphs.ActivityGraph">Decision</xsl:when>
							<xsl:otherwise>Junction</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="Behavioral_Elements.State_Machines.Pseudostate.kind/@xmi.value = 'join'">SynchronizationBar</xsl:when>
					<xsl:otherwise>DynamicChoice</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring-after(substring-after($elementTagName, '.'), '.')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
