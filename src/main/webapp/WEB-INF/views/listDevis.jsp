<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des devis</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Liste des devis</h2>
                <a href="${pageContext.request.contextPath}/devis/add" class="button">Ajouter un nouveau devis</a>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Demande</th>
                            <th>Type de devis</th>
                            <th>Date</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${devisList}">
                            <tr>
                                <td>${d.id}</td>

                                <!-- Affichage sécurisé de la demande et du client -->
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty d.demande}">
                                            ${d.demande.lieu} - ${d.demande.district}
                                            <c:choose>
                                                <c:when test="${not empty d.demande.client}">
                                                    - ${d.demande.client.nom} (${d.demande.client.contact})
                                                </c:when>
                                                <c:otherwise>
                                                    - Client non renseigné
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            Demande non renseignée
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${not empty d.typeDevis}">
                                            ${d.typeDevis.libelle}
                                        </c:when>
                                        <c:otherwise>
                                            Type non renseigné
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${not empty d.date}">
                                            ${d.date}
                                        </c:when>
                                        <c:otherwise>
                                            Date non renseignée
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <!-- Calcul total -->
                                <td>
                                    <c:set var="total" value="0"/>
                                    <c:forEach var="det" items="${d.details}">
                                        <c:set var="total" value="${total + (det.montant != null ? det.montant : 0)}"/>
                                    </c:forEach>
                                    ${total}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>