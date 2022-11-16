<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="/resources/images/laurel.png" />
<head>
  <title>Partida</title>
  </head>
  <script>
    function Temporizador(id, inicio, final){
      this.id = id;
      this.inicio = inicio;
      this.final = final;
      this.contador = this.inicio;

      this.conteoSegundos = function(){
        if (this.contador == this.final){
          this.conteoSegundos = null;
          return;
        }

        document.getElementById(this.id).innerHTML = this.contador--;
        setTimeout(this.conteoSegundos.bind(this), 1000);
      };
    }

    let temporizador = new Temporizador('temporizador', 10, 0);
    temporizador.conteoSegundos();
  </script>
<style type="text/css" media="screen">
#temporizador {
      font-size: 72pt;
      margin: 70px auto;
      width: 100px;
    }
body{
margin: 0 auto;
  padding: 0;
}

table {
   width: 100%;
   border-collapse: collapse;
}

.datosJugador{
   width: 20%;
   height: 148px;
   text-align: left;
   vertical-align: top;
   border-right: 5px solid black;
   border-bottom: 5px solid black;
   border-top: 5px solid black;
   border-left: 5px solid black;
   border-collapse: collapse;
}

.chat{
   width: 20%;
   height: 600px;
   text-align: left;
   vertical-align: top;
   border-right: 5px solid black;
   border-left: 5px solid black;
   border-bottom: 5px solid black;
   border-collapse: collapse;
}
.botonmensaje{
  display: block;
  position: absolute;
  top: 700px;
  padding: 5px;
}

.juego{
width: 65%;
padding:5px;
border-right: 5px solid black;
height: 450px;
border-top: 5px solid black;
}

.roles{
width: 66%;
padding:5px;
border-top: 5px solid black;
border-right: 5px solid black;
border-bottom: 5px solid black;
height: 100px;
}



.faccionactual{
   width: 14%;
   height: 150px;
   text-align: center;
   vertical-align: top;
   border-right: 5px solid black;
    border-top: 5px solid black;
   border-collapse: collapse;
}

.puntuacion{
   width: 14%;
   height: 150px;
   text-align: center;
   border-right: 5px solid black;
   border-bottom: 5px solid black;
   vertical-align: top;
   border-collapse: collapse;
}



#nombreJugador{
font-size: 25px;
}
#tiempoPartida{
font-size: 20px;
}
#espectadores{
font-size: 20px;
}
#imgespectador{
display:inline;
width: 10 px;
}
#marcador{
  width:205px;
  display: block;
  position: absolute;
  top: 436px;
}

#tablapuntos{
  border:1px solid black;
  width:205px;
  display: block;
  position: absolute;
  top: 436px;
}
.tablapuntostd{
  border:1px solid black;
  width:20px;
}
#faccionactual{
     width:205px;
  display: block;
  position: absolute;
}

#faccionposible1{
     width:102px;
  display: block;
  position: absolute;
}

#faccionposible2{
     width:102px;
     right:5px;
  display: block;
  bottom:360px;
  position: absolute;
}

#faccionposible3{
     width:102px;
     right:5px;
  display: block;
  position: absolute;
}

#faccionposible4{
     width:102px;
     right:104px;
     bottom:360px;
  display: block;
  position: absolute;
}


#spanmarcador{
  display: block;
  position: absolute;
  left: 1400px;
  top: 410px;
  text-align:center;
}
#rolactualspan{
font-size: 20px;
}

#tdrol{
width:60px;
}
#votacionnegativa{
 margin-left:100px;
}
#votacionpositiva{
 margin-left:400px;
}
.button {
    background-color: #4CAF50;
    border: 1px solid green;
    color: white;
    padding: 7px 16px;
    text-align: center;
    text-decoration: none;
    display: inline;
    font-size: 10px;
    cursor: pointer;
    float: center;
}

