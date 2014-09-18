package com.igreja.se

class Inscricao {

	Pessoa pessoa
	
	String pastorResponsavel

	boolean isConfirmada
	
    static constraints = {
		
    }
	
	static mapping = {
		pessoa column: 'pessoa_id'
	}
	
}
