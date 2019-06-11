<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Oct 19 16:27:02 CEST 2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" encoding="iso-8859-1"/>
	
	<xsl:template match="/">
		
	<xsl:for-each select="/Products/Product/Nutrients">
		<xsl:variable name="temp" select="../Id"/>
		<xsl:variable name="temp3" select="position()" />
		<xsl:variable name="temp4" select="($temp3 - 1) * 6" />
		<xsl:for-each select="*">
			<xsl:value-of select="$temp4 + position()"/>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="translate(current(), ',', '.')"/>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="position()"/>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="$temp"/>
			<xsl:text>&#xa;</xsl:text>
		</xsl:for-each>		
		
	</xsl:for-each>
	
	</xsl:template>

</xsl:stylesheet>


