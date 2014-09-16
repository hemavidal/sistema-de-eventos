package com.igreja.se

class Pessoa {

	String nome
	int idade
	String sexo
	
	String pais
	String estado
	String cidade
	 
	static belongsTo = [inscricao:Inscricao]
    static constraints = {
		nome nullable:false, blank:false
		idade nullable:false, blank:false
		sexo inList:['M', 'F'], nullable:false, blank:false
    }
	
	@Override
	public String toString() {
		return "$nome";
	}
}
