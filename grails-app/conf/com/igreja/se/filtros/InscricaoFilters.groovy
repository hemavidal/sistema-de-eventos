package com.igreja.se.filtros

import com.igreja.se.Usuario

class InscricaoFilters {

    def filters = {
        acessoDeUsuarios(controller:'inscricao', action:'delete') {
            before = {
				Usuario usuario = session.usuario
				if (!'admin'.equals(usuario.tipo)) {
					redirect(controller:'evento', action:'index')
					return false
				}
            }
        }
    }
}
