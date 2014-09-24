package com.igreja.se.filtros

class LoginAccessFilters {

	def filters = {
		restrictAccessOnlyWithLogin(controller:'assets', invert:true) {
			before = {
				
				if(!controllerName || controllerName.equals("")) {
					return true
				}
				
				if (!session.usuario && !(actionName in ["login", "logout", "authenticate"])) {
					redirect(controller:"usuario", action:"login")
					return false
				}
			}
		}
	}
}
