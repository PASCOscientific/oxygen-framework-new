<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    xmlns:x="com.elovirta.ooxml"
    exclude-result-prefixes="x xs opentopic opentopic-index ot-placeholder"
    version="2.0">
    
    <!-- Only show TOC and Body sections. SHOW TOC to get "update fields" prompt when opening the DOCX file. -->
    <xsl:template match="*[contains(@class, ' map/map ')]" mode="root" priority="10">
        <xsl:apply-templates select="/" mode="toc"/>
        <xsl:apply-templates select="." mode="body"/>        
    </xsl:template>
    
    <!-- Do not display student topic -->
    <xsl:template match="//topic[@outputclass='lab-activity']"/>
    
    <!-- Remove elements with @props = 'student' -->
    <xsl:template match="*[contains(@props, 'student')]"/>
   
    <!-- Do not display draft-comment. This needs to be fixed using args.draft = no in the future. -->
    <xsl:template match="*[contains(@class, ' topic/draft-comment ')]" priority="10"/>
    
    <!-- Note element style -->
    <xsl:template match="*[contains(@class, ' topic/note ')]/*" mode="block-style">
        <w:pStyle w:val="Note"/>
    </xsl:template>
    
    <!-- Set figure title at the bottom of the figure -->
    <xsl:template match="*[contains(@class, ' topic/fig ')]" name="fig" priority="10">
        <xsl:if test="empty(*[contains(@class, ' topic/title ')])">
            <xsl:call-template name="start-bookmark"/>
        </xsl:if>
        <xsl:apply-templates select="*[not(self::title)]"/>
        <xsl:apply-templates select="title"/>
        <xsl:if test="empty(*[contains(@class, ' topic/title ')])">
            <xsl:call-template name="end-bookmark"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>