<%@ page import="java.text.NumberFormat" %>

<meta name="layout" content="main"/>
<title>Pagar</title>

<div class="w-100 my-5 d-flex justify-content-around">
    <h2 class="text-center">Pagamento</h2>
    <a class="btn btn-primary" href="/">Listar pagamentos</a>
</div>

<g:each var="pagamento" in="${pagamentos}">
    <div class="container w-50">
        <form>
            <input type="hidden" value="${pagamento.id}" id="idpay"/>
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input class="form-control" type="text" value="${pagamento.nome}" name="nome" id="nome" readonly/>
            </div>
            <div class="mb-3">
                <label for="valor" class="form-label">Valor</label>
                <input class="form-control" type="text" name="valor" id="valor"
                       value="${NumberFormat.getCurrencyInstance(new Locale('pt', 'BR')).format(pagamento.valor)}" readonly/>
            </div>
            <div class="d-flex justify-content-end">
                <button type="button" onclick="pagar()" class="btn btn-success">Pagar</button>
            </div>
        </form>
    </div>
</g:each>
