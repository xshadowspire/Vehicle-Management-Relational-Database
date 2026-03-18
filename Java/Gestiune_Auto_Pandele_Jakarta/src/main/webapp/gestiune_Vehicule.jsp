<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Gestiune Vehicule</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5 bg-light">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-success fw-bold">🚗 Gestiune Vehicule</h2>
        <a href="index.jsp" class="btn btn-secondary">🏠 Meniu</a>
    </div>

    <%
        try {
            jb.connect();
            
            if(request.getParameter("idv") != null) {
                jb.stergeVehicul(Integer.parseInt(request.getParameter("idv")));
                response.sendRedirect("gestiune_Vehicule.jsp");
            }
            
            if(request.getParameter("add") != null) {
                jb.adaugaVehicul(request.getParameter("m"), request.getParameter("mo"), request.getParameter("nr"));
                response.sendRedirect("gestiune_Vehicule.jsp");
            }
        } catch(Exception e) { out.println("<div class='alert alert-danger'>"+e.getMessage()+"</div>"); }
    %>

    <div class="card p-4 shadow-sm mb-4 border-0">
        <h5 class="mb-3 text-secondary">Adaugă Vehicul Nou</h5>
        <form method="POST" class="row g-2">
            <div class="col-md-3"><input type="text" name="m" placeholder="Marca" class="form-control" required></div>
            <div class="col-md-3"><input type="text" name="mo" placeholder="Model" class="form-control" required></div>
            <div class="col-md-3"><input type="text" name="nr" placeholder="Nr. Inmatriculare" class="form-control" required></div>
            <div class="col-md-3"><button name="add" class="btn btn-success w-100">➕ Adaugă</button></div>
        </form>
    </div>

    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-dark">
            <tr><th>ID</th><th>Marca</th><th>Model</th><th>Nr. Inmatriculare</th><th class="text-center">Acțiuni</th></tr>
        </thead>
        <tbody>
            <% ResultSet rs = jb.vedeVehicule(); while(rs.next()){ %>
            <tr>
                <td><%= rs.getInt("idvehicul") %></td>
                <td class="fw-bold"><%= rs.getString("marca") %></td>
                <td><%= rs.getString("model") %></td>
                <td><%= rs.getString("nr_inmatriculare") %></td>
                <td class="text-center">
                    <a href="modifica_Vehicul.jsp?id=<%= rs.getInt("idvehicul") %>" class="btn btn-warning btn-sm">✏️ Edit</a>
                    <a href="gestiune_Vehicule.jsp?idv=<%= rs.getInt("idvehicul") %>" class="btn btn-danger btn-sm" onclick="return confirm('Ștergi acest vehicul?')">🗑️ Șterge</a>
                </td>
            </tr>
            <% } jb.disconnect(); %>
        </tbody>
    </table>
</body>
</html>