<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Gestiune Șoferi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5 bg-light">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary fw-bold">👥 Gestiune Șoferi</h2>
        <a href="index.jsp" class="btn btn-secondary">🏠 Meniu</a>
    </div>

    <%
        try {
            jb.connect();
            if(request.getParameter("ids") != null) {
                jb.stergeSofer(Integer.parseInt(request.getParameter("ids")));
                response.sendRedirect("gestiune_Soferi.jsp");
            }
            if(request.getParameter("add") != null) {
                jb.adaugaSofer(request.getParameter("n"), request.getParameter("p"), request.getParameter("c"));
                response.sendRedirect("gestiune_Soferi.jsp");
            }
        } catch(Exception e) { out.println("<div class='alert alert-danger'>"+e.getMessage()+"</div>"); }
    %>

    <div class="card p-4 shadow-sm mb-4 border-0">
        <h5 class="mb-3 text-secondary">Adaugă Șofer Nou</h5>
        <form method="POST" class="row g-2">
            <div class="col-md-3"><input type="text" name="n" placeholder="Nume" class="form-control" required></div>
            <div class="col-md-3"><input type="text" name="p" placeholder="Prenume" class="form-control" required></div>
            <div class="col-md-3"><input type="text" name="c" placeholder="CNP" class="form-control" required></div>
            <div class="col-md-3"><button name="add" class="btn btn-primary w-100">➕ Adaugă</button></div>
        </form>
    </div>

    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-dark">
            <tr><th>ID</th><th>Nume</th><th>Prenume</th><th>CNP</th><th class="text-center">Acțiuni</th></tr>
        </thead>
        <tbody>
            <% ResultSet rs = jb.vedeSoferi(); while(rs.next()){ %>
            <tr>
                <td><%= rs.getInt("idsofer") %></td>
                <td class="fw-bold"><%= rs.getString("nume") %></td>
                <td><%= rs.getString("prenume") %></td>
                <td><%= rs.getString("cnp") %></td>
                <td class="text-center">
                    <a href="modifica_Sofer.jsp?id=<%= rs.getInt("idsofer") %>" class="btn btn-warning btn-sm">✏️ Edit</a>
                    <a href="gestiune_Soferi.jsp?ids=<%= rs.getInt("idsofer") %>" class="btn btn-danger btn-sm" onclick="return confirm('Sigur ștergi?')">🗑️ Șterge</a>
                </td>
            </tr>
            <% } jb.disconnect(); %>
        </tbody>
    </table>
</body>
</html>