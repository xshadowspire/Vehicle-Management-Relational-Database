<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Performanțe Auto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5 bg-light">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-warning fw-bold text-dark">🚀 Specificații Tehnice (M:N)</h2>
        <a href="index.jsp" class="btn btn-secondary">🏠 Meniu</a>
    </div>

    <%
        try {
            jb.connect();
            if(request.getParameter("idp") != null) {
                jb.stergePerformanta(Integer.parseInt(request.getParameter("idp")));
                response.sendRedirect("tabela_Performante.jsp");
            }
            if(request.getParameter("add") != null) {
                jb.adaugaPerformanta(Integer.parseInt(request.getParameter("ids")), Integer.parseInt(request.getParameter("idv")), 
                                     Integer.parseInt(request.getParameter("hp")), Integer.parseInt(request.getParameter("nm")), Integer.parseInt(request.getParameter("kg")));
                response.sendRedirect("tabela_Performante.jsp");
            }
        } catch(Exception e) { out.println("<div class='alert alert-danger'>"+e.getMessage()+"</div>"); }
    %>

    <div class="card p-4 shadow-sm mb-4 border-0">
        <h5 class="mb-3 text-secondary">Adaugă Specificații Noi</h5>
        <form method="POST" class="row g-2">
            <div class="col-md-2"><input type="number" name="ids" placeholder="ID Șofer" class="form-control" required></div>
            <div class="col-md-2"><input type="number" name="idv" placeholder="ID Vehicul" class="form-control" required></div>
            <div class="col-md-2"><input type="number" name="hp" placeholder="HP" class="form-control"></div>
            <div class="col-md-2"><input type="number" name="nm" placeholder="Nm" class="form-control"></div>
            <div class="col-md-2"><input type="number" name="kg" placeholder="Kg" class="form-control"></div>
            <div class="col-md-2"><button name="add" class="btn btn-warning w-100">➕ Adaugă</button></div>
        </form>
    </div>

    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-dark">
            <tr><th>Șofer</th><th>Vehicul</th><th>HP</th><th>Nm</th><th>Kg</th><th class="text-center">Acțiuni</th></tr>
        </thead>
        <tbody>
            <% ResultSet rs = jb.vedePerformante(); while(rs.next()){ %>
            <tr>
                <td><%= rs.getString("nume") %> <%= rs.getString("prenume") %></td>
                <td><%= rs.getString("marca") %> <%= rs.getString("model") %></td>
                <td><%= rs.getInt("cai_putere") %> HP</td>
                <td><%= rs.getInt("cuplu_nm") %> Nm</td>
                <td><%= rs.getInt("greutate_kg") %> Kg</td>
                <td class="text-center">
                    <a href="modifica_Performanta.jsp?id=<%= rs.getInt("idperfo") %>" class="btn btn-primary btn-sm">✏️ Edit</a>
                    <a href="tabela_Performante.jsp?idp=<%= rs.getInt("idperfo") %>" class="btn btn-danger btn-sm" onclick="return confirm('Ștergi înregistrarea?')">🗑️ Șterge</a>
                </td>
            </tr>
            <% } jb.disconnect(); %>
        </tbody>
    </table>
</body>
</html>