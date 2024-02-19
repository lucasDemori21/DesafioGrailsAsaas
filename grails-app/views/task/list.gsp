<%@ page import="java.text.NumberFormat" %>

<meta name="layout" content="main"/>
<title>Lista de pagamentos</title>

<div class="w-100 my-5 d-flex justify-content-around">
    <h2 class="text-center">Lista de coisas a pagar</h2>
    <a class="btn btn-primary" href="/create/payment">Gerar mais pagamentos</a>
    <a class="btn btn-primary" href="/listar/pagos">Listar pagos</a>
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
        <g:each var="pagamento" in="${pagamentos}">
            <tr>
                <td>${pagamento.id}</td>
                <td>${pagamento.nome}</td>
                <td>
                   ${NumberFormat.getCurrencyInstance(new Locale('pt', 'BR')).format(pagamento.valor)}
                </td>
                <td>
                    <a href="/showPay/${pagamento.id}" class="btn btn-success"><i class="bi bi-coin me-1"></i>Pagar</a>
                    <a href="/showEdit/${pagamento.id}" class="btn btn-primary"><i class="bi bi-pencil-fill me-1"></i>Editar</a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
