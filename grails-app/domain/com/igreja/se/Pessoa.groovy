package com.igreja.se

class Pessoa {

	String email
	String nome
	Integer idade
	String sexo
	
	String pais
	String estado
	String cidade
	
	
    static constraints = {
		nome nullable:false, blank:false
		idade nullable:false, blank:false
		sexo inList:['M', 'F'], nullable:false, blank:false
		email nullable:false, email: true, blank: false
		
    }
	
	@Override
	public String toString() {
		return "$nome";
	}
}
