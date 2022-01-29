<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
    <head>
    <style>
        td {
            font-size: 15pt;
        }

        #add_table {
            width: 70%;
            border: 1px solid black;
            margin: auto;
            border-collapse: collapse;
        }

        .col {
            border: 1px solid black;
            width: 50%;
            text-align:center;
        }
    </style>
    </head>
    <body>
        <table id="add_table">
            <caption><h1>Таблица вывода</h1></caption>
            <tbody>
                <tr>
                    <xsl:choose>
                        <xsl:when test="params/max_segment != 'Нет отрезков'">
                            <td class="col"><xsl:value-of select="params/array"/></td>
                            <td class="col"><xsl:value-of select="params/all_segments"/></td>
                            <td class="col"><xsl:value-of select="params/max_segment"/></td>
                            <td class="col"><xsl:value-of select="params/count"/></td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td class="col"><xsl:value-of select="params/array"/></td>
                            <td colspan="3" id="error_cell">Нет отрезков</td>
                        </xsl:otherwise>
                    </xsl:choose>
                </tr>
            </tbody>
        </table>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>