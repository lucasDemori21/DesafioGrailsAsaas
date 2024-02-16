<!DOCTYPE html>
<html>
<head>
  <title>Lista de Tarefas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-md">
    <a class="navbar-brand" href="/#"><asset:image src="grails.svg" alt="Grails Logo"/></a>
  </div>
</nav>
<div class="w-100 my-5 d-flex justify-content-around">
  <h2 class="text-center">Gerar pagamentos</h2>
  <a class="btn btn-primary" href="/payments">Listar pagamentos</a>
</div>

<div class="container w-50 mx-auto">
  <div class="mb-3">
    <label for="nome" class="form-label">Nome</label>
    <input type="text" class="form-control" id="nome" placeholder="João">
  </div>
  <div class="mb-3">
    <label for="valor" class="form-label">Valor</label>
    <input type="text" class="form-control" id="valor" placeholder="R$ 199,90">
  </div>

  <div class="d-flex justify-content-end w-100">
    <button class="btn btn-primary" onclick="cadastrar()" >Cadastrar pagamento</button>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script>
  function cadastrar(){
    const nome = document.getElementById('nome').value;
    const valor = document.getElementById('valor').value;

    $.ajax({
      url: '/createPayment',
      type: 'POST',
      data: {
        nome: nome,
        valor: valor
      }
    }).done(function(obj) {
      if (obj === "OK") {
        alert("Pagamento gerado com sucesso!");
      }
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.error("Erro ao criar pagamento:", textStatus, errorThrown);
    });

  }
</script>

</body>
</html>