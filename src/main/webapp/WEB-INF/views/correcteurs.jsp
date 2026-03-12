<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste Correcteurs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Liste des Correcteurs</h2>
                <a href="${pageContext.request.contextPath}/correcteur/add" class="button">Ajouter un nouveau correcteur</a>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="c" items="${correcteurs}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.nom}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/correcteur/edit/${c.id}">Modifier</a>
                                <a href="${pageContext.request.contextPath}/correcteur/delete/${c.id}" onclick="return confirm('Confirmer la suppression ?')">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>
    </div>
</body>
</html>