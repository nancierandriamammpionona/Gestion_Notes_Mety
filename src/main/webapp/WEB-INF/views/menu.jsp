<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
    <div class="sidebar-header">
        <span class="app-name"><i class="fas fa-graduation-cap"></i> ETU003608</span>
    </div>
    <nav class="sidebar-nav">
        <div class="sidebar-section">
            <div class="sidebar-section-title">
                <i class="fas fa-user-graduate"></i> Gestion Étudiante
            </div>
            <a href="${pageContext.request.contextPath}/correcteurs"><i class="fas fa-users"></i> Liste des Correcteurs</a>
            <a href="${pageContext.request.contextPath}/candidats"><i class="fas fa-user-graduate"></i> Liste des Candidats</a>
            <a href="${pageContext.request.contextPath}/resultats"><i class="fas fa-chart-bar"></i> Résultats par matière</a>
            <a href="${pageContext.request.contextPath}/calculNoteFinale"><i class="fas fa-calculator"></i> Calcul note finale</a>
        </div>

        <div class="sidebar-section">
            <div class="sidebar-section-title">
                <i class="fas fa-water"></i> Gestion Forage
            </div>
            <a href="${pageContext.request.contextPath}/clientForrage"><i class="fas fa-building"></i> Liste des clients</a>
            <a href="${pageContext.request.contextPath}/demande"><i class="fas fa-clipboard-list"></i> Liste des demandes</a>
            <a href="${pageContext.request.contextPath}/devis/list"><i class="fas fa-file-invoice-dollar"></i> liste devis</a>
        </div>
    </nav>
</div>