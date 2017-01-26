package deportes.modelo.entidades;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.ManyToAny;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Equipo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@NotEmpty
	private String nombre;

	@NotNull
	private String estadio;
	
	@NotNull
	private Integer presupuesto;

	@ManyToOne (fetch = FetchType.EAGER)
	@JoinColumn(name = "fede", nullable = false)
	private Federacion fede;
	
	@OneToMany(fetch = FetchType.EAGER)
	private Set<Jugador> jugadores;

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

	public String getEstadio() {
		return estadio;
	}

	public void setEstadio(String estadio) {
		this.estadio = estadio;
	}

	public Integer getPresupuesto() {
		return presupuesto;
	}

	public void setPresupuesto(Integer presupuesto) {
		this.presupuesto = presupuesto;
	}

	public Federacion getFede() {
		return fede;
	}

	public void setFede(Federacion fede) {
		this.fede = fede;
	}

	public Set<Jugador> getJugadores() {
		return jugadores;
	}

	public void setJugadores(Set<Jugador> jugadores) {
		this.jugadores = jugadores;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((estadio == null) ? 0 : estadio.hashCode());
		result = prime * result + ((fede == null) ? 0 : fede.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((jugadores == null) ? 0 : jugadores.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result + ((presupuesto == null) ? 0 : presupuesto.hashCode());
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
		Equipo other = (Equipo) obj;
		if (estadio == null) {
			if (other.estadio != null)
				return false;
		} else if (!estadio.equals(other.estadio))
			return false;
		if (fede == null) {
			if (other.fede != null)
				return false;
		} else if (!fede.equals(other.fede))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (jugadores == null) {
			if (other.jugadores != null)
				return false;
		} else if (!jugadores.equals(other.jugadores))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (presupuesto == null) {
			if (other.presupuesto != null)
				return false;
		} else if (!presupuesto.equals(other.presupuesto))
			return false;
		return true;
	}

	

}
