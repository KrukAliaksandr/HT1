<?xml version="1.0" encoding="UTF-8" ?>
<%--<%@ page import="app.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Управление данными о человеке</title>
</head>
<body>


##############
<c:if test="${not empty 'jsp_parameters'}">
    <c:set var="map" value='${requestScope.jsp_parameters}'/>
    <br>
    <c:out value="${map['current_action']}"/>
</c:if>
<c:if test="${not empty 'person'}">

    <c:set var="object" value="${requestScope.person}"/>
    <br>
    <%--<c:out value="${pers}"/>--%>
    <br>
    <ul>
        <c:forEach var="field" items="${object['class'].declaredFields}">
            <c:catch>
                <li><span>${field.name}</span>${object[field.name]}</li>
            </c:catch>
        </c:forEach>
    </ul>
    <br>

    <c:out value="${requestScope.person.getName()}"/>
</c:if>
<br>
<c:out value="${map['error_message']}"/>
<br>
<c:set var="errar" value="${map['error_message']}"/>
<c:out value="${errar}"/>
<c:set var="edit1" value="${map['edit']}"/>
<c:out value="${edit1}"/>
############
<br>
<br>
<br>
<c:forEach var="map1" items="${requestScope.jsp_parameters}">
    <c:forEach var="hash" items="${map1.value}">
        <option><c:out value="${hash}"/></option>
    </c:forEach>
</c:forEach>
<c:choose>
    <c:when test="${requestScope['current_action']}">
        <c:out value="${map['edit']}"/>

    </c:when>
</c:choose>
-------------------------

<form action="<%=request.getContextPath()%>/" method="post">
    <input type="hidden" name="id"
           value="<c:out value="${requestScope.person.getId()}"/>"/>
    <table align="center" border="1" width="70%">

        <c:if test="${not empty fn:trim(errar)}">

            <tr>
                <td colspan="2" align="center"><span style="color:red"><c:out
                        value="${errar}"/></span></td>
            </tr>

        </c:if>
        <tr>
            <td colspan="2" align="center">Информация о человеке</td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td><input type="text" name="surname"
                       value="<c:out value="${requestScope.person.getSurname()}"/>"/>
            </td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td><input type="text" name="name"
                       value="<c:out value="${requestScope.person.getName()}"/>"/>
            </td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td><input type="text" name="middlename"
                       value="<c:out value="${requestScope.person.getMiddlename()}"/>"/>
            </td>
        </tr>
         <%-- <%
                if (jsp_parameters.get("current_action").equals("edit"))
                {
            %>--%>


                <c:if test="${not empty fn:trim(edit1)}">
                <tr>
                    <td>Телефоны:</td>
                    <td>
                 <textarea name="phones" cols="40" rows="5">
                    <%-- <c:forEach var="person" items="person.getPhones().values()">
                         <c:out value = "person"/>
                     </c:forEach>--%>
                     ++++++++++
                 </textarea>
                    </td>
                </tr>
                </c:if>


        <tr>
            <td colspan="2" align="center">
                <input type="submit"
                       name="<c:out value="${map['next_action']}"/>"
                       value="<c:out value="${map['next_action_label']}"/>"/>
                <br>
                <a href="<%=request.getContextPath()%>/">Вернутся к списку</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>