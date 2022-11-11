<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="idus_martii" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<idus_martii:layout pageName="jugadores">

	<h2>Jugadores</h2>
	
	<table id="jugadoresTable" class="table table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th>Id de usuario</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${jugadores}" var="jugador">
            <tr>
                <td>
                    <c:out value="${jugador.id}"/>
                </td>
                <td>                    
                      <c:out value="${jugador.user.username} "/>                                        
                </td>
                <td> 
                    <a href="/jugadores/${jugador.id}/edit"> 
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>                            
                    </a>       
                </td>
                <td> 
                    <a href="/jugadores/${jugador.id}/delete"> 
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    </a>      
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
	
	
	
</idus_martii:layout>