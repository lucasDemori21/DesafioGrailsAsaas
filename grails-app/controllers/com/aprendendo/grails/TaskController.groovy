package com.aprendendo.grails

import com.aprendendo.grails.Pagamento

class TaskController {

    def list() {
        List<Pagamento> pagamentos = Pagamento.list()
        render(view: "list", model: [pagamentos: pagamentos])
    }

    def create() {
        render(view: "createForm")

    }

    def showUpdate(int id){

        Pagamento pagamento = Pagamento.findById(id)

        render(view: "update", model: [pagamento: pagamento])
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

