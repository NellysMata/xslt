<?xml version="1.0" encoding="UTF-8"?>
<!--
Módulo: Desarrollo Web
Tarea: XSLT
UD: UD4
Autor: Nellys Nathaly Mata Marín
Fecha: 07 de Marzo de 2025
Autoevaluación:https://docs.google.com/document/d/1lIIbv4fgmssFFJsGxarkbLHLAIfmc2MZ_0UxbU7JGag/edit?usp=sharing
Página GitHub:-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- Define la salida como HTML con indentación para mejorar la legibilidad -->
	<xsl:output method="html" indent="yes"/>
	<!-- Plantilla para transformar el archivo XML a HTML con información de las atracciones -->
	<xsl:template match="/gestionParque">
		<html>
			<!-- Enlace a la hoja de estilos externa y metadatos de la página-->
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
				<meta charset="utf-8"/>
				<meta name="description" content="Página de Atracciones"/>
				<title>Atracciones</title>
			</head>
			<body>
				<header>
					<img src="../img/logotipo.png" alt="reservas"/>
					<a href="gastrobar.xml">Gastrobar</a>
					<a href="atracciones.xml">Atracciones</a>
					<a href="eventos.xml">Eventos</a>
				</header>
				<main id="atracciones">
					<h1>Lista de Atracciones</h1>
					<!-- Tabla para mostrar las atracciones -->
					<table>
						<thead>
							<tr>
								<th>ATRACCION</th>
								<th>EDAD MINIMA</th>
								<th>PESO MAXIMO</th>
							</tr>
						</thead>
						<tbody>
							<!-- Recorremos todas las atracciones y las mostramos en la tabla -->
							<xsl:for-each select="atracciones/atraccion">
								<!-- Creamos una URL a Wikipedia para cada atracción -->
								<xsl:variable name="wikipedia_url" select="concat('https://es.wikipedia.org/wiki/', translate(nombre, ' ', '_'))"/>
								<tr>
									<!-- Nombre de la atracción enlazado a Wikipedia -->
									<td>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="$wikipedia_url"/>
											</xsl:attribute>
											<xsl:attribute name="target">_blank</xsl:attribute>
											<xsl:value-of select="nombre"/>
										</a>
									</td>
									<!-- Columna para la edad minima de la atraccion-->
									<td>
										<xsl:value-of select="restricciones/edadMinima"/>
									</td>
									<!-- Columna para el peso maximo de la atraccion-->
									<td>
										<xsl:value-of select="restricciones/pesoMaximo"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</main>
				<!-- Pie de página-->
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>