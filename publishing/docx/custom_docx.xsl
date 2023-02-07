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
    
    <!-- Do not display teacher guide topic -->
    <xsl:template match="//topic[@outputclass='teacher-guide']"/>
    
    <!-- Remove elements with @props = 'teacher' -->
    <xsl:template match="*[contains(@props, 'teacher')]"/>
   
    <!-- Replace lcOpenAnswer2 in Questions section with Answer Space -->
    <xsl:template match="*[@oid='questions']//*[contains(@class, ' learning2-d/lcOpenAnswer2 ')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace3Lines"/>
            </w:pPr>
        </w:p>
    </xsl:template>

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
    
    
    <!-- ******************************************************************************************** -->
    <!--                              STYLES FROM ORIGINAL STUDENT LAB TOPIC                          -->
    <!-- ******************************************************************************************** -->

    <!-- Do not display teacher notes -->
    <xsl:template match="//*[@outputclass='teacher-note']"/>
    

    
    <!-- Use "Section Head" style for Section Titles -->
    <xsl:template match="*[contains(@class, ' topic/section ')]/*[contains(@class, ' topic/title ')] |
        *[contains(@class, ' topic/example ')]/*[contains(@class, ' topic/title ')]"
        priority="10"
        mode="block-style"
        name="block-style-section.title"
        as="element()*">
        <w:pStyle w:val="SectionHead"/>
    </xsl:template>
    
    <!-- Use "Subhead 1" style for part-title outputclass -->
    <xsl:template match="p[@outputclass='part-title']">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="Subhead1"/>
            </w:pPr>
            <xsl:apply-templates/>
        </w:p>
    </xsl:template>
    
    <!-- Replace answers with answer space in a question only for student version -->
    <xsl:template match="//topic[@outputclass='lab-activity']//table//p[contains(@outputclass,'answer')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <xsl:template match="//topic[@outputclass='lab-activity']//section[@outputclass='questions']//p[contains(@outputclass,'answer')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace3Lines"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <xsl:template match="//topic[@outputclass='lab-activity']//section[@outputclass='questions']//p[contains(@outputclass,'drawing')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpaceDrawing"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <xsl:template match="//topic[@outputclass='lab-activity']//table//p[contains(@outputclass,'two-lines')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace2Lines"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <xsl:template match="//topic[@outputclass='lab-activity']//table//p[contains(@outputclass,'three-lines')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace3Lines"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <xsl:template match="//topic[@outputclass='lab-activity']//table//p[contains(@outputclass,'four-lines')]">
        <w:p>
            <w:pPr>
                <w:pStyle w:val="AnswerSpace4Lines"/>
            </w:pPr>
        </w:p>
    </xsl:template>
    
    <!-- Do not display any images with answer attribute in student version -->
    <xsl:template match="//topic[@outputclass='lab-activity']//image[contains(@outputclass,'answer')]"/>
    
</xsl:stylesheet>