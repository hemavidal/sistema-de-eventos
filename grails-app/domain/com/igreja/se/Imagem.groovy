package com.igreja.se

class Imagem {
	String nome
	
	byte[] file
	
	static constraints = {
		// Limit upload file size to 10MB
		file maxSize: 1024 * 1024 * 10
	}
}
