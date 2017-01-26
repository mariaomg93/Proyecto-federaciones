package deportes.modelo.entidades;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Federacion {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@NotEmpty
	private String nombre;

	@NotNull
	private String Pais;

	@OneToMany(fetch=FetchType.EAGER)
	private Set<Equipo> equipos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPais() {
		return Pais;
	}

	public void setPais(String pais) {
		Pais = pais;
	}

	public Set<Equipo> getEquipos() {
		return equipos;
	}

	public void setEquipos(Set<Equipo> equipos) {
		this.equipos = equipos;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Pais == null) ? 0 : Pais.hashCode());
		result = prime * result + ((equipos == null) ? 0 : equipos.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Federacion other = (Federacion) obj;
		if (Pais == null) {
			if (other.Pais != null)
				return false;
		} else if (!Pais.equals(other.Pais))
			return false;
		if (equipos == null) {
			if (other.equipos != null)
				return false;
		} else if (!equipos.equals(other.equipos))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}

	
}
