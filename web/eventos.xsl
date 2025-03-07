<?xml version="1.0" encoding="UTF-8"?>
<!--
Módulo: Desarrollo Web
Tarea: XSLT
UD: UD4
Autor: Nellys Nathaly Mata Marín
Fecha: 07 de Marzo de 2025
Autoevaluación:https://docs.google.com/document/d/1lIIbv4fgmssFFJsGxarkbLHLAIfmc2MZ_0UxbU7JGag/edit?usp=sharing
Página GitHub:-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Define la salida como HTML con indentación para mejorar la legibilidad -->
	<xsl:output method="html" indent="yes"/>

	<!-- Definición de una variable para filtrar eventos del año 2024 -->
	<xsl:variable name="anio" select="'2024'"/>
	
	<!-- Plantilla principal que transforma el documento XML en una página HTML -->
	<xsl:template match="/gestionParque">
		<html>
			<!-- Enlace a la hoja de estilos externa y metadatos de la página-->
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
				<meta charset="utf-8"/>
				<meta name="description" content="Página principal"/>
				<title>Eventos</title>
			</head>
			<body>
				<header>
					<img src="../img/logotipo.png" alt="Reservas"/>
					<a href="gastrobar.xml">Gastrobar</a>
					<a href="atracciones.xml">Atracciones</a>
					<a href="eventos.xml">Eventos</a>
				</header>
				<main id="eventos">
					<!-- Se aplica la plantilla a los eventos del año 2024 y ordena los eventos primero por mes en orden descendente y luego por día en orden ascendente -->
					<h1>Eventos del 2024</h1>
					<xsl:apply-templates select="/gestionParque/eventos/evento[substring(fechaHora, 1, 4) = $anio]">
						<xsl:sort select="substring(fecha, 6, 2)" order="descending" data-type="number"></xsl:sort>
						<xsl:sort select="substring(fecha, 9, 2)" order="ascending" data-type="number"/>
					</xsl:apply-templates>
				</main>
				<!-- pie de pagina-->
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	<!-- plantilla para cada evento-->
	<xsl:template match="evento">
		<div class="eventos">
			<!-- Se muestra el nombre y la descripción del evento,Cuenta la cantidad de comentarios y los muestra -->
			<h4>
				<xsl:value-of select="nombre"/>
				<xsl:value-of select="descripcion"/>
				<xsl:text>
				</xsl:text>
				<xsl:value-of select="count(comentarios/comentario)"/>
				<xsl:text> - </xsl:text>
				<strong>comentarios</strong>
			</h4>
			<!-- Se aplica la plantilla a cada comentario dentro del evento -->
			<ul>
				<xsl:apply-templates select="comentarios/comentario">
					<xsl:sort select="position()" order="descending"/>
				</xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
	<!-- plantilla para cada comentario-->
	<xsl:template match="comentario">
		<!-- Se muestra el contenido del comentario -->
		<li>
			<xsl:value-of select="."/>
		</li>
	</xsl:template>
</xsl:stylesheet>