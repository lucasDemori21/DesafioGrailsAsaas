
<meta name="layout" content="main"/>
<title>Editar pagamento</title>

<div class="w-100 my-5 d-flex justify-content-around">
  <h2 class="text-center">Editar pagamento</h2>
  <a class="btn btn-primary" href="/">Listar pagamentos</a>
</div>

<g:each var="pagamento" in="${pagamentos}">
  <div class="container w-50">
    <form>
      <input type="hidden" value="${pagamento.id}" id="id"/>
      <div class="mb-3">
        <label for="nome" class="form-label">Nome</label>
        <input class="form-control" type="text" value="${pagamento.nome}" name="nome" id="nome"/>
      </div>
      <div class="mb-3">
        <label for="valor" class="form-label">Valor</label>
        <input class="form-control money" type="text" name="valor" id="valor"
               value="${pagamento.valor}"/>
      </div>
      <div class="d-flex justify-content-end">
        <button onclick="destroy()" type="button" class="btn btn-danger"> <i class="bi bi-trash-fill me-1"></i>Excluir</button>
        <button onclick="editar()" type="button" class="btn btn-success ms-3">Editar</button>
      </div>
    </form>
  </div>
</g:each>
