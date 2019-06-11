<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="text"/>
<xsl:template match="/">
<xsl:for-each select="/ProductList/Product">
	<xsl:value-of select="./@Id"/>
	<xsl:text>;</xsl:text>
	<xsl:value-of select="./@Name"/>
	<xsl:text>;</xsl:text>
	<xsl:value-of select="./@Barcode"/>
	<xsl:text>;</xsl:text>
	<xsl:value-of select="translate(./@Calories, ',', '.')"/>
	<xsl:text>;</xsl:text>
	
	
	<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>