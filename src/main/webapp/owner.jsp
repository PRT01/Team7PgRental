<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PG Owner Dashboard</title>
<link href="
https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<style>
    .header {
        background-color: grey;
        height: 70px;
        padding: 10px;
        color: white;
    }

    .navbar-brand {
        color: white;
        text-decoration: none;
    }

    .navbar-brand:hover {
        color: white;
        text-decoration: none;
    }

    .navbar-brand strong {
        font-weight: bold;
    }

    table {
        margin-top: 20px;
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: grey;
        color: white;
    }
</style>

</head>
<body>
<div class="header">
<nav class="navbar">
<a class="navbar-brand" href="#">
<strong>For PG Owners</strong>
</a>
</nav>
</div>
<h1>Booked PG List</h1>
<table>
<tr>
<th>PG ID</th>
<th>PG Name</th>
<th>Action</th>
</tr>
<c:forEach var="pg" items="${bookings}">
<tr>
<td>${pg.pgId}</td>
<td>${pg.pgName}</td>
<td><a href="PG?action=cancel&id=${pg.pgId}" style="color: #dc3545;">Cancel</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>