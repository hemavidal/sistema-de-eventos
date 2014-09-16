package com.igreja.se

class Inscricao {

	boolean isConfirmada
	String pastorResponsavel
	
	static hasOne = [pessoa:Pessoa]
	
    static constraints = {
    }
	
	@Override
	public String toString() {
		return "$pessoa.nome";
	}
}
