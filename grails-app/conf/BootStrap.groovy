import com.igreja.se.Evento
import com.igreja.se.Usuario

class BootStrap {

    def init = { servletContext ->
		Usuario admin = new Usuario(login:"admin", senha:"seA2014").save(flush:true)
		
		Evento evento1 = new Evento(nome: "Evento 1", descricao:"Descri��o do Evento1", valorInscricao:120.0, pais:"Brasil", cidade:"Campina Grande", estado:"Paraiba-PB", endereco:"Rua Exemplo, N-14, Bairro 1", informacoes:"Informa��es do Evento").save(flush:true)
		
    }
    def destroy = {
    }
}
