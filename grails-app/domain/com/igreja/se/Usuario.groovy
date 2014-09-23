package com.igreja.se

class Usuario {
	
	String login
	String senha
	
	Pessoa pessoa
	
    static constraints = {
		login nullable:false, blank:false, email:true, unique:true
		senha nullable:false, blank:false
    }
}
