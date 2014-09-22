package com.igreja.se

class Inscricao {

	Pessoa pessoa
	
	String pastorResponsavel

	boolean isConfirmada
	
    static constraints = {
		pessoa nullable:false
		pastorResponsavel nullable:false, blank:false
		
    }
	
}
