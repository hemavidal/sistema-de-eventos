package com.igreja.se

class Inscricao {

	Pessoa pessoa
	
	String pastorResponsavel

	String comprovante
	
	boolean isConfirmada
	
	String localidadeIgreja
	
	Date dateCreated

	static belongsTo = [evento:Evento]
	
    static constraints = {
		pessoa nullable:false
		pastorResponsavel nullable:false, blank:false
		localidadeIgreja blank:false, nullable:false, inList:['Igreja Local', 'Extra Local']
    }
	
}
