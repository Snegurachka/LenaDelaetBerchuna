<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method ="html" media-type ="text/html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Computers</title>
            </head>
            <body>
                <h1>
                    <center>List of computers</center>
                </h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match ="machines">
        <xsl:apply-templates select ="machine"/>
    </xsl:template>
    <xsl:template match ="machine">
        <div>
            <h2>
                <xsl:value-of select="@name"/>
            </h2>
            <xsl:apply-templates select ="cpus"/>
            <xsl:apply-templates select ="gpus"/>
            <xsl:apply-templates select="storages"/>
        </div>
        <br/>
            <xsl:if test ="position()=last()">
                <hr/>
                Total count <xsl:value-of select ="last()"/> entries in target XML document
            </xsl:if>
    </xsl:template>
    <xsl:template match="cpus">
        <table border="5" width="70%" align="center">
            <caption>CPU</caption>
            <tr>
                <th rowspan="2">Producer</th>
                <th rowspan="2">Model</th>
                <th rowspan="2">Frequence</th>
                <th rowspan="2">Cores</th>
                <th colspan="3">Cash</th>
            </tr>
            <tr>
                <td>L1</td>
                <td>L2</td>
                <td>L3</td>
            </tr>
            <xsl:for-each select ="cpu">
                <tr>
                    <td align="center">
                        <xsl:value-of select="@producer"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="@model"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="frequency"/>
                        <xsl:value-of select="frequency/@units"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="cores"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="cash[@level='L1']"/>
                        <xsl:value-of select="cash[@level='L1']/@units"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="cash[@level='L2']"/>
                        <xsl:value-of select="cash[@level='L2']/@units"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="cash[@level='L3']"/>
                        <xsl:value-of select="cash[@level='L3']/@units"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>
    <xsl:template match="gpus">
        <table border="5" width="70%" align="center">
            <caption>GPU</caption>
            <tr>
                <th rowspan="2">Producer</th>
                <th rowspan="2">Model</th>
                <th colspan="2">Frequence</th>
                <th rowspan="2">Memory</th>
            </tr>
            <tr>
                <td>Memory</td>
                <td>GPU</td>
            </tr>
            <xsl:for-each select ="gpu">
                <tr>
                    <td align="center">
                        <xsl:value-of select="@producer"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="@model"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="frequency[@type='memory']"/>
                        <xsl:value-of select="frequency[@type='memory']/@units"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="frequency[@type='gpu']"/>
                        <xsl:value-of select="frequency[@type='gpu']/@units"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="memory"/>
                        <xsl:value-of select="memory/@units"/>
                        (<xsl:value-of select="memory/@type"/>)
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>
    <xsl:template match="storages">
        <table border="5" width="70%" align="center">
            <caption>Storages</caption>
            <tr>
                <th>Producer</th>
                <th>Type</th>
                <th>Size</th>
                <th>Memory Size</th>
            </tr>
            <xsl:for-each select ="storage">
                <tr>
                    <td align="center">
                        <xsl:value-of select="@producer"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="@type"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="size"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="memsize"/>
                        <xsl:value-of select="memsize/@units"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>
</xsl:stylesheet>