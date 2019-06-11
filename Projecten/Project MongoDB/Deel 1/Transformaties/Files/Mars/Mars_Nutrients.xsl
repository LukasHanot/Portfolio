<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="text"/>
<xsl:template match="/">
<xsl:variable name="temp2" select="1974" />
<xsl:for-each select="/ProductList/Product/Nutrients">
	<xsl:variable name="temp" select="./../@Id"></xsl:variable>
	<xsl:variable name="temp3" select="position()" />
	<xsl:variable name="temp4" select="($temp3 - 1) * 6" />
	<xsl:for-each select="@*">
		<xsl:value-of select="$temp2 + $temp4 + position()"/>
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

<!-- 1975 -->