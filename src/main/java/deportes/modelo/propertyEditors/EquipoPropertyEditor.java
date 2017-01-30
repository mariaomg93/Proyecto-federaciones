package deportes.modelo.propertyEditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.repositorios.RepositorioEquipo;

@Component
public class EquipoPropertyEditor extends PropertyEditorSupport{
	
	@Autowired
	private RepositorioEquipo repoeq;
	
	@Override
	public void setAsText(String text){
		
		long idEquipo= Long.parseLong(text);
		Equipo equip = repoeq.findOne(idEquipo);
		setValue(equip);
		
		
	}

}
