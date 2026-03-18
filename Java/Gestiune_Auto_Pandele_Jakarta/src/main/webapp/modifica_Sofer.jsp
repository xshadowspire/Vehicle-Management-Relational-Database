<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Modifică Șofer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5">
    <div class="card p-4 shadow mx-auto" style="max-width: 500px;">
        <h2 class="text-warning mb-4 text-center">📝 Modifică Date</h2>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                jb.connect();
                if(request.getParameter("save") != null) {
                    jb.modificaSofer(id, request.getParameter("n"), request.getParameter("p"), request.getParameter("c"));
                    response.sendRedirect("gestiune_Soferi.jsp");
                }
                ResultSet rs = jb.getSoferById(id);
                if(rs.next()) {
        %>
        <form method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Nume</label>
                <input type="text" name="n" value="<%= rs.getString("nume") %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Prenume</label>
                <input type="text" name="p" value="<%= rs.getString("prenume") %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">CNP</label>
                <input type="text" name="c" value="<%= rs.getString("cnp") %>" class="form-control" required>
            </div>
            <div class="d-grid gap-2">
                <button name="save" class="btn btn-success fw-bold">💾 Salvează</button>
                <a href="gestiune_Soferi.jsp" class="btn btn-outline-secondary">Anulează</a>
            </div>
        </form>
        <% 
                } jb.disconnect(); 
            } catch(Exception e) { out.println(e.getMessage()); } 
        %>
    </div>
</body>
</html>