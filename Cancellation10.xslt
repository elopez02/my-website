<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital" version="2.0" xmlns:catalogSat="urn:catalogSat" xmlns:convert="urn:convert"
    exclude-result-prefixes="xs">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

	<xsl:param name="logoContpaqiTemplate"></xsl:param>
	<xsl:param name="cbbUriTemplate"></xsl:param>
	<xsl:param name="originalstring"></xsl:param>
	<xsl:param name="stamporiginalstring"></xsl:param>
	<xsl:param name="logo" ></xsl:param>
	<xsl:param name="waterMark" ></xsl:param>

	<xsl:template match="/">
		<!--<!DOCTYPE html >-->
		<html>
			<head>
				<meta charset='UTF-8' xmlns:cfdi='http://www.sat.gob.mx/cfd/3' xmlns:tfd='http://www.sat.gob.mx/TimbreFiscalDigital'/>
				<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'  id='previewer-styles-link'></link>
				<link async="" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
			</head>
			<style>
                <![CDATA[
                .container-previewer .title-fields {
                    color: #000000;
                    font-weight: bolder;
                    font-size: 14px !important;
                }
                .container-previewer .fields-results {
                    color: #8c8c8c;
                    font-size: 14px;
                }
                .container-previewer .square-logo {
                    border-style: none;
                    color: #bdbdbd;
                    text-align: center;
                    font-size: 30px;
                    vertical-align: middle;
                    display: table-cell;
                    padding-left: 20px;
                    padding-right: 20px;
                }
                .container-previewer .block-title {
                    background: #75b6fc;
                    text-align: center;
                    padding-top: 5px;
                    padding-bottom: 5px;
                    margin-top: 20px;
                    margin-bottom: 20px;
                    color: white;
                }
                .container-previewer .container-logo {
                    margin-left: 10px;
                }
                .container-previewer .separator-line {
                    margin-top: 10px;
                }
                .container-previewer .title {
                    font-size: 36px;
                    color: #75b6fc;
                    text-align: right;
                }
                .container-previewer .subtitle {
                    font-size: 16px;
                    color: #75b6fc;
                    margin-bottom: 10px;
                }
                .container-previewer {
                    width: 1080px !important;
                }
                .container-previewer .text-left {
                    text-align: left;
                }
                .container-previewer .text-right {
                    text-align: right;
                }
                .container-previewer .stamping {
                    word-wrap: break-word;
                    font-size: 12px;
                }
                .container-previewer #sellosat {
                    padding-top: 10px;
                }
                .container-previewer img {
                    width: 200px;
                }
                .container-previewer #logo {
                    width: 160px;
                }
                .container-previewer #backgroundforwatermark {
                    position: absolute;
                    z-index: 0;
                    background: white;
                    display: block;
                    min-height: 50%;
                    min-width: 50%;
                    color: yellow;
                }
                .container-previewer watermark {
                    color: lightgrey;
                    font-size: 120px;
                    transform: rotate(300deg);
                    -webkit-transform: rotate(300deg);
                }
                .container-previewer .span-long-text {
                    text-overflow: ellipsis;
                    display: block;
                    max-width: 100%;
                    word-wrap: break-word;
                }
                .container-previewer .td-long-text-200 {
                    max-width: 200px;
                }
                .container-previewer .td-long-text-100 {
                    max-width: 100px;
                }
                .container-previewer .td-long-text-80 {
                    max-width: 80px;
                }
                .container-previewer .td-long-text-150 {
                    max-width: 100px;
                }
                .container-previewer .td-long-text-110 {
                    max-width: 110px;
                }
                .p25-left {
                    padding-left: 25px;
                }
                .p25-right {
                    padding-right: 25px;
                }
                .p25-top {
                    padding-top: 25px;  
                }
                .p25-bottom {
                    padding-bottom: 25px;
                }
                .m50-top {
                    margin-top: 50px;
                }
                .m50-bot {
                    margin-bottom: 50px;
                }
                .m100-top {
                    margin-top: 100px;
                }
                .m100-bot {
                    margin-bottom: 100px;
                }
                .no-padding {
                    padding: 0px !important;
                }
                ]]>
			</style>
			<body>
				<div class="container-previewer">
					<xsl:apply-templates select="/Acuse"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Aquí iniciamos el procesamiento de los datos incluidos en el comprobante -->
	<xsl:template match="Acuse">
        <!-- Logo y Título -->
		<div class="row m100-top m50-bot">
            <div class="col-xs-5 text-right">
				<span class="title">
					Acuse de&#160;Cancelación de CFDI
				</span>
			</div>
			<div class="col-xs-7">
				<div class="container-logo">
					<div class="square-logo">
						<xsl:choose>
							<xsl:when test="$logo!= '' ">
								<img id="logo">
									<xsl:attribute name="src">
										<xsl:value-of select="$logo"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<span>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>

        <div class="row block-title" >
			<span class="title-cfdi" >DATOS DEL COMPROBANTE</span>
		</div>

         <!--  Datos del Comprobante -->
        <div class="row">
            <div class="col-xs-12 p25-left">
                <!-- <xsl:apply-templates select="Folios"/> -->
                <span class="title-fields">
                    Folio fiscal:
                </span>
                <span class="fields-results">           
                    <xsl:for-each select="Folios/UUID" >
                        <xsl:value-of select="." />
                        <xsl:choose>
                            <xsl:when test="position() != last()">, </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </span>
                <br/>

                <span class="title-fields">
                    RFC Emisor:
                </span>
                <span class="fields-results">
                    <xsl:value-of select="./@RfcEmisor"/>
                </span>
                <br/>

                <span class="title-fields">
                    RFC Receptor:
                </span>
                <span class="fields-results">
                    <xsl:value-of select="./@RfcReceptor"/>
                </span>
            </div>
        </div>

        <div class="row block-title" >
			<span class="title-cfdi" >INFORMACIÓN DE LA CANCELACIÓN</span>
		</div>

         <!--  Datos del Comprobante -->
        <div class="row">
            <div class="col-xs-12 p25-left">
                <span class="title-fields">
                    Estado CFDI:
                </span>
                <span class="fields-results">
                    <xsl:value-of select="./@Estado"/>
                </span>
                <br/>

                <span class="title-fields">
                    Estado Cancelación:
                </span>
                <span class="fields-results">
                    <xsl:value-of select="./@EstadoCancelacion"/>
                </span>
                <br/>

                <span class="title-fields">
                    Fecha de Cancelación:
                </span>
                <span class="fields-results">
                    <xsl:value-of select="./@Fecha"/>
                </span>
            </div>
        </div>

        <!--  Sello digital del SAT -->
        <div class="row m50-top">
            <div class="col-xs-12 p25-left">
                <!-- <xsl:apply-templates select="Signature"/> -->
                <span class="subtitle">
                    Sello digital del SAT
                </span>
                <br />
                <span class="fields-results">
                    <xsl:value-of select="./Signature/SignatureValue"/>
                </span>
            </div>
        </div>

        <div class="row block-title m50-top" >
            <span class="title-cfdi" >Este documento es una representación impresa de un CFDI</span>
        </div>
	</xsl:template>

    <!-- Folios Fiscales -->
    <xsl:template match="Folios">
        <span class="title-fields">
            Folio fiscal:
        </span>
        <span class="fields-results">           
            <xsl:for-each select="UUID" >
                <xsl:value-of select="." />
                <xsl:choose>
                    <xsl:when test="position() != last()">, </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </span>
	</xsl:template>

    <!--  Sello digital del SAT -->
	<xsl:template match="Signature">
        <span class="subtitle">
            Sello digital del SAT
        </span>
        <br />
        <span class="fields-results">
            <xsl:value-of select="SignatureValue"/>
        </span>
	</xsl:template>
</xsl:stylesheet>