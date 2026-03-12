<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
    <div class="sidebar-header">
        <span class="app-name"><i class="fas fa-graduation-cap"></i> Gestion Étudiante</span>
    </div>
    <nav class="sidebar-nav">
        <a href="${pageContext.request.contextPath}/correcteurs"><i class="fas fa-users"></i> Liste des Correcteurs</a>
        <a href="${pageContext.request.contextPath}/candidats"><i class="fas fa-user-graduate"></i> Liste des Candidats</a>
        <a href="${pageContext.request.contextPath}/resultats"><i class="fas fa-chart-bar"></i> Résultats par matière</a>
        <a href="${pageContext.request.contextPath}/calculNoteFinale"><i class="fas fa-calculator"></i> Calcul note finale</a>
    </nav>
</div>