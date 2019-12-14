<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="/">
    <html>
      <body>
        <center>
          <h1>All shawarma prices</h1>
          <table border="1">
            <tr bgcolor="#9acd32">
              <th>Outlet</th>
              <th>Rating</th>
              <th>Shawarma</th>
              <th>Description</th>
              <th>Price, rubles</th>
            </tr>
            <xsl:for-each select="prices/instance">
              <tr>
                <td bgcolor="silver"><xsl:value-of select="outlet"/></td>
                <td style="color: red; font-weight: bold"><xsl:value-of select="outlet/@rating"/></td>
                <td bgcolor="steelblue" style="color: purple; font-weight: bold"><xsl:value-of select="type"/></td>
                <td style="font-style: italic"><xsl:value-of select="description"/></td>
                <td bgcolor="orangered"><xsl:value-of select="price"/></td>
              </tr>
            </xsl:for-each>
          </table>
        </center>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
