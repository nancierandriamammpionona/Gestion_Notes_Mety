<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des demandes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Liste des demandes</h2>
                <a href="${pageContext.request.contextPath}/demande/add" class="button">Ajouter une demande</a>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Client</th>
                            <th>Lieu</th>
                            <th>District</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${demandes}">
                            <tr>
                                <td>${d.id}</td>
                                <td>${d.date}</td>
                                <td>${d.client.nom}</td>
                                <td>${d.lieu}</td>
                                <td>${d.district}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/demande/edit/${d.id}">Modifier</a>
                                    <a href="${pageContext.request.contextPath}/demande/delete/${d.id}"
                                       onclick="return confirm('Supprimer cette demande ?')">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty demandes}">
                            <tr>
                                <td colspan="6">Aucune demande</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>