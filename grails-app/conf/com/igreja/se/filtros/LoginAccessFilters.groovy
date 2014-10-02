package com.igreja.se.filtros

import com.igreja.se.Usuario

class LoginAccessFilters {

	def filters = {
		loginFilters(controller:'usuario', action:'login') {
			before = {
				if (!session.usuario) {
					return true
				} else {
					return false
				}
			}
		}
		
		restrictAccessOnlyWithAdminUser(controller:'usuario|pessoa', action:'*') {
			before = {
				if (actionName in ['login', 'logout','authenticate', 'displayGraph']) {
					return true
				}
				
				Usuario usuario = session?.usuario
				if (!usuario) {
					redirect(controller:"evento", action:"index")
					return false
				} else {
					if (!usuario.tipo.equals('admin')) {
						flash.message = "Usuário sem permissão."
						flash.type = "alert-warning"
						redirect(controller:"evento", action:"index")
						return false
					}
				}
				
			}
		}
		
		
	}
}
