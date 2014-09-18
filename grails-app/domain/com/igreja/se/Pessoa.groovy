package com.igreja.se

class Pessoa {

	String nome
	int idade
	String sexo
	
	String pais
	String estado
	String cidade
	
    static constraints = {
		nome nullable:false, blank:false
		idade nullable:false, blank:false
		sexo inList:['M', 'F'], nullable:false, blank:false
    }
}
