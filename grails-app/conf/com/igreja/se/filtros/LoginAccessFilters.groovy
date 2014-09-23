package com.igreja.se.filtros

class LoginAccessFilters {

	def filters = {
		restrictAccessOnlyWithLogin(controller:'*', action:'*') {
			before = {
				if (!session.usuario && !(actionName in ["login", "logout", "authenticate"])) {
					redirect(controller:"usuario", action:"login")
					return false
				}
			}
		}
	}
}
