<%--
  Created by IntelliJ IDEA.
  User: imia
  Date: 04.02.2023
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@page import="data.CoordinatesList" %>
<%@ page import="data.Coordinates" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="list" class="data.CoordinatesList" scope="application"/>
<div class="result-title">
    <h2 class="plate-top-title">Таблица результатов</h2>
</div>
<div class="scroll-box">
    <table id="result-table">
        <thead>
        <th >X</th>
        <th >Y</th>
        <th >R</th>
        <th >Result</th>
        <th >Time</th>
        <th >Execution time</th>
        </thead>
        <tbody id="table_out">
        <%
            if (list != null) {
                for (Coordinates check : list.getCollection()) {
        %>
        <tr>
            <td><%=check.getX()%></td>
            <td><%=check.getY()%></td>
            <td><%=check.getR()%></td>
            <td style='color:<%=(check.getHitFact() ? "green" : "red")%>'><%= check.getHitFact() ? "hit" : "miss" %></td>
            <td><%=check.getCurrentTime()%></td>
            <td><%=check.getExecutionTime()%></td>
        </tr><%
                }
            }
        %></tbody>
    </table>
</div>