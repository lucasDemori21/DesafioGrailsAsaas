<!DOCTYPE html>
<html>
<head>
    <title>Lista de Tarefas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-md">
        <a class="navbar-brand" href="/#"><asset:image src="grails.svg" alt="Grails Logo"/></a>
    </div>
</nav>
<div class="w-100 my-5 d-flex justify-content-around">
    <h2 class="text-center">Lista de coisas a pagar</h2>
    <a class="btn btn-primary" href="/create/payment">Gerar mais pagamentos</a>
</div>

<div class="container mx-auto">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Valor</th>
            <th>Nome</th>
            <th>#</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>1</th>
            <td>R$100,00</td>
            <td>Otto</td>
            <td>
                <button class="btn btn-success">Pagar</button>
                <button class="btn btn-warning">Ver detalhes</button>
            </td>
        </tr>
        <tr>
            <th>2</th>
            <td>R$300,00</td>
            <td>Thornton</td>
            <td>
                <button class="btn btn-success">Pagar</button>
                <button class="btn btn-warning">Ver detalhes</button>
            </td>
        </tr>
        <tr>
            <th>3</th>
            <td>R$1500,00</td>
            <td>@twitter</td>
            <td>
                <button class="btn btn-success">Pagar</button>
                <button class="btn btn-warning">Ver detalhes</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>