.button:hover {
    background-color: #3e8e41;
}
</style>
<idus_martii:layout pageName="tablero">
    <table id="tableroTable">
        <tbody>
	        <tr>
		        <td class="datosJugador">
			        <span id="nombreJugador">Jugador: <c:out value="${jugador.user.username}"/> </span><br><br>
			        <span id="tiempoPartida">Tiempo de partida: <c:out value="${temporizador}"/></span><br><br>
			        <span id="espectadores">Espectadores: 2 </span><img src="/resources/images/ojo.png" width="15px" id="imgespectador" /><br>
		        </td>
	        	<td class="juego" rowspan="2">
	        		<c:if test="${ronda.numRonda == 1 && (jugador.user.username == turno.edil1.user.username || jugador.user.username == turno.edil2.user.username)}">
	        			<a href="/partida/juego/${partida.id}/votar/rojo"><img src="/resources/images/votacion_negativa.jpg" width="150px" id="votacionnegativa" /></a>
	        			
	        			<a href="/partida/juego/${partida.id}/votar/verde"><img src="/resources/images/votacion_positiva.jpg" width="150px" id="votacionpositiva" /></a>
	        		</c:if>
	        	
	        	
	        	</td>
	        	<td class="faccionactual" rowspan="2">
	        		<br>
	        		<span style="font-size:20px;">Rol actual: 
	        		<c:if test="${jugador.user.username == turno.consul.user.username}">
	        			Cónsul
	        		</c:if>
	        		<c:if test="${jugador.user.username == turno.predor.user.username}">
	        			Predor
	        		</c:if>
	        		<c:if test="${jugador.user.username == turno.edil1.user.username}">
	        			Edil
	        		</c:if>
	        		<c:if test="${jugador.user.username == turno.edil2.user.username}">
	        			Edil
	        		</c:if>
	        		<c:if test="${jugador.user.username != turno.consul.user.username && jugador.user.username != turno.predor.user.username && jugador.user.username != turno.edil1.user.username && jugador.user.username != turno.edil2.user.username}">
	        			Sin rol
	        		</c:if>
	        		</span> 
	        		<hr>
	        		<span>Facción:</span> 
					<c:if test="${jugador.id == faccion.jugador.id && faccion.faccionSelecionada == 'Traidor'}">
	        			Traidor
	        			<img src="/resources/images/faccion_traidor.jpg" id="faccionactual"/>
	        		</c:if>
	        		<c:if test="${jugador.id == faccion.jugador.id && faccion.faccionSelecionada == 'Leal'}">
	        			Leal
	        			<img src="/resources/images/faccion_leal.jpg" id="faccionactual"/>
	        		</c:if>
	        		<c:if test="${jugador.id == faccion.jugador.id && faccion.faccionSelecionada == 'Mercader'}">
	        			Mercader
	        			<img src="/resources/images/faccion_mercader.jpg" id="faccionactual"/>
	        		</c:if>
	        		<c:if test="${jugador.id == faccion.jugador.id && faccion.faccionSelecionada == NULL}">
	        			No asignada
	        			<img src="/resources/images/idus-martii.jpg" id="faccionposible3"/>
	        			<img src="/resources/images/idus-martii.jpg" id="faccionposible4"/>
	        			<c:if test="${faccion.faccionPosible1 == 'Mercader'}">
	        				<img src="/resources/images/faccion_mercader.jpg" id="faccionposible1"/>
	        			</c:if>
	        			<c:if test="${faccion.faccionPosible1 == 'Leal'}">
	        				<img src="/resources/images/faccion_leal.jpg" id="faccionposible1"/>
	        			</c:if>
	        			<c:if test="${faccion.faccionPosible1 == 'Traidor'}">
	        				<img src="/resources/images/faccion_traidor.jpg" id="faccionposible1"/>
	        			</c:if>
	        			<c:if test="${faccion.faccionPosible2 == 'Mercader'}">
	        				<img src="/resources/images/faccion_mercader.jpg" id="faccionposible2"/>
	        			</c:if>
	        			<c:if test="${faccion.faccionPosible2 == 'Leal'}">
	        				<img src="/resources/images/faccion_leal.jpg" id="faccionposible2"/>
	        			</c:if>
	        			<c:if test="${faccion.faccionPosible2 == 'Traidor'}">
	        				<img src="/resources/images/faccion_traidor.jpg" id="faccionposible2"/>
	        			</c:if>
	        		</c:if>
	        		<c:if test="${jugador.id != faccion.jugador.id && faccion.faccionSelecionada == NULL}">
	        			Espectador
	        			<img src="/resources/images/idus-martii.jpg" id="faccionactual"/>
	        		</c:if>
	        		
	        	</td>
	        </tr>
	        <tr>
		    	<td class="chat" rowspan="3">
		    	<table id="mensajesTable">
			        	<thead>
			        		<tr>
			            		<th>Chat<hr></th>
			        		</tr>
			        	</thead>
			        	</table>
		    	<div style="width:320px; height:500px; overflow:auto;">
			        <table id="mensajesTable">
			        	<tbody>
			       			<c:forEach items="${mensajes}" var="mensaje">
			            		<tr>
			                		<td>
										<a href="/jugadores/profile/${mensaje.jugador.id}" target="_blank"><c:out value="${mensaje.jugador.user.username}"/></a>:<c:out value="${mensaje.texto}"/>
			                		</td>
			            		</tr>   
			        		</c:forEach>
			        	</tbody>
			    	</table>
			    	</div>
			    	<form>
			        	<div class="botonmensaje">
			            	<input type="text" label="Mensaje" placeholder="Escribe un mensaje" name="mensaje"/>
			            	<button class="button" type="submit">Enviar mensaje</button>
			        	</div>
			    	</form>
		      	</td>
		      	
	        </tr>
	        <tr>
	        	<td class="roles" rowspan="2">
					<table>
						<tr>
							<td id="tdrol"></td>
							<td>Cónsul: <c:out value="${turno.consul.user.username}"/></td>
							<td>Predor: <c:out value="${turno.predor.user.username}"/></td>
							<td>Edil: <c:out value="${turno.edil1.user.username}"/></td>
							<td>Edil: <c:out value="${turno.edil2.user.username}"/></td>
						</tr>
						<tr>
							<td></td>
							<td><img src="/resources/images/consul.jpg" width="150px" id="rolimg" /></td>
							<td><img src="/resources/images/predor.jpg" width="150px" id="rolimg" /></td>
							<td><img src="/resources/images/edil.jpg" width="150px" id="rolimg" /></td>
							<td><img src="/resources/images/edil.jpg" width="150px" id="rolimg" /></td>
						</tr>
					</table>
				</td>
				<td class="puntuacion" rowspan="2">
				<span id="spanmarcador">Marcador</span>
			
		      		<img src="/resources/images/carta_sufragio.jpg" id="marcador"/>
		      			<table id="tablapuntos">
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</table>
		      	</td>		
	        </tr>
        </tbody>
    </table>
	
</idus_martii:layout>