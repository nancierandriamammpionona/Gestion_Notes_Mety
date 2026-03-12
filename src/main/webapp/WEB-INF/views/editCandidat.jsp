<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier Candidat</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Modifier Candidat</h2>
                <form action="${pageContext.request.contextPath}/candidat/update" method="post">
                    <input type="hidden" name="id" value="${candidat.id}"/>
                    <div class="form-group">
                        <label>Nom :</label>
                        <input type="text" name="nom" value="${candidat.nom}" required/>
                    </div>
                    <div class="form-group">
                        <label>Prénom :</label>
                        <input type="text" name="prenom" value="${candidat.prenom}" required/>
                    </div>
                    <div class="buttons">
                        <button type="submit">Modifier</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>