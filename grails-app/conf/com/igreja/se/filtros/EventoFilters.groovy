package com.igreja.se.filtros

import com.igreja.se.Usuario

class EventoFilters {

	def dependsOn = [LoginAccessFilters]
	
    def filters = {
        acessoDeUsuariosParaEvento(controller:'evento', action:'create|save|update|edit') {
            before = {
				Usuario usuario = session.usuario
				if (!'admin'.equals(usuario.tipo)) {
					redirect(action:"index")
					return false
				}
            }
        }
    }
}
