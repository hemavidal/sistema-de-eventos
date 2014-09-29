package com.igreja.se

import com.igreja.se.filtros.LoginAccessFilters;

class InscricaoFilters {

	def dependsOn = [LoginAccessFilters]
	
    def filters = {
        inscricaoFeitaDepoisDoFimDasInscricoes(controller:'inscricao', action:'create|save') {
            before = {
				Evento evento
				if (!params.evento) {
					render "Acesso Negado" //TODO:Access denied page
					return false
				}
				
				evento = Evento.findById(params.evento)
				
				if (!evento) {
					render "Acesso Negado" //TODO:Access denied page
					return false
				}
				
				if (new Date() > evento.fimDasInscricoes) {
					flash.message = "Inscricao não efetuada devido ao termino das inscricoes(${evento.fimDasInscricoes})"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
            }
        }
    }
}
