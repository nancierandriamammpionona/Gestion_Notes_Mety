<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des clients</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Liste des clients</h2>
                <a href="${pageContext.request.contextPath}/clientForrage/add" class="button">Ajouter un client</a>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Contact</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${clientForrage}">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.nom}</td>
                                <td>${c.contact}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/clientForrage/edit/${c.id}">Modifier</a>
                                    <a href="${pageContext.request.contextPath}/clientForrage/delete/${c.id}" 
                                       onclick="return confirm('Supprimer ?')">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty clientForrage}">
                            <tr>
                                <td colspan="4">Aucun client</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>