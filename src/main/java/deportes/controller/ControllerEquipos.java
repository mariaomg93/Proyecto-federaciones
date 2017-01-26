package deportes.controller;

import javax.validation.Valid;

import org.hibernate.loader.custom.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Federacion;
import deportes.modelo.propertyEditors.FederacionPropertyEditor;
import deportes.modelo.repositorios.RepositorioEquipo;
import deportes.modelo.repositorios.RepositorioFederacion;

@Controller
@RequestMapping("/equipos")

public class ControllerEquipos {

	@Autowired
	private RepositorioEquipo repoeq;
	
	@Autowired
	private RepositorioFederacion repofe;
	
	@Autowired
	private FederacionPropertyEditor fepro;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listJugar ( Model model) {	
		model.addAttribute("federac", repofe.findAll());
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/equipo";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String guardaequipo(Model model, @Valid @ModelAttribute Equipo equip, BindingResult bindingResult){
		repoeq.save(equip);
		model.addAttribute("federac", repofe.findAll());
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/equipo";
		
		
		
	}
	
	
	
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> borrar (@PathVariable Long id){
		try {
			repoeq.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception

			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
			
		
	}
	
	
	
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Federacion.class, fepro);
	}
	
}
