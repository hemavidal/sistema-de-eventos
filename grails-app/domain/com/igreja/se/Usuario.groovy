package com.igreja.se

class Usuario {
	
	String login
	String senha
	
	String tipo
	
	Pessoa pessoa
	
    static constraints = {
		login nullable:false, blank:false, email:true, unique:true
		senha nullable:false, blank:false
		tipo nullable:false, blank:false, inList:['admin', 'acesso']
    }
	
	static beforeInsert = {
		senha = senha.encodeAsSHA()
	}
}
