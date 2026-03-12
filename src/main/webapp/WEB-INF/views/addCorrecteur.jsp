<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter Correcteur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Ajouter Correcteur</h2>
                <form action="${pageContext.request.contextPath}/correcteur/save" method="post">
                    <div class="form-group">
                        <label>Nom :</label>
                        <input type="text" name="nom" required/>
                    </div>
                    <div class="buttons">
                        <button type="submit">Ajouter</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>