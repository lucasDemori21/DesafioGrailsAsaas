package com.aprendendo.grails

import com.aprendendo.grails.Pagamento

class TaskController {

    def list() {
        def pagamentos = Pagamento.list()
        render(view: "list", model: [pagamentos: pagamentos])
    }

    def create() {
        render(view: "createForm")
    }


    def cadastrar() {

        try {
            Pagamento pagamento = new Pagamento(
                    nome: params.nome,
                    valor: params.valor as BigDecimal
            )

            if (pagamento.save()) {
                render "OK"
            } else {
                render "ERRO"
            }
        } catch (Exception exception) {
            render("Erro ao salvar pagamento: ${exception.message}")
        }
    }
}

