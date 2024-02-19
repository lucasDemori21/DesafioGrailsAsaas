<%@ page import="java.text.NumberFormat" %>

<meta name="layout" content="main"/>
<title>Lista de pagos</title>

<div class="w-100 my-5 d-flex justify-content-around">
    <h2 class="text-center">Lista de pagos</h2>
    <a class="btn btn-primary" href="/">Listar pagamentos</a>
</div>

<div class="container mx-auto">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Valor</th>
            <th>Nome</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="pagamento" in="${pagas}">
            <tr>
                <td>${pagamento.id}</td>
                <td>${pagamento.nome}</td>
                <td>
                    ${NumberFormat.getCurrencyInstance(new Locale('pt', 'BR')).format(pagamento.valor)}
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>