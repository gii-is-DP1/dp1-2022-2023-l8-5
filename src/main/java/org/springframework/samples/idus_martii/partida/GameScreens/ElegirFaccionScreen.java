package org.springframework.samples.idus_martii.partida.GameScreens;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.samples.idus_martii.jugador.Jugador;
import org.springframework.samples.idus_martii.partida.PartidaService;
import org.springframework.samples.idus_martii.ronda.Ronda;
import org.springframework.samples.idus_martii.turno.Turno;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ElegirFaccionScreen implements GameScreen {
	

    private PartidaService partidaService;

    @Autowired
    ElegirFaccionScreen(@Lazy PartidaService partidaService) {
        this.partidaService = partidaService;
    }

    @Override
    public String getAviso() {
        return "Elija facción";
    }

    @Override
    public ModelAndView getView(Integer partidaId, Jugador jugadorConectado) {
        Ronda ronda = partidaService.getRondaActual(partidaId);
        Turno turno = partidaService.getTurnoActual(partidaId);

        if ((ronda.getNumRonda() == 2 && turno.getNumTurno()==1 && jugadorConectado == turno.getConsul()) || (ronda.getNumRonda() == 1 && turno.getNumTurno()!=1)) {
            return new ModelAndView("/partidas/elegirFaccion");//TODO redirect JSP elegir faccion
        }

        return new ModelAndView("/partidas/tablero");
    }
}
