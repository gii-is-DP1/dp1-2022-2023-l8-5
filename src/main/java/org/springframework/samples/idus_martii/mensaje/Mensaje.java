package org.springframework.samples.idus_martii.mensaje;

import java.time.LocalTime;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.samples.idus_martii.jugador.Jugador;
import org.springframework.samples.idus_martii.model.BaseEntity;
import org.springframework.samples.idus_martii.partida.Partida;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity

public class Mensaje extends BaseEntity{
	
	@Column(name = "hora")
	@DateTimeFormat(pattern = "hh:mm")
	private LocalTime hora;
	
	@NotBlank
	@Column(name = "texto")
	private String texto;
	
	
	//TODO Bidireccionalidad con Jugador
	@ManyToOne(optional=false)
	@JoinColumn(name = "jugador_id")
	private Jugador jugador;

	@ManyToOne
	@JoinColumn(name = "partida_id")
	Partida partida;
}