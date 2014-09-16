package com.igreja.se

class Evento {

	String nome
	String descricao
	Float inscricao
	
	String pais
	String estado
	String cidade
	String endereco 
	
	String informacoes
	
	static hasMany = [inscricoes:Inscricao]
	
	
    static constraints = {
		nome nullable:false, blank:false
		descricao nullable:false, blank:false
		inscricao nullable:false, blank:false
    }
}
