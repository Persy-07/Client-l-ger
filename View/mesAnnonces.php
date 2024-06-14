<?php include 'include/element.php'; ?> 
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Mes annonces - Furniture Annonce</title>
    <?php include 'include/header.php'; ?>  
    <style>
        .table-responsive {
            display: block;
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
        .table img {
            max-width: 100px; /* Adjust the image size to fit within the table */
            height: auto;
        }
        .table th, .table td {
            white-space: nowrap; /* Prevent text from wrapping and exceeding cell width */
        }
        .main-panel {
            width: 100%; /* Ensure the main panel takes full width */
        }
    </style>
</head>
<body style="background-color: #f2edf3">
<div class="container-scroller">
    <?php include 'include/navigation.php'; ?> 
    <div class="container-fluid page-body-wrapper">
        <div class="main-panel">
            <div class="content-wrapper container">
                <div class="row">
                    <div class="grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h1>Mes annonces</h1>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Photo</th>
                                            <th>Titre</th>
                                            <th>Catégorie</th>
                                            <th>Livraison</th>
                                            <th>Date</th>
                                            <th>Vues</th>
                                            <th>Prix</th>
                                            <th>Supprimer</th>
                                        </tr>
                                        <?php
                                        $req = $pdo->prepare('SELECT * FROM annonce WHERE vendeur = ?');
                                        $req->execute(array($uid));
                                        $result = $req->fetchAll();
                                        foreach($result as $row) {
                                            $req2 = $pdo->query("SELECT * FROM categorie WHERE idc=" . $row['categorie']);
                                            $ligne2 = $req2->fetch();
                                            ?><tr>
                                            <td class='align-middle'><img src='../<?= $row["photo"] ?>' width='60'></td>
                                            <td class='align-middle'><?= $row["titre"] ?></td>
                                            <td class='align-middle'><?= $ligne2["nomCat"] ?></td>
                                            <?php
                                            if ($row["livraison"] == 1) {
                                                echo "<td class='align-middle'><i class='fas fa-check'></i></td>";
                                            } else {
                                                echo "<td class='align-middle'><i class='fas fa-times'></i></td>";
                                            }
                                            ?>
                                            <td class='align-middle'><?= $row["date"] ?></td>
                                            <td class='align-middle'><?= $row["vue"] ?></td>
                                            <td class='align-middle'><?= $row["prix"] ?>€</td>
                                            <td class='align-middle'>
                                                <a class="btn btn-sm btn-info" href="editAnnonce.php?ida=<?= $row["ida"] ?>"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <a href='action_get.php?action=supAnnonce&ida=<?= $row["ida"] ?>' class="btn btn-sm btn-danger"><i class='fas fa-trash'></i></a></td>
                                            </tr>
                                            <?php
                                        }
                                        ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php include 'include/footer.php'; ?> 
        </div>
    </div>
</div>
<?php include 'include/script.php'; ?> 
</body>
</html>