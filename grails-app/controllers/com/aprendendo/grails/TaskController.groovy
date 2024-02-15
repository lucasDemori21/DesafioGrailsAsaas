package com.aprendendo.grails

import groovy.sql.Sql

class TaskController {

    def dataSource // O dataSource será injetado automaticamente pelo Grails

    def list() {
        render(view: "list")
    }

    def create() {
        render(view: "createForm")
    }

    def cadastrar() {

        def nome = params.nome // Supondo que o nome esteja vindo do formulário
        def valor = params.valor // Supondo que o valor esteja vindo do formulário

        def sql = new Sql(dataSource) // Criando um objeto Sql com a conexão do dataSource

        try {
            sql.executeUpdate("INSERT INTO pagamento (nome, valor) VALUES (?, ?)", [nome, valor])
            print("Deu boa")
            render "OK"// Redireciona para a página inicial ou outra página desejada após a inserção
        } catch (Exception e) {
            print("Deu ruim") // Redireciona para a página inicial ou outra página desejada em caso de erro
            render "Ocorreu um erro ao inserir o registro: ${e.message}"
        } finally {
            sql.close() // Fecha a conexão com o banco de dados
        }
    }
}

