<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Remove teacher guide topic -->
    <xsl:template match="//topic[@outputclass='teacher-guide']"/>
    
    <!-- Remove lcOpenAnswer2 elements -->
    <xsl:template match="*[contains(@class, ' learning2-d/lcOpenAnswer2 ')]"/>
    
    <!-- Remove elements with @props = 'teacher' -->
    <xsl:template match="*[contains(@props, 'teacher')]"/>
    
    <!-- Remove lcInstructorNote2 elements -->
    <xsl:template match="*[contains(@class, ' learning2-d/lcInstructornote2 ')]"/>
    
</xsl:stylesheet>