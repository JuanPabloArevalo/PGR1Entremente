/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.eci.pgr1.entremente.persistence.juegos;

import edu.eci.pgr1.entremente.model.Paciente;
import edu.eci.pgr1.entremente.model.juegos.PreguntaFormas;
import edu.eci.pgr1.entremente.persistence.PersistenceException;
import edu.eci.pgr1.entremente.persistence.PersistenceNotFoundException;
import java.util.Set;

/**
 *
 * @author JuanArevaloMerchan
 */
public interface JuegoFormasRepository {
    /**
     * Metodo encargado de traer las preguntas de la galeria, pasandole el nivel por parametro del paciente pasado
     * @param nivel
     * @param paciente
     * @return 
     * @throws edu.eci.pgr1.entremente.persistence.PersistenceNotFoundException 
     * @throws edu.eci.pgr1.entremente.persistence.PersistenceException 
     */
    public Set<PreguntaFormas> traerPreguntas(int nivel, Paciente paciente) throws PersistenceNotFoundException, PersistenceException;
        
}