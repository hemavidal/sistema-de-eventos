package com.igreja.se

class Inscricao {

	Pessoa pessoa
	
	String pastorResponsavel

	Imagem comprovante
	
	boolean isConfirmada
	
	String localidadeIgreja
	
	static belongsTo = [evento:Evento]
	
	Date dataInscricao
	
    static constraints = {
		pessoa nullable:false
		pastorResponsavel nullable:false, blank:false
		localidadeIgreja blank:false, nullable:false, inList:['Igreja Local', 'Extra Local']
		dataInscricao blank:true
    }
	
	static beforeInsert = {
		dataInscricao = new Date()
	}
}
