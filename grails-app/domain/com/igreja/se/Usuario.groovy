package com.igreja.se

class Usuario {
	
	String login
	String senha
	
	Pessoa pessoa
	
    static constraints = {
		login nullable:false, blank:false
		senha nullable:false, blank:false
    }
}
