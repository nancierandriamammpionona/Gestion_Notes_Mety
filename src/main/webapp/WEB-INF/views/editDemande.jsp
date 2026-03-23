<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier une demande</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2><i class="fas fa-edit"></i> Modifier une demande</h2>

                <form action="${pageContext.request.contextPath}/demande/update" method="post">
                    <input type="hidden" name="id" value="${demande.id}">

                    <div class="form-group">
                        <label for="date">Date :</label>
                        <input type="date" id="date" name="date" value="${demande.date}" required>
                    </div>

                    <div class="form-group">
                        <label for="client">Client :</label>
                        <select id="client" name="client.id" required>
                            <c:forEach var="c" items="${clients}">
                                <option value="${c.id}" <c:if test="${c.id == demande.client.id}">selected</c:if>>${c.nom}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="lieu">Lieu :</label>
                        <input type="text" id="lieu" name="lieu" value="${demande.lieu}" required>
                    </div>

                    <div class="form-group">
                        <label for="district">District :</label>
                        <input type="text" id="district" name="district" value="${demande.district}" required>
                    </div>

                    <button type="submit" class="button"><i class="fas fa-save"></i> Modifier</button>
                </form>

                <div class="retour">
                    <a href="${pageContext.request.contextPath}/demande" class="button secondary"><i class="fas fa-arrow-left"></i> Retour à la liste</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>