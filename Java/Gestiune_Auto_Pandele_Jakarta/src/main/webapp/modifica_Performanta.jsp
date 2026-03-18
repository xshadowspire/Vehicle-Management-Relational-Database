<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" class="db.JavaBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>Modifică Performanțe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-5">
    <div class="card p-4 shadow mx-auto" style="max-width: 600px;">
        <h2 class="text-warning mb-4 text-center">📝 Modifică Specificații</h2>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                jb.connect();
                if(request.getParameter("save") != null) {
                    jb.modificaPerformanta(id, Integer.parseInt(request.getParameter("ids")), Integer.parseInt(request.getParameter("idv")), 
                                          Integer.parseInt(request.getParameter("hp")), Integer.parseInt(request.getParameter("nm")), Integer.parseInt(request.getParameter("kg")));
                    response.sendRedirect("tabela_Performante.jsp");
                }
                ResultSet rs = jb.getPerformantaById(id);
                if(rs.next()) {
        %>
        <form method="POST">
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label fw-bold">ID Șofer</label>
                    <input type="number" name="ids" value="<%= rs.getInt("idsofer") %>" class="form-control" required>
                </div>
                <div class="col">
                    <label class="form-label fw-bold">ID Vehicul</label>
                    <input type="number" name="idv" value="<%= rs.getInt("idvehicul") %>" class="form-control" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label fw-bold">Cai Putere (HP)</label>
                    <input type="number" name="hp" value="<%= rs.getInt("cai_putere") %>" class="form-control">
                </div>
                <div class="col">
                    <label class="form-label fw-bold">Cuplu (Nm)</label>
                    <input type="number" name="nm" value="<%= rs.getInt("cuplu_nm") %>" class="form-control">
                </div>
                <div class="col">
                    <label class="form-label fw-bold">Greutate (Kg)</label>
                    <input type="number" name="kg" value="<%= rs.getInt("greutate_kg") %>" class="form-control">
                </div>
            </div>
            <div class="d-grid gap-2">
                <button name="save" class="btn btn-success fw-bold">💾 Salvează Modificările</button>
                <a href="tabela_Performante.jsp" class="btn btn-outline-secondary">Anulează</a>
            </div>
        </form>
        <% 
                } jb.disconnect(); 
            } catch(Exception e) { out.println(e.getMessage()); } 
        %>
    </div>
</body>
</html>