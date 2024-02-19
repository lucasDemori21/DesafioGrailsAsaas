function cadastrar(){

    const nome = document.getElementById('nome').value;
    const valor = document.getElementById('valor').value.replace(".", "").replace(",", ".");

    $.ajax({
        url: '/createPayment',
        type: 'POST',
        data: {
            nome: nome,
            valor: valor
        }
    }).done(function(obj) {
        if (obj === "OK") {
            Swal.fire({
                title: "Pagamento criado!",
                text: "Seu pagamento foi criado com sucesso.",
                icon: "success"
            });

            setTimeout(()=>{
                window.location.href = "/";
            },2000)
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Erro ao criar pagamento:", textStatus, errorThrown);
    });

}

function formatar() {
    var decimalSep = ',';
    var thousandSep = '.';
    var precision = parseInt($('#taxa').data('precision') || 2, 10);
    $('.money').mask('#' + thousandSep + '##0' + decimalSep + (new Array(precision + 1).join('0')), {
        'reverse': true,
        'maxlength': false
    }).on('keyup', function() {
        var val = this.value;
        if (val) {
            if (val.length <= precision) {
                while (val.length < precision) {
                    val = '0' + val;
                }
                val = '0' + decimalSep + val;
            } else {
                var parts = val.split(decimalSep);
                parts[0] = parts[0].replace(/^0+/, '');
                if (parts[0].length === 0) {
                    parts[0] = '0';
                }
                val = parts.join(decimalSep);
            }
            this.value = val;
        }
    });
}
formatar();

function destroy(){

    const id = document.getElementById('id').value;

    Swal.fire({
        title: "Você tem certeza?",
        text: "Isso não será reversível!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sim, excluir!",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                url: '/destroy/' + id,
                type: 'POST',
                data: {
                    id: id
                }
            }).done(function(obj) {
                if (obj === "OK") {
                    Swal.fire({
                        title: "Deletado!",
                        text: "Seu pagamento foi deletado com sucesso.",
                        icon: "success"
                    });
                    setTimeout(() => {
                        window.location.href = '/';
                    }, 3000)
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                Swal.fire({
                    title: "Erro!",
                    text: "Ocorreu algum erro ao deletar, tente novamente.",
                    icon: "error"
                });
            });
        }
    });
}

function editar(){

    const id = document.getElementById('id').value;
    const nome = document.getElementById('nome').value;
    const valor = document.getElementById('valor').value;

    Swal.fire({
        title: "Você tem certeza?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sim, editar!",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                url: '/edit/' + id,
                type: 'POST',
                data: {
                    id: id,
                    nome: nome,
                    valor: valor
                }
            }).done(function(obj) {
                if (obj === "OK") {
                    Swal.fire({
                        title: "Pagamento editado!",
                        text: "Seu pagamento foi editado com sucesso.",
                        icon: "success"
                    });
                    setTimeout(() => {
                        window.location.href = '/';
                    }, 3000)
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.log(errorThrown)
                Swal.fire({
                    title: "Erro!",
                    text: "Ocorreu algum erro ao editar, tente novamente.",
                    icon: "error"
                });
            });
        }
    });
}

function pagar() {
    const id = document.getElementById('idpay').value;

    Swal.fire({
        title: "deseja confirmar o pagamento?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sim, pagar!",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                url: '/confirm/pay/' + id,
                type: 'POST',
                data: {
                    id: id
                }
            }).done(function(obj) {
                if (obj === "OK") {
                    Swal.fire({
                        title: "Pago!",
                        text: "Seu pagamento foi concluído com sucesso.",
                        icon: "success"
                    });
                    setTimeout(() => {
                        window.location.href = '/';
                    }, 3000)
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                Swal.fire({
                    title: "Erro!",
                    text: "Ocorreu algum erro ao realizar pagamento, tente novamente.",
                    icon: "error"
                });
            });
        }
    });
}