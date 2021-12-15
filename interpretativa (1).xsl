<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Interpretativa
                </title>
                <link rel='stylesheet' href='progetto.css'></link> 
            </head> 
            <body>
                <div>
                    <div class="menu"><br /><br/>
                        <ul> 
                            <li><a href = "index.html">Edizione Diplomatica</a></li>
                            <li><a href = "#Pagina14">Pagina 14</a></li> 
                            <li><a href = "#Pagina15">Pagina 15</a></li>
                        </ul>
                    </div>
                    <h1>Edizione Interpretativa</h1><br/>
                    <h3>Nell'edizione interpretativa vengono
                        eliminate le cancellature<br/>
                        e in generale tutti gli
                        interventi editoriali dell'autore.<br/>
                        Vengono inoltre sciolte tutte le 
                        abbreviazioni.
                    </h3><br/>
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
    <xsl:template match="//tei:text/tei:body/tei:div/tei:p/tei:lb">
	    <br />
    </xsl:template>
    <xsl:template match="//tei:abbr">
	    <span style="display:none">
  	    <xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="//tei:term">
        <span style="color:red">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="//tei:mentioned[@xml:lang='lat']">
        <span style="color:yellow"> 
        <xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="//tei:mentioned[@xml:lang='greek']">
        <span style="color:lime">
        <xsl:value-of select="."/></span>
    </xsl:template>
     <xsl:template match="//tei:name[@type='person']">
        <span style="color:Aqua">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="//tei:date">
        <span style="color:Fuchsia">
        <xsl:value-of select="."/></span>
    </xsl:template>

</xsl:stylesheet>
