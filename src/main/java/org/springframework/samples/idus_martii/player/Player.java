package org.springframework.samples.idus_martii.player;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.samples.idus_martii.faccion.Faccion;
import org.springframework.samples.idus_martii.mensaje.Mensaje;
import org.springframework.samples.idus_martii.model.BaseEntity;
import org.springframework.samples.idus_martii.statistics.Achievement;
import org.springframework.samples.idus_martii.turno.Turno;
import org.springframework.samples.idus_martii.user.User;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name ="players")
public class Player extends BaseEntity{
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user", referencedColumnName = "username")
	private User user;
	
	
	/*
	@ManyToMany
	@JoinColumn(name = "achievement", referencedColumnName = "achievement")
	Achievement achievement;*/
	
	/*
	@ManyToMany(mappedBy = "faccion")
	@JoinColumn(name = "faccion", referencedColumnName = "achievement")
	Faccion faccion;*/
	
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "turn_player", joinColumns = @JoinColumn(name="player_id"),
	inverseJoinColumns = @JoinColumn(name = "turno_id"))
	private Set<Turno> turno;
	
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "player")
	private Set<Mensaje> mensajes;
	
}
