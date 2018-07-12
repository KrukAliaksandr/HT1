<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>JSP Страница с декларациями и скриптлетами</title>

</head>

<body>

<%
    HashMap<String,String> jsp_parameters = new HashMap<String,String>();
    Person person = new Person();
    String error_message = "";

    if (request.getAttribute("jsp_parameters") != null)
    {
        jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
        request.setCharacterEncoding("UTF-8");
    }

    if (request.getAttribute("person") != null)
    {
        person=(Person)request.getAttribute("person");
    }

    error_message = jsp_parameters.get("error_message");

%>
<table align="center" border="1" width="70%">
    <tr>
        <td colspan="2" align="center">Информация о телефоне владельца:<%person.getId();%></td>

    </tr>
</table>

<h1>JSP Страница с декларациями и скриптлетами</h1>

<h3> Этот пример показывает, как работать с декларациями и скриптлетами</h3>

<!-- Декларируем переменную count-->

<%! private int count = 0; %>

<% String outParameter = request.getParameter("param");

    if (outParameter != null){

        out.println(outParameter);

    } else {

        out.println("Значение параметра не установлено");}%>

Страница была показана <%= ++count %> раз.

</body>

</html>