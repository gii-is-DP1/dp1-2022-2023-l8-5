package org.springframework.samples.idus_martii.jugador;


import java.util.Set;


import javax.persistence.CascadeType;
import javax.persistence.Entity;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


import org.springframework.samples.idus_martii.faccion.Faccion;
import org.springframework.samples.idus_martii.mensaje.Mensaje;
import org.springframework.samples.idus_martii.model.BaseEntity;
import org.springframework.samples.idus_martii.partida.Lobby;
import org.springframework.samples.idus_martii.statistics.Achievement;
import org.springframework.samples.idus_martii.user.User;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name ="jugadores")
public class Jugador extends BaseEntity{
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user", referencedColumnName = "username")
	private User user;
	
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "jugador")
	private Set<Faccion> faccion;

	public String getUsername() {
		return this.getUser().getUsername();
	}
	public void setUsername(String username) {
		 this.user.setUsername(username) ;
	}
	
	@ManyToMany(cascade= CascadeType.PERSIST)
	@JoinTable(name = "jugador_achievement", joinColumns = @JoinColumn(name="jugador_id"),
	inverseJoinColumns = @JoinColumn(name = "achievement_id"))
	private Set<Achievement> achievement;
	
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "jugador")
	private Set<Mensaje> mensajes;

	@ManyToMany(cascade= CascadeType.REMOVE)
	@JoinTable(name = "amigos", joinColumns = @JoinColumn(name="jugador_id"),
	inverseJoinColumns = @JoinColumn(name = "jugador"))
	public Set<Jugador> setAmigos;
	
	@ManyToMany(mappedBy="jugadores",cascade= CascadeType.REMOVE)
	private Set<Lobby> lobbys;
}
