package com.igreja.se.filtros

class LoginAccessFilters {

    def filters = {
        restrictAccessOnlyWithLogin(controller:'*', action:'*') {
            before = {
//				if (!session.usuario && !"login".equals(actionName)) {
//					redirect(controller:"usuario", action:"login")
//					return false
//				}
            }
		}
    }
}
