<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Meniu Principal - Gestiune Auto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       
        .hero-header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 4rem 0;
            margin-bottom: 3rem;
            border-radius: 0 0 15px 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .icon-large {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="bg-light">

    <div class="hero-header text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">🚘 Aplicație Gestiune Auto</h1>
            <p class="lead">Sistem de administrare pentru Șoferi, Vehicule și Performanțe</p>
        </div>
    </div>

    <div class="container">
        <div class="row g-4 justify-content-center">
            
            <div class="col-md-4">
                <div class="card h-100 p-4 text-center shadow-sm">
                    <div class="card-body">
                        <div class="icon-large">👥</div>
                        <h3 class="card-title text-primary fw-bold">Șoferi</h3>
                        <p class="card-text text-muted mb-4">
                            Adaugă, vizualizează, modifică sau șterge șoferii din baza de date.
                        </p>
                        <a href="gestiune_Soferi.jsp" class="btn btn-primary w-100 py-2 rounded-pill stretched-link">
                            Accesează Șoferi
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 p-4 text-center shadow-sm">
                    <div class="card-body">
                        <div class="icon-large">🚗</div>
                        <h3 class="card-title text-success fw-bold">Vehicule</h3>
                        <p class="card-text text-muted mb-4">
                            Administrează parcul auto. Gestionează mărci, modele și numere de înmatriculare.
                        </p>
                        <a href="gestiune_Vehicule.jsp" class="btn btn-success w-100 py-2 rounded-pill stretched-link">
                            Accesează Vehicule
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 p-4 text-center shadow-sm">
                    <div class="card-body">
                        <div class="icon-large">🚀</div>
                        <h3 class="card-title text-warning fw-bold text-dark">Specificații</h3>
                        <p class="card-text text-muted mb-4">
                            Asociază șoferii cu vehiculele și definește specificațiile tehnice (CP, Cuplu, Kg).
                        </p>
                        <a href="tabela_Performante.jsp" class="btn btn-warning w-100 py-2 rounded-pill stretched-link text-dark fw-bold">
                            Vezi Performanțe
                        </a>
                    </div>
                </div>
            </div>

        </div>

        <footer class="mt-5 text-center text-muted">
            <p>&#169; 2026 Proiect Java Web & MySQL</p>
        </footer>
    </div>

</body>
</html>