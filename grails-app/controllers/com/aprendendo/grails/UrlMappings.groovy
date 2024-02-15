package com.aprendendo.grails

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/createPayment"(controller: "task", action: "cadastrar")
        "/payments"(controller: "task", action: "list")
        "/create/payment"(controller: "task", action: "create")
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
