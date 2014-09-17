package com.igreja.se

class Evento {

	String nome
	String descricao
	Float valorInscricao
	
	String pais
	String estado
	String cidade
	String endereco 
	
	String informacoes
	
	List<Inscricao> inscricoes 
	
	
    static constraints = {
		nome nullable:false, blank:false
		descricao nullable:false, blank:false
		valorInscricao nullable:false, blank:false
    }
}
