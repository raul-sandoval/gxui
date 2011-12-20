<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:gx="urn:shemas-artech-com:gx"
	exclude-result-prefixes="msxml gx"
	xmlns:gxca="urn:GXControlAdap"
  xmlns:user="urn:UserRenderHelper">
  <xsl:output method="html"/>
  <xsl:template match="/" >
    <xsl:apply-templates select="/GxControl"/>
  </xsl:template>
  <xsl:template match="GxControl">
    <xsl:choose>
      <xsl:when test="@type = 'gxui.KeyMap'">
        <xsl:call-template name="RenderKeyMap"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- KeyMap design render -->
  <!-- ///////////////////  Implement your render here  ///////////////////-->
  <xsl:template name="RenderKeyMap">
		<div atomicselection="true">
			<xsl:attribute name="style">
				<xsl:text>border:1px solid black;background-color:#C0C0C0;font-family:Arial Narrow;font-size:10pt;color:black;width:110px;padding:2px;letter-spacing:0.9px</xsl:text>
			</xsl:attribute>
			<img alt="KeyMap">
				<xsl:attribute name="src">
					<xsl:value-of select='gxca:GetMyPath()'/>
					<xsl:text>\KeyMap\design\KeyMap.png</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:text>margin-right:4px;float:left;</xsl:text>
				</xsl:attribute>
			</img>KeyMap
		</div>
	</xsl:template>
</xsl:stylesheet>
