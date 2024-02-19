package com.aprendendo.grails


import grails.gorm.transactions.Transactional


class TaskController {

    def list() {
        List<Pagamento> pagamentos = Pagamento.list()
        render(view: "list", model: [pagamentos: pagamentos])
    }

    def showCreate() {
        render(view: "create")
    }

    def listPay(){
        List<Pagas> pagas = Pagas.list()
        render(view: "listpay", model: [pagas: pagas])
    }

    def showUpdate(int id) {
        Pagamento pagamento = Pagamento.findById(id)
        render(view: "update", model: [pagamentos: pagamento])
    }

    def update(int id) {
        try {
            String nome = params.nome
            String valorString = params.valor.replaceAll("\\.", "").replace(",", ".")
            BigDecimal valor = new BigDecimal(valorString)

            Pagamento pagamento = null

            Pagamento.withTransaction { status ->

                pagamento = Pagamento.get(id)

                if (!pagamento) {
                    println("Pagamento não encontrado com o ID: $id")
                    return
                }

                pagamento.nome = nome
                pagamento.valor = valor

                if (!pagamento.save(flush: true)) {
                    println("Erro ao salvar o pagamento.")
                    status.setRollbackOnly()
                    return
                }
            }

            render("OK")
        } catch (Exception exception) {
            println("Erro: ${exception.message}")
            render("Erro")
        }
    }

    def showPay(int id) {
        Pagamento pagamento = Pagamento.findById(id)
        render(view: "pay", model: [pagamentos: pagamento])
    }


    def create() {
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

    @Transactional
    def destroy(int id) {
        Pagamento pagamento = Pagamento.get(id)
        pagamento.delete(flush: true)
        render("OK")
    }

    @Transactional
    def pay(int id){
        Pagamento pagamento = Pagamento.get(id)
        Pagas newPayment = new Pagas();

        newPayment.nome = pagamento.nome;
        newPayment.valor = pagamento.valor as BigDecimal;

        if(newPayment.save()){
            pagamento.delete(flush: true)
            render("OK")
        }
    }
}

