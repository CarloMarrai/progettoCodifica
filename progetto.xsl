<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:titleStmt//tei:title" />
                </title>
                <link rel='stylesheet' href='progetto.css'></link> 
            </head> 
            <body>
               <div class="menu"><br /><br/>
                    <ul> 
                        <li><a href = "#Home">Info</a></li>
                        <li><a href = "#Pagina14">Pagina 14</a></li> 
                        <li><a href = "#Pagina15">Pagina 15</a></li>
                        <li><a href = "interpretativa.html">Edizione Interpretativa</a></li>
                    </ul>
                </div>
                <div id='Home'>
                    <h1>
                        <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </h1>
                    <img src = "foto1.jpg"/><br />
                    <div>
                        <h2> Informazioni sul documento </h2><br/>
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition" /><br />
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/><br />
                        <p>Pubblicato da <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/> a<xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/></p>
                        <h3>Edizione originale</h3>
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"/><br />
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author"/><br />
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher"/><br />
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:pubPlace"/><br />
                    </div>
                </div>
                <div>
                    <h3>Legenda:</h3>
                    <p id="tc">Elemento Terminologico: Rosso</p>
                    <p id="lat">Esempio linguistico latino: Giallo</p>
                    <p id="gr">Esempio linguistico greco: Verde</p>
                    <p id="dt">Data:Rosa</p>
                    <p id="nm">Nome proprio:Azzurro</p>
                    <div class='titolo'>
                        <h2>Pagina 14</h2>
                    </div>
                    <div> <img id="p14" src='pagina14.png' /></div>
                    <div id='Pagina14'>
                        <h3>Testo in francese</h3>
                        <xsl:apply-templates select="//tei:text[@type='francese']/tei:body/tei:div[1]/tei:p" />
                    </div>
                    <div id='Pagina14ita'>
                        <h3 id= "titoloita">Testo in italiano</h3>
                        <xsl:apply-templates select="//tei:text[@type='italiano']/tei:body/tei:div[1]/tei:p" />
                    </div>
                    <div class='titolo'>
                        <h2>Pagina 15</h2>
                    </div>
                    <div><img id="p15" src='pagina15.png' /></div>
                    <div id='Pagina15'>
                        <h3>Testo in francese</h3>
                        <xsl:apply-templates select="//tei:text[@type='francese']/tei:body/tei:div[2]/tei:p" />
                    </div>
                    <div id='Pagina15ita'>
                        <h3>Testo in italiano</h3>
                        <xsl:apply-templates select="//tei:text[@type='italiano']/tei:body/tei:div[2]/tei:p" />
                   </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <!--TEMPLATE CHE RIPRENDE LA MESSA A CAPO DELLE RIGHE-->
    <xsl:template match="//tei:text/tei:body/tei:div/tei:p/tei:lb">
        <br />
    </xsl:template>
    <!--TEMPLATE PER LE CANCELLATURE-->
    <xsl:template match="//tei:del">
    <span style="text-decoration: line-through">
    <xsl:value-of select="."/></span>
    </xsl:template>
    <!--I SUCCESSIVI TRE TEMPLATE SOTTOLINEANO I TRE TERMINI SOTTOLINEATI NON IN LATINO-->
    <xsl:template match="//tei:hi[@xml:id='sottolineato']">
        <span style="text-decoration: underline">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="//tei:hi[@xml:id='sottolineato1']">
        <span style="text-decoration: underline">
        <xsl:value-of select="."/></span>
    </xsl:template><xsl:template match="//tei:hi[@xml:id='sottolineato2']">
        <span style="text-decoration: underline">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER LE ABBREVIAZIONI-->
    <xsl:template match="//tei:expan">
        <span style="display:none">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE COLORA DI ROSSO GLI ELEMENTI TERMINOLOGICI-->
    <xsl:template match="//tei:term">
        <span style="color:red">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE SOTTOLINEA E COLORA DI GIALLO I TERMINI LATINI-->
    <xsl:template match="//tei:mentioned[@xml:lang='lat']">
        <span style= "color:yellow; text-decoration:underline"> 
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE SOTTOLINEA E COLORA DI GIALLO I TERMINI GRECI-->
    <xsl:template match="//tei:mentioned[@xml:lang='greek']">
        <span style="color:lime">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE COLORA DI AZZURRO I NOMI PROPRI-->
    <xsl:template match="//tei:name[@type='person']">
        <span style="color: Aqua">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE COLORA DI FUCSIA LE DATE-->
    <xsl:template match="//tei:date">
        <span style="color: Fuchsia">
        <xsl:value-of select="."/></span>
    </xsl:template>


</xsl:stylesheet>

                            
