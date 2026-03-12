<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Note finale par matière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Obtenir la note finale d'une matière</h2>
                <form action="${pageContext.request.contextPath}/calculNoteFinale" method="post">
                    <div class="form-group">
                        <label>ID Candidat :</label>
                        <input type="number" name="idCandidat" required placeholder="Ex: 123">
                    </div>
                    <div class="form-group">
                        <label>Matière :</label>
                        <select name="idMatiere" required>
                            <option value="" disabled selected>-- Sélectionnez une matière --</option>
                            <c:forEach var="matiere" items="${matieres}">
                                <option value="${matiere.id}">${matiere.matiere}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit">Calculer</button>
                </form>
                <c:if test="${not empty noteFinale}">
                    <div class="result">
                        Note finale : <b>${noteFinale}</b> / 20
                    </div>
                </c:if>
            </div>
        </main>
    </div>
</body>
</html>