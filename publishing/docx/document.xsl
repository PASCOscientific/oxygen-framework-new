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

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>

  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.utils.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.topic.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.abbrev-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.hi-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.markup-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.pr-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.sw-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.ui-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.xml-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.toc.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.table.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.task.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.link.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.mathml-d.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.mml.xsl"/>
  <xsl:import href="plugin:com.elovirta.ooxml:docx/word/document.root.xsl"/>
  <xsl:import href="custom_docx.xsl"/>

  <xsl:output indent="no"/>

  <xsl:param name="input.dir.url"/>
  <xsl:param name="debug" as="xs:boolean?" select="false()"/>
  
  <xsl:variable name="template" select="document(concat($template.dir, '/word/document.xml'))" as="document-node()?"/>
  <xsl:variable name="root" select="/" as="document-node()"/>
  <xsl:variable name="language" select="string((//@xml:lang)[1])" as="xs:string"/>

  <xsl:variable name="sectPr" select="$template/w:document/w:body/w:sectPr[last()]" as="element()"/>
  <xsl:variable name="body-width" as="xs:integer">
    <xsl:sequence select="xs:integer($sectPr/w:pgSz/@w:w) - xs:integer($sectPr/w:pgMar/@w:left) - xs:integer($sectPr/w:pgMar/@w:right)"/>
  </xsl:variable>

</xsl:stylesheet>
