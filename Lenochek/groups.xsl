<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method ="html" media-type ="text/html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Groups</title>
            </head>
            <body>
                <h1>
                    <center>List of groups</center>
                </h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match ="groups">
        <xsl:apply-templates select ="group"/>
        <xsl:if test ="position()=last()">
        <hr/>
        Total count <xsl:value-of select ="last()"/> entries in target XML document
    </xsl:if>
    </xsl:template>
    <xsl:template match ="group">
        <div>
            <h2>
                <xsl:value-of select="nameGroup"/>
            </h2>
        </div>
        <table border="3" width="40%">
            <!--<caption>Состав группы</caption>-->
            <tr>
                <th rowspan="1">Дата основания</th>
                <td align="center">
                <xsl:value-of select="dateFounding"/>
                </td>
            </tr>

            <tr>
                <th rowspan="1">Стиль музыки</th>
                <td align="center">
                    <xsl:value-of select="styleMusic"/>
                </td>
            </tr>

            <tr>
                <th rowspan="1">Состав</th>
                    <td align="center">
                        <table>
                            <xsl:for-each select ="members/member">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
            </tr>

            <tr>
                <th rowspan="1">Количесто альбомов</th>
                <td align="center">
                    <xsl:value-of select="numberOfAlboms"/>
                </td>
            </tr>

            <tr>
                <th rowspan="1">Количество песен</th>
                <td align="center">
                    <xsl:value-of select="numberOfSongs"/>
                </td>
            </tr>

            <tr>
                <th rowspan="1">Песни</th>
                <td align="center">
                    <table>
                        <xsl:for-each select ="compositions/composition">
                            <tr>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </td>
            </tr>


            <!--<th rowspan="1">Фамилия</th>-->
            <!--<th rowspan="1">Дата рождения</th>-->
            <!--<th rowspan="1">Когда вступил в группу</th>-->
            <!--<th rowspan="1">Позиция в группе</th>-->
            <!--<th rowspan="1">Когда покинул группу </th>-->
            <!--<xsl:for-each select ="group">-->
                <!--<tr>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="name"/>-->
                    <!--</td>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="lastName"/>-->
                    <!--</td>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="dateBorn"/>-->
                    <!--</td>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="dateV"/>-->
                    <!--</td>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="position"/>-->
                    <!--</td>-->
                    <!--<td align="center">-->
                        <!--<xsl:value-of select="dateI"/>-->
                    <!--</td>-->
                <!--</tr>-->
            <!--</xsl:for-each>-->
        </table>
        <br/>

        <xsl:apply-templates select ="members"/>
    </xsl:template>
    <xsl:template match="members">
        <table border="3" width="70%">
            <caption>Состав группы</caption>
            <tr>
                <th rowspan="1">Имя</th>
                <th rowspan="1">Фамилия</th>
                <th rowspan="1">Дата рождения</th>
                <th rowspan="1">Когда вступил в группу</th>
                <th rowspan="1">Позиция в группе</th>
                <th rowspan="1">Когда покинул группу </th>
            </tr>

            <xsl:for-each select ="member">
                <tr>
                    <td align="center">
                        <xsl:value-of select="name"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="lastName"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="dateBorn"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="dateV"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="position"/>
                    </td>
                    <td align="center">
                        <xsl:value-of select="dateI"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>
</xsl:stylesheet>