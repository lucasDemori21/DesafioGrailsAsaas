package com.aprendendo.grails

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "task", action: "list")
        "/create/payment"(controller: "task", action: "showCreate")
        "/createPayment"(controller: "task", action: "create")
        "/listar/pagos"(controller: "task", action: "listPay")

        get "/showEdit/$id"(controller: "task", action: "showUpdate")

        post "/edit/$id"(controller: "task", action: "update")

        get "/showPay/$id"(controller: "task", action: "showPay")

        post "/confirm/pay/$id"(controller: "task", action: "pay")

        post "/destroy/$id"(controller: "task", action: "destroy")

        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
