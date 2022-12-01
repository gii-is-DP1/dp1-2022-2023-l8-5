package org.springframework.samples.idus_martii.partida;

import java.time.Duration;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.samples.idus_martii.faccion.Faccion;
import org.springframework.samples.idus_martii.faccion.FaccionesEnumerado;
import org.springframework.samples.idus_martii.jugador.Jugador;
import org.springframework.samples.idus_martii.mensaje.Mensaje;
import org.springframework.samples.idus_martii.model.BaseEntity;
import org.springframework.samples.idus_martii.partida.Exceptions.DatesException;
import org.springframework.samples.idus_martii.ronda.Ronda;
import org.springframework.samples.idus_martii.turno.Turno;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "partida")
public class Partida extends BaseEntity {

	@NotNull
    @Min(5)
    @Max(8)
    private Integer numeroJugadores;

	@Enumerated(EnumType.STRING)
    FaccionesEnumerado faccionGanadora;

    private LocalDateTime fechaCreacion;

    private LocalDateTime fechaInicio;

    private LocalDateTime fechaFin;
        
    @OneToMany(cascade = CascadeType.PERSIST, mappedBy = "partida")
    Set<Faccion> faccionesJugadoras;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "partida")
    List<Ronda> rondas;
    
    @OneToMany(cascade = CascadeType.PERSIST, mappedBy = "partida")
    List<Mensaje> mensajes;

    @ManyToOne(cascade = CascadeType.PERSIST, optional = false)
    @JoinColumn(name = "jugador_id")
    Jugador jugador;
    
    @ManyToMany
    @JoinTable(
        name = "partida_jugador", 
        joinColumns = @JoinColumn(name = "partida_id"), 
        inverseJoinColumns = @JoinColumn(name = "jugador_id"))
    Set<Jugador> espectadores;
    
	public Duration getDuration() throws DatesException {
    	if (this.fechaFin == null)
    		throw new DatesException("Partida no terminada");
    	else
    		return Duration.between(fechaInicio, fechaFin);
    }
    
	public boolean iniciada() {
		return fechaInicio != null;
	}

    public Integer getVotosLeales() {
        Integer n = 0;
        for (Ronda r : getRondas()) {
            for (Turno t : r.getTurnos()) {
                n += t.getVotosLeales();
            }
        }
        return n;
    }

    public Integer getVotosTraidores() {
        Integer n = 0;
        for (Ronda r : getRondas()) {
            for (Turno t : r.getTurnos()) {
                n += t.getVotosTraidores();
            }
        }
        return n;
    }

    public Integer getLimite() {
    	return 2*getNumeroJugadores() + 3 + getNumeroJugadores()/8;
    }
}