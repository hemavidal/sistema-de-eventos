package com.igreja.se

class Evento {

	String nome
	String descricao
	Float valorInscricao
	
	Date inicioDoEvento
	Date fimDoEvento
	Date fimDasInscricoes
	
	
	String pais
	String estado
	String cidade
	String endereco 
	
	String informacoes
	
	static hasMany = [inscricoes:Inscricao]
	
    static constraints = {
		nome nullable:false, blank:false
		descricao nullable:false, blank:false
		valorInscricao nullable:false, blank:false
    }
}