package com.igreja.se

class Pessoa {

	String email
	String nome
	Date dataNascimento
	String sexo
	
	String pais
	String estado
	String cidade
	
	String sangue
	
    static constraints = {
		nome nullable:false, blank:false
		sexo inList:['Masculino', 'Feminino'], nullable:false, blank:false
		email nullable:false, email: true, blank: false
		sangue nullable:true, blank:true, inList:['A+','A-','B+','B-','AB+','AB-','O+','O-']
		
    }
	
	@Override
	public String toString() {
		return "$nome";
	}
}
