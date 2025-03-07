<?xml version="1.0" encoding="UTF-8"?>
<!--
Módulo: Desarrollo Web
Tarea: XSLT
UD: UD4
Autor: Nellys Nathaly Mata Marín
Fecha: 07 de Marzo de 2025
Autoevaluación:https://docs.google.com/document/d/1lIIbv4fgmssFFJsGxarkbLHLAIfmc2MZ_0UxbU7JGag/edit?usp=sharing
Página GitHub: -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Define la salida como HTML con indentación para mejorar la legibilidad -->
	<xsl:output method="html" indent="yes"/>
	<!-- Plantilla para transformar el archivo XML a HTML con información de las atracciones -->
	<xsl:template match="/">
		<html>
			<!-- Enlace a la hoja de estilos externa y metadatos de la página-->
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
				<meta charset="utf-8"/>
				<meta name="description" content="Página principal"/>
				<title>Gastrobar</title>
			</head>
			<body>
				<header>
					<img src="../img/logotipo.png" alt="reservas"/>
					<a href="gastrobar.xml">Gastrobar</a>
					<a href="atracciones.xml">Atracciones</a>
					<a href="eventos.xml">Eventos</a>
				</header>
				<!-- Contenido principal de la página para mostrar los entrantes -->
				<main id="gastrobar">
					<h1>ENTRANTES</h1>
					<!-- Recorremos los platos de la categoría "Entrante" -->
					<xsl:for-each select="gestionParque/gastrobar/platos/plato[@categoria='Entrante']">
						<article class="articulo">
							<!-- Mostrar imagen del plato con la ruta concatenada -->
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="concat('../img/', foto)"/>
								</xsl:attribute>
								<xsl:attribute name="class">imagen</xsl:attribute>
							</img>
							<!-- nombre del plato-->
							<h2>
								<xsl:value-of select="nom_plato"/>
							</h2>
							<!-- precio del plato-->
							<h3>
								<xsl:value-of select="precio"/>
							</h3>
							<!-- Si el código del plato empieza con 'A', mostramos un ícono de novedad -->
							<xsl:if test="starts-with(@codigo, 'A')">
								<img class="novedad-icono" src="../img/icono-novedad.png" alt="New"/>
							</xsl:if>
						</article>
					</xsl:for-each>
				</main>
				<!-- pie de pagina-->
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>