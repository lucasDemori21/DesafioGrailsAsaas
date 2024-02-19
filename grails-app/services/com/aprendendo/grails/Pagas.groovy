package com.aprendendo.grails

import grails.gorm.annotation.Entity

@Entity
class Pagas {

    String nome
    BigDecimal valor

    static constraints = {
        nome(nullable: false, blank: false)
        valor(nullable: false)
    }
}
