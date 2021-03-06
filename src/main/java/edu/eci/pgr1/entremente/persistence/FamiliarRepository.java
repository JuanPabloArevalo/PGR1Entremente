/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.eci.pgr1.entremente.persistence;

import edu.eci.pgr1.entremente.model.Familiar;
import edu.eci.pgr1.entremente.model.Relacion;
import java.util.Set;

/**
 *
 * @author Juan Pablo Arévalo
 */
public interface FamiliarRepository {
    /**
     * Metodo encargado de adicionar un nuevo familiar
     * @param familiar
     * @throws PersistenceNotFoundException 
     */
    public void adicionarFamiliar(Familiar familiar) throws PersistenceNotFoundException;
    
    /**
     * Metodo encargado de modificar un familiar
     * @param familiar
     * @throws PersistenceNotFoundException 
     */
    public void modificarFamiliar(Familiar familiar) throws PersistenceNotFoundException;
    
    /**
     * Metodo encargado de validar si existe un paciente
     * @param familiar
     * @return 
     * @throws PersistenceNotFoundException 
     * @throws edu.eci.pgr1.entremente.persistence.PersistenceException 
     */
    public boolean existeFamiliar(Familiar familiar) throws PersistenceNotFoundException, PersistenceException;
    
    /**
     * Metodo encargado de traer el paciente, dado el nombre de usuario  y la contraseña
     * @param nombreUsuarios
     * @param password
     * @return
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public Familiar traerFamiliar(String nombreUsuarios, String password) throws PersistenceNotFoundException, PersistenceException;
    
    
    /**
     * Metodo encargado de traer todas las relaciones pendientes de los pacientes
     * @param familiar
     * @param estado
     * @return 
     * @throws edu.eci.pgr1.entremente.persistence.PersistenceNotFoundException 
     */
    public Set<Relacion> traerRelacionesPacientesDesdeFamiliar(Familiar familiar, String estado) throws PersistenceNotFoundException;

    /**
     * Metodo encargado de aceptar la solicitud de la realcion paciente-familiar
     * @param relacion
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public void aceptarSolicitudPaciente(Relacion relacion) throws PersistenceNotFoundException, PersistenceException;

    /**
     * Metodo encargado de eliminar la solicitud de la realcion paciente-familiar
     * @param relacion
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public void eliminarSolicitudPaciente(Relacion relacion) throws PersistenceNotFoundException, PersistenceException;

    /**
     * Metodo encargado de adicionar la solicitud de la realcion paciente-familiar
     * @param relacion
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public void adicionarSolicitudPacienteDesdeFamiliar(Relacion relacion) throws PersistenceNotFoundException, PersistenceException;
    
    /**
     * Metodo encargado de validar si existe la solicitud de la realcion paciente-familiar
     * @param relacion
     * @return 
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public boolean existeRelacionPacienteFamiliar(Relacion relacion) throws PersistenceNotFoundException, PersistenceException;
    
    /**
     * Metodo encargado de buscar los familiares que contengan por el valor pasado
     * @param valor
     * @return
     * @throws PersistenceNotFoundException
     * @throws PersistenceException 
     */
    public Set<Familiar> busquedaFamiliares(String valor) throws PersistenceNotFoundException, PersistenceException;
}
