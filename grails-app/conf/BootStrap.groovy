import com.igreja.se.Evento
import com.igreja.se.Pessoa
import com.igreja.se.Usuario

class BootStrap {

    def init = { servletContext ->
		Pessoa pessoa = new Pessoa(nome: "Administrador", cidade: "Campina Grande", estado: "Paraiba", idade: "24", pais: "Brasil", sexo: "M").save(flush:true)
		new Usuario(login:"hemavidal@gmail.com", senha:"seA2014", pessoa:pessoa).save(flush:true)
		
    }
    def destroy = {
    }
}
