package deportes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import deportes.modelo.repositorios.RepositorioEquipo;
import deportes.modelo.repositorios.RepositorioFederacion;
import deportes.modelo.repositorios.RepositorioJugador;

@Controller
@RequestMapping("/jugadores")
public class ControllerJugadores {
	
	@Autowired
	private RepositorioJugador repuJug;
	
	@Autowired
	private RepositorioEquipo repuEqui;
	
	@Autowired
	private RepositorioFederacion repuFede;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listJugar ( Model model) {		
		return "pages/jugadores";
	}
}
