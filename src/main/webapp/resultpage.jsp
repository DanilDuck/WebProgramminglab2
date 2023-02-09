<%--
  Created by IntelliJ IDEA.
  User: imia
  Date: 04.02.2023
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="last" scope="application" type="data.Coordinates"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>result</title>
    <style>
        <%@include file="css/style.css"%>
    </style>
</head>
<body>

<br>


<table id="main-page">
    <tr>
        <td class="inform-box">
            <h1><%=last.toString()%></h1>
        </td>
    </tr>
    <tr>
        <td class="inform-box" id="table-box"  colspan="2" >
            <jsp:include page="table.jsp" />
        </td>
    </tr>
</table>
<button id="backButton" >BACK</button>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/request.js"></script>
<script src="js/backButton.js" ></script>
</body>
</html>

