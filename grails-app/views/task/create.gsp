
<meta name="layout" content="main"/>
<title>Criar pagamento</title>


<div class="w-100 my-5 d-flex justify-content-around">
  <h2 class="text-center">Gerar pagamentos</h2>
  <a class="btn btn-primary" href="/">Listar pagamentos</a>
</div>

<div class="container w-50 mx-auto">
  <div class="mb-3">
    <label for="nome" class="form-label">Nome</label>
    <input type="text" class="form-control" id="nome" placeholder="João">
  </div>
  <div class="mb-3">
    <label for="valor" class="form-label">Valor</label>
    <input type="text" class="form-control money" id="valor" placeholder="R$ 199,90">
  </div>

  <div class="d-flex justify-content-end w-100">
    <button class="btn btn-primary" onclick="cadastrar()" >Cadastrar pagamento</button>
  </div>
</div>

