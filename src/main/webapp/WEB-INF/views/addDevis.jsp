<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter un devis</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="app-layout">
        <jsp:include page="menu.jsp" />
        <main class="main-content">
            <div class="container">
                <h2>Créer un nouveau devis</h2>

                <form action="${pageContext.request.contextPath}/devis/save" method="post">
                    <div class="form-group">
                        <label>Date :</label>
                        <input type="date" name="date" value="${devis.date}" required>
                    </div>

                    <div class="form-group">
                        <label>Demande :</label>
                        <select name="demande.id" required>
                            <option value="">-- Sélectionner une demande --</option>
                            <c:forEach var="d" items="${demandes}">
                                <option value="${d.id}">${d.description}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Type de devis :</label>
                        <select name="typeDevis.id" required>
                            <option value="">-- Sélectionner un type --</option>
                            <c:forEach var="t" items="${types}">
                                <option value="${t.id}">${t.libelle}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <h3>Détails du devis</h3>
                    <table id="detailsTable">
                        <thead>
                            <tr>
                                <th>Libelle</th>
                                <th>Prix Unitaire</th>
                                <th>Quantité</th>
                                <th>Montant</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                 <td><input type="text" name="details[0].libelle" required></td>
                                 <td><input type="number" step="0.01" name="details[0].prixUnitaire" class="pu" required value="0"></td>
                                 <td><input type="number" name="details[0].quantite" class="qte" required value="0"></td>
                                 <td><input type="number" name="details[0].montant" class="montant" readonly value="0"></td>
                                 <td><button type="button" class="button removeBtn">Supprimer</button></td>
                             </tr>
                        </tbody>
                    </table>

                    <button type="button" id="addRowBtn" class="button">Ajouter une ligne</button>

                    <h3>Total : <input type="number" id="total" readonly value="0"></h3>

                    <button type="submit" class="button">Enregistrer le devis</button>
                </form>
            </div>
        </main>
    </div>

    <script>
        $(document).ready(function() {
            let rowIndex = 1; 

            function recalc() {
                let total = 0;
                $('#detailsTable tbody tr').each(function() {
                    let pu = parseFloat($(this).find('.pu').val()) || 0;
                    let qte = parseInt($(this).find('.qte').val()) || 0;
                    let montant = pu * qte;
                    $(this).find('.montant').val(montant.toFixed(2));
                    total += montant;
                });
                $('#total').val(total.toFixed(2));
            }

            $(document).on('input', '.pu, .qte', recalc);

            $('#addRowBtn').click(function() {
                let newRow = `<tr>
                    <td><input type="text" name="details[${rowIndex}].libelle" required></td>
                    <td><input type="number" step="0.01" name="details[${rowIndex}].prixUnitaire" class="pu" required></td>
                    <td><input type="number" name="details[${rowIndex}].quantite" class="qte" required></td>
                    <td><input type="number" name="details[${rowIndex}].montant" class="montant" readonly></td>
                    <td><button type="button" class="button removeBtn">Supprimer</button></td>
                </tr>`;
                $('#detailsTable tbody').append(newRow);
                rowIndex++;
            });

            $(document).on('click', '.removeBtn', function() {
                $(this).closest('tr').remove();
                recalc();
            });
        });
    </script>
</body>
</html>