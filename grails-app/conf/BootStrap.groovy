import com.igreja.se.Evento
import com.igreja.se.Pessoa
import com.igreja.se.Usuario

class BootStrap {

    def init = { servletContext ->
		Pessoa pessoa = new Pessoa(email:"se@sofiteng.com.br", nome: "Administrador", cidade: "Campina Grande", estado: "Paraiba", idade: "24", pais: "Brasil", sexo: "M").save(flush:true)
		new Usuario(login:"se@sofiteng.com.br", senha:"seA2014", pessoa:pessoa, tipo:'admin').save(flush:true)
		
    }
    def destroy = {
    }
}
