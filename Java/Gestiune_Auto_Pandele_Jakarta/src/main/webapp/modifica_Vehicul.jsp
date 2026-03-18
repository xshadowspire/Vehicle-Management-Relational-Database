<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Modifică Vehicul</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5">
    <div class="card p-4 shadow mx-auto" style="max-width: 500px;">
        <h2 class="text-warning mb-4 text-center">📝 Modifică Vehicul</h2>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                jb.connect();
                if(request.getParameter("save") != null) {
                    jb.modificaVehicul(id, request.getParameter("m"), request.getParameter("mo"), request.getParameter("nr"));
                    response.sendRedirect("gestiune_Vehicule.jsp");
                }
                ResultSet rs = jb.getVehiculById(id);
                if(rs.next()) {
        %>
        <form method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Marca</label>
                <input type="text" name="m" value="<%= rs.getString("marca") %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Model</label>
                <input type="text" name="mo" value="<%= rs.getString("model") %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Nr. Inmatriculare</label>
                <input type="text" name="nr" value="<%= rs.getString("nr_inmatriculare") %>" class="form-control" required>
            </div>
            <div class="d-grid gap-2">
                <button name="save" class="btn btn-success fw-bold">💾 Salvează</button>
                <a href="gestiune_Vehicule.jsp" class="btn btn-outline-secondary">Anulează</a>
            </div>
        </form>
        <% 
                } jb.disconnect(); 
            } catch(Exception e) { out.println(e.getMessage()); } 
        %>
    </div>
</body>
</html>