<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei"
  version="2.0">

  <xsl:output method='html' omit-xml-declaration='yes'
    indent='yes' doctype-public='-//W3C//DTD HTML 4.01 Strict//EN'
    doctype-system='http://www.w3.org/TR/html4/strict.dtd' />

  <xsl:template match='tei:TEI'>
    <html>
      <head>
        <title>
          <xsl:value-of
            select='normalize-space(tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title)' />
        </title>
      </head>
      <body>
        <xsl:apply-templates />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:body">
    <div class="tei">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="tei:p">
    <p>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="tei:date">
    <span class="date">
      <xsl:value-of select="normalize-space(.)" />
    </span>
  </xsl:template>

  <xsl:template match="tei:persName">
    <xsl:choose>
      <xsl:when test="(.//tei:surname) and (.//tei:forename)">
        <span class="persName">
          <a>
            <xsl:attribute name="class">search persName</xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="href">http://islandlives.net/fedora/ilives_book_search/tei.persNameTERM:%22<xsl:value-of select=".//tei:surname"/>+<xsl:value-of select=".//tei:forename"/>%22+AND+dc.type:collection</xsl:attribute>
            <xsl:apply-templates select="*|node()" />
          </a>
        </span>
        </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="*|node()" />
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:placeName">
    <a>
      <xsl:attribute name="class">search placeName</xsl:attribute>
      <xsl:attribute name="target">_blank</xsl:attribute>
      <xsl:attribute name="href">http://islandlives.net/fedora/ilives_book_search/tei.placeNameTERM:%22<xsl:value-of select="normalize-space(.)"/>%22+AND+dc.type:collection</xsl:attribute>
      <xsl:value-of select="normalize-space(.)"/>
    </a>
  </xsl:template>
  
  <xsl:template match="tei:orgName">
    <a>
      <xsl:attribute name="class">search orgName</xsl:attribute>
      <xsl:attribute name="target">_blank</xsl:attribute>
      <xsl:attribute name="href">http://islandlives.net/fedora/ilives_book_search/tei.orgNameTERM:%22<xsl:value-of select="normalize-space(.)"/>%22+AND+dc.type:collection</xsl:attribute>
      <xsl:value-of select="normalize-space(.)"/>
    </a>
  </xsl:template>

  <xsl:template match="tei:teiHeader" />

</xsl:stylesheet>