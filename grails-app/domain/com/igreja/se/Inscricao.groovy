package com.igreja.se

class Inscricao {

	Pessoa pessoa
	
	String pastorResponsavel

	static hasOne = [comprovante:Imagem]
	
	boolean isConfirmada
	
	static belongsTo = [evento:Evento]
	
    static constraints = {
		pessoa nullable:false
		pastorResponsavel nullable:false, blank:false
		
    }
	
}
