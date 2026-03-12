<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultats des candidats</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Résultats des candidats par matière</h2>
                <table>
                    <tr>
                        <th>Candidat</th>
                        <th>matière</th>
                        <th>Note finale</th>
                    </tr>
                    <c:forEach var="r" items="${resultats}">
                        <tr>
                            <td>${r.nomCandidat}</td>
                            <td>${r.nomMatiere}</td>
                            <td>${r.noteFinale}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>
    </div>
</body>
</html>