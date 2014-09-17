package com.igreja.se

class Inscricao {

	String nome
	int idade
	String sexo
	
	String pais
	String estado
	String cidade
	
	String pastorResponsavel

	boolean isConfirmada
	
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
