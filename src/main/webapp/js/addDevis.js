$(document).ready(function() {
    let rowIndex = 1; // Première ligne déjà à 0

    // Fonction pour recalculer montant et total
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

    // Recalcul automatique sur PU et Qte
    $(document).on('input', '.pu, .qte', recalc);

    // Ajouter une nouvelle ligne
    $('#addRowBtn').click(function() {
        let newRow = `<tr>
            <td><input type="text" name="details[${rowIndex}].libelle" required></td>
            <td><input type="number" step="0.01" name="details[${rowIndex}].prixUnitaire" class="pu" required></td>
            <td><input type="number" name="details[${rowIndex}].quantite" class="qte" required></td>
            <td><input type="number" name="details[${rowIndex}].montant" class="montant" readonly></td>
            <td><button type="button" class="removeBtn">Supprimer</button></td>
        </tr>`;
        $('#detailsTable tbody').append(newRow);
        rowIndex++;
    });

    // Supprimer une ligne
    $(document).on('click', '.removeBtn', function() {
        $(this).closest('tr').remove();
        recalc();
    });
});