<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:redirect="org.apache.xalan.lib.Redirect" extension-element-prefixes="redirect">
	<!--
	Name for unamed elements
	-->
	<xsl:variable name="noName">&lt;unnamed&gt;</xsl:variable>
	<!-- Stylesheet includes
-->
	<xsl:include href="Includes.xsl"/>
	<!--
output method - HTML
-->
	<xsl:output method="html"/>
	<!--
Main template
-->
	<xsl:template match="/">
		<!--
Creates index.html file, which redirects to file indexLeft.html
-->
		<html>
			<head>
				<meta http-equiv="refresh" content="1;URL=indexLeft.html"/>
				<title>
					<xsl:value-of select="$REPORT_TITLE"/>
				</title>
			</head>
			<body bgcolor="#FFFFFF">
				<div align="center">
					<font size="+2">
						<xsl:value-of select="$REPORT_TITLE"/>
					</font>
				</div>
			</body>
		</html>
		<!-- Create main HTML index files -->
		<xsl:call-template name="CREATE_HTML_INDEXES"/>
		<redirect:open file="{$reportedElementsFile}"/>
		<redirect:write file="{$reportedElementsFile}">
			<xsl:element name="reported_elements">
				<!-- Create top browser -->
				<xsl:call-template name="CREATE_TOP_BROWSER"/>
			</xsl:element>
		</redirect:write>
		<redirect:close file="{$reportedElementsFile}"/>
		<!-- Generate dictionary -->
		<xsl:if test="$generateDictionary">
			<xsl:call-template name="CREATE_DICTIONARY"/>
		</xsl:if>
	</xsl:template>
	<!--
Helper template for necessary html files creation
-->
	<xsl:template name="CREATE_HTML_INDEXES">
		<!--
Frame with browser on the left
-->
		<redirect:write file="{$reportDir}/indexLeft.html">
			<html>
				<head>
					<title>
						<xsl:value-of select="$REPORT_TITLE"/>
					</title>
				</head>
				<xsl:variable name="startID">
					<xsl:call-template name="GET_STARTING_PACKAGE_ID"/>
				</xsl:variable>
				<frameset cols="200,*" frameborder="yes" border="1" framespacing="2">
					<frameset rows="200,*" frameborder="yes" border="1" framespacing="2">
						<frame name="browserTop" scrolling="auto" src="TopBrowser.html"/>
						<frame name="browserBottom" scrolling="auto" src="{$startID}Index.html"/>
					</frameset>
					<frame name="mainFrame" scrolling="auto" src="{$startID}Report.html"/>
				</frameset>
				<noframes>
					<body bgcolor="#FFFFFF"/>
				</noframes>
			</html>
		</redirect:write>
		<!--
Frame with browser on the right
-->
		<redirect:write file="{$reportDir}/indexRight.html">
			<html>
				<head>
					<title>
						<xsl:value-of select="$REPORT_TITLE"/>
					</title>
				</head>
				<xsl:variable name="startID">
					<xsl:call-template name="GET_STARTING_PACKAGE_ID"/>
				</xsl:variable>
				<frameset cols="*,200" frameborder="yes" border="1" framespacing="2">
					<frame name="mainFrame" scrolling="auto" src="{$startID}Report.html"/>
					<frameset rows="*,200" frameborder="yes" border="1" framespacing="2">
						<frame name="browserTop" scrolling="auto" src="TopBrowser.html"/>
						<frame name="browserBottom" scrolling="auto" src="{$startID}Index.html"/>
					</frameset>
				</frameset>
				<noframes>
					<body bgcolor="#FFFFFF"/>
				</noframes>
			</html>
		</redirect:write>
	</xsl:template>
	<!-- Get starting package id -->
	<xsl:template name="GET_STARTING_PACKAGE_ID">
		<xsl:choose>
			<xsl:when test="$selectedPackagesIDs/self::node() = $rootModelID">
				<xsl:value-of select="$rootModelID"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$selectedPackagesIDs[1]"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
