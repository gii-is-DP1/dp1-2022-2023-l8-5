<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<petclinic:layout pageName="achievements">
    <h2>Logros</h2>

    <table id="achievementsTable" class="table table-striped">
        <thead>
        <tr>
            <th>Título</th>
            <th>Descripción</th>
            <th>Icono</th>
            <th>Umbral</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${achievements}" var="achievement">
            <tr>
                <td>
                    <c:out value="${achievement.name}"/>
                </td>
                <td>                    
                     <c:out value="${achievement.actualDescription} "/>                                          
                </td>
                <td>                    
                    <c:if test="${achievement.badgeImage == ''}">none</c:if>
                    <c:if test="${achievement.badgeImage != ''}">
                        <img src="${achievement.badgeImage}" width="100px"  />
                    </c:if>
                </td>
                <td>       
                    <c:out value="${achievement.threshold} "/>
                </td>
				
            </tr>
        </c:forEach>
        </tbody>
    </table>
    

</petclinic:layout>