<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="idus_martii" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<idus_martii:layout pageName="partidas">
    <h2>Partidas creadas</h2>
<p><c:out value="${now}"/></p>
    <table id="turnosTable" class="table table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th>Creador</th>
            <th>Facción Ganadora</th>
            <th>Número de jugadores</th>
            <th>Fecha de creación</th>
            <th>Fecha de inicio</th>
            <th>Fecha de finalización</th>
            <th>Duración</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${partidas}" var="partida">
            <tr>
                <td>
                   <a href="/partida/${partida.id}/detalles" target="_blank"><c:out value="${partida.id}"/></a>
                </td>
                <td>                    
                      <a href="/jugadores/profile/${partida.jugador.id}" target="_blank"><c:out value="${partida.jugador.user.username}"/></a>                                      
                </td>
                 <td>                    
                      <c:out value="${partida.faccionGanadora}"/>                                        
                </td>
                <td>                    
                      <c:out value="${partida.numeroJugadores}"/>                                        
                </td>
                <td>                    
                      <fmt:parseDate value="${ partida.fechaCreacion }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${ parsedDateTime }" />                                        
                </td>
                 <td>          
                	<fmt:parseDate value="${ partida.fechaInicio }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${ parsedDateTime }" />           
                </td>
                <td>                    
                      <fmt:parseDate value="${ partida.fechaFin }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${ parsedDateTime }" />                                        
                </td>
                <td>                    
                     <c:if test="${partida.duration!=null}">
	        			<c:out value="${partida.duration[0]}"/> horas 
                      	<c:out value="${partida.duration[1]}"/> minutos
                      	<c:out value="${partida.duration[2]}"/> segundos 
	        		</c:if>
	        		<c:if test="${partida.duration==null}">
	        			La partida no ha terminado
	        		</c:if>                               
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</idus_martii:layout>