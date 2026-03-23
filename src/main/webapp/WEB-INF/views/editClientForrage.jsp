<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Modifier client</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2><i class="fas fa-user-edit"></i> Modifier client</h2>

                <form action="${pageContext.request.contextPath}/clientForrage/update" method="post">
                    <input type="hidden" name="id" value="${clientForrage.id}">

                    <div class="form-group">
                        <label for="nom">Nom :</label>
                        <input type="text" id="nom" name="nom" value="${clientForrage.nom}" required>
                    </div>

                    <div class="form-group">
                        <label for="contact">Contact :</label>
                        <input type="text" id="contact" name="contact" value="${clientForrage.contact}">
                    </div>

                    <button type="submit" class="button"><i class="fas fa-save"></i> Modifier</button>
                </form>

                <div class="retour">
                    <a href="${pageContext.request.contextPath}/clientForrage" class="button secondary"><i class="fas fa-arrow-left"></i> Retour</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>