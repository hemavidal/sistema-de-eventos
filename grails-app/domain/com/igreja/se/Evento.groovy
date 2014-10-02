package com.igreja.se

class Evento {

	String nome
	String descricao
	String valorInscricao
	
	Integer vagas
	String infoDeVagas
	
	Date inicioDoEvento
	Date fimDoEvento
	Date fimDasInscricoes
	
	String pais
	String estado
	String cidade
	String endereco 
	
	String telefonesContato
	String infoTransporte
	
	String informacoes
	
	static hasMany = [inscricoes:Inscricao]
	
    static constraints = {
		nome nullable:false, blank:false
		descricao nullable:false, blank:false
		valorInscricao nullable:false, blank:false
		vagas min:0
    }
}
