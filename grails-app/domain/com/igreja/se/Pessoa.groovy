package com.igreja.se

class Pessoa {

	static hasOne = [foto:Imagem]
	
	String email
	String nome
	Integer idade
	String sexo
	
	String pais
	String estado
	String cidade
	
	String sangue
	
    static constraints = {
		foto nullable:true, blank:true
		nome nullable:false, blank:false
		idade nullable:false, blank:false
		sexo inList:['M', 'F'], nullable:false, blank:false
		email nullable:false, email: true, blank: false
		sangue nullable:true, blank:true, inList:['A+','A-','B+','B-','AB+','AB-','O+','O-']
		
    }
	
	@Override
	public String toString() {
		return "$nome";
	}
}
