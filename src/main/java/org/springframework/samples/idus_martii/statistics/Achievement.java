package org.springframework.samples.idus_martii.statistics;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.persistence.Table;

import org.springframework.samples.idus_martii.jugador.Jugador;
import org.springframework.samples.idus_martii.model.NamedEntity;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "achievement")
public class Achievement extends NamedEntity{
	
	@NotBlank
	@Column(name = "description")
	private String description;
	@Column(name = "badgeImage")
	private String badgeImage;
	@Min(0)
	private double threshold;
	
	public String getActualDescription(){
        return description.replace("<THRESHOLD>",String.valueOf(threshold));
    }
	
	@ManyToMany(mappedBy="achievement",cascade= CascadeType.REMOVE)
	private Set<Jugador> jugador;
}
