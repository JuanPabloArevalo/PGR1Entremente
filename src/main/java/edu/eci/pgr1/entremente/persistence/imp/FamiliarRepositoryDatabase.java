/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.eci.pgr1.entremente.persistence.imp;

import edu.eci.pgr1.entremente.model.Familiar;
import edu.eci.pgr1.entremente.model.Paciente;
import edu.eci.pgr1.entremente.model.Relacion;
import edu.eci.pgr1.entremente.persistence.FamiliarRepository;
import edu.eci.pgr1.entremente.persistence.PersistenceException;
import edu.eci.pgr1.entremente.persistence.PersistenceNotFoundException;
import edu.eci.pgr1.entremente.security.AES;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Service;

/**
 *
 * @author Juan Pablo Arévalo
 */
@Service
public class FamiliarRepositoryDatabase implements FamiliarRepository{
    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String NOMBRETABLA = "FAMILIAR";

       
    /**
     * Metodo encargado de cerrar la conexión
     */
    private void close() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connect != null) {
                connect.close();
            }
        } catch (SQLException e) {

        }
    }

    @Override
    public boolean existeFamiliar(Familiar familiar) throws PersistenceNotFoundException, PersistenceException {
        boolean existeFamiliar = false;
        String nombreUsuario = "";
        String correo = "";
        if(!familiar.getCorreo().isEmpty()){
            familiar.setCorreo(AES.encrypt(familiar.getCorreo()));
        }
        if(!familiar.getDocumentoIdentidad().isEmpty()){
            familiar.setDocumentoIdentidad(AES.encrypt(familiar.getDocumentoIdentidad()));
        }
        
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            
            preparedStatement = connect.prepareStatement("SELECT documentoIdentidad, tipoDocumento, nombreUsuario, correo FROM "+NOMBRETABLA +" WHERE (documentoIdentidad='"+familiar.getDocumentoIdentidad()+"' AND tipoDocumento = '"+familiar.getTipoDocumento()+"') OR nombreUsuario = '"+familiar.getNombreUsuario()+"' OR correo = '"+familiar.getCorreo()+"'");
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()){
                nombreUsuario = resultSet.getString(3);
                correo = resultSet.getString(4);
                if(!correo.isEmpty()){
                   correo = AES.decrypt(correo);
                }
                existeFamiliar = true;
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
    
        if(existeFamiliar){
            if(nombreUsuario.trim().equalsIgnoreCase(familiar.getNombreUsuario())){
                throw new PersistenceException("El nombre de usuario ya existe!");
            }
            else if(correo.trim().equalsIgnoreCase(familiar.getCorreo())){
                throw new PersistenceException("El correo ya esta registrado!");
            }
            else{
                throw new PersistenceException("El documento ya esta registrado");
            }
        }
        else{
            return false;
        }
    }

    @Override
    public Familiar traerFamiliar(String nombreUsuarios, String password) throws PersistenceNotFoundException, PersistenceException {
        Familiar familiar = null;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            
            preparedStatement = connect.prepareStatement("SELECT * FROM "+NOMBRETABLA +" WHERE nombreUsuario = '"+nombreUsuarios+"' AND password = '"+password+"'");
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()){
               familiar = new Familiar();
               familiar.setApellidos(resultSet.getString("apellidos"));
               familiar.setCorreo(resultSet.getString("correo"));
               if(!familiar.getCorreo().isEmpty()){
                   familiar.setCorreo(AES.decrypt(familiar.getCorreo()));
               }
               familiar.setDocumentoIdentidad(resultSet.getString("documentoIdentidad"));
               if(!familiar.getDocumentoIdentidad().isEmpty()){
                   familiar.setDocumentoIdentidad(AES.decrypt(familiar.getDocumentoIdentidad()));
               }
               familiar.setId(resultSet.getInt("id"));
               familiar.setNombreUsuario(nombreUsuarios);
               familiar.setNombres(resultSet.getString("nombres"));
               familiar.setTipoDocumento(resultSet.getString("tipoDocumento"));
               familiar.setPassword(resultSet.getString("password"));
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
    
        if(familiar==null){
            throw new PersistenceException("Usuario/Contraseña inválidos");
        }
        else{
            return familiar;
        }
    }

    @Override
    public void adicionarFamiliar(Familiar familiar) throws PersistenceNotFoundException {
        if(!familiar.getCorreo().isEmpty()){
            familiar.setCorreo(familiar.getCorreo());
        }
        if(!familiar.getDocumentoIdentidad().isEmpty()){
            familiar.setDocumentoIdentidad(familiar.getDocumentoIdentidad());
        }
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("insert into  "+NOMBRETABLA+" (nombres, apellidos, documentoIdentidad, nombreUsuario, password, tipoDocumento, correo) values (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, familiar.getNombres());
            preparedStatement.setString(2, familiar.getApellidos());
            preparedStatement.setString(3, familiar.getDocumentoIdentidad());
            preparedStatement.setString(4, familiar.getNombreUsuario());
            preparedStatement.setString(5, familiar.getPassword());
            preparedStatement.setString(6, familiar.getTipoDocumento());
            preparedStatement.setString(7, familiar.getCorreo());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }          
    }

    @Override
    public Set<Relacion> traerRelacionesPacientesDesdeFamiliar(Familiar familiar, String estado) throws PersistenceNotFoundException {
        Set<Relacion> relaciones = new HashSet<>();
        Relacion rel = null;
        String complemento = "";
        if(Relacion.ESTADOPENDIENTE.equalsIgnoreCase(estado)){
            complemento = " AND ENVIADO = '"+Relacion.ENVIADOPACIENTE+"' ";
        }
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            preparedStatement = connect.prepareStatement("SELECT * FROM PACIENTEFAMILIAR PF LEFT JOIN PACIENTE P ON (PF.idPaciente=P.ID) WHERE idFamiliar = '"+familiar.getId()+"' AND ESTADO = '"+estado+"' "+complemento+" ORDER BY PF.ID");
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
               rel = new Relacion();
               rel.setApellidosFamiliar(familiar.getApellidos());
               rel.setIdFamiliar(familiar.getId());
               rel.setNombresFamiliar(familiar.getNombres());
               rel.setId(resultSet.getInt("PF.ID"));
               rel.setIdPaciente(resultSet.getInt("P.ID"));
               rel.setApellidosPaciente(resultSet.getString("P.APELLIDOS"));
               rel.setNombresPaciente(resultSet.getString("P.NOMBRES"));
               rel.setEstado(estado);
               rel.setRelacion(resultSet.getString("PF.relacion"));
               relaciones.add(rel);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
        return relaciones;
   }

    @Override
    public void aceptarSolicitudPaciente(Relacion relacion) throws PersistenceNotFoundException, PersistenceException {
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("UPDATE PACIENTEFAMILIAR SET ESTADO = '"+Relacion.ESTADOACEPTADO+"' WHERE ID = ?");
            preparedStatement.setInt(1, relacion.getId());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }  
    }

    @Override
    public void eliminarSolicitudPaciente(Relacion relacion) throws PersistenceNotFoundException, PersistenceException {
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("DELETE FROM PACIENTEFAMILIAR WHERE ID = ?");
            preparedStatement.setInt(1, relacion.getId());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }  
    }

    @Override
    public void adicionarSolicitudPacienteDesdeFamiliar(Relacion relacion) throws PersistenceNotFoundException, PersistenceException {
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("INSERT INTO PACIENTEFAMILIAR (Id, IdPaciente, idFamiliar, estado, relacion, enviado) VALUES (?,?,?,?,?,?) ");
            preparedStatement.setInt(1, relacion.getId());
            preparedStatement.setInt(2, relacion.getIdPaciente());
            preparedStatement.setInt(3, relacion.getIdFamiliar());
            preparedStatement.setString(4, "P");
            preparedStatement.setString(5, relacion.getRelacion());
            preparedStatement.setString(6, Relacion.ENVIADOOTRO);
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        } 
    }

    @Override
    public boolean existeRelacionPacienteFamiliar(Relacion relacion) throws PersistenceNotFoundException, PersistenceException {
        boolean existeRelacion = false;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            
            preparedStatement = connect.prepareStatement("SELECT id FROM PACIENTEFAMILIAR WHERE idPaciente = ? AND idFamiliar = ?");
            preparedStatement.setInt(1, relacion.getIdPaciente());
            preparedStatement.setInt(2, relacion.getIdFamiliar());
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()){
                relacion.setId(resultSet.getInt(1));
                existeRelacion = true;
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
    
        if(existeRelacion){
            throw new PersistenceException("Ya existe la relación paciente-familiar");
        }
        else{
            return false;
        }
    }

    @Override
    public Set<Familiar> busquedaFamiliares(String valor) throws PersistenceNotFoundException, PersistenceException {
        Set<Familiar> familiares = new HashSet<>();
        Familiar familiar = null;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            preparedStatement = connect.prepareStatement("SELECT * FROM "+NOMBRETABLA +" WHERE nombreUsuario LIKE '%"+valor+"%' OR nombres LIKE '%"+valor+"%' OR apellidos LIKE '%"+valor+"%' OR documentoIdentidad LIKE '%"+AES.encrypt(valor)+"%' or correo LIKE '%"+AES.encrypt(valor)+"%' ORDER BY Apellidos, Nombres");
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                familiar = new Familiar();
                familiar.setApellidos(resultSet.getString("apellidos"));
                familiar.setCorreo(resultSet.getString("correo"));
                if(!familiar.getCorreo().isEmpty()){
                   familiar.setCorreo(AES.decrypt(familiar.getCorreo()));
                }
                familiar.setDocumentoIdentidad(resultSet.getString("documentoIdentidad"));
                if(!familiar.getDocumentoIdentidad().isEmpty()){
                   familiar.setDocumentoIdentidad(AES.decrypt(familiar.getDocumentoIdentidad()));
                }
                familiar.setId(resultSet.getInt("id"));
                familiar.setNombreUsuario(resultSet.getString("nombreUsuario"));
                familiar.setNombres(resultSet.getString("nombres"));
                familiar.setTipoDocumento(resultSet.getString("tipoDocumento"));
                familiar.setPassword("");
                familiares.add(familiar);
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
    
        if(familiares.isEmpty()){
            throw new PersistenceException("No existen familiares con ese dato!");
        }
        else{
            return familiares;
        }
    }

    @Override
    public void modificarFamiliar(Familiar familiar) throws PersistenceNotFoundException {
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("update  "+NOMBRETABLA+" SET nombres = ?, apellidos = ? WHERE id = ?");
            preparedStatement.setString(1, familiar.getNombres());
            preparedStatement.setString(2, familiar.getApellidos());
            preparedStatement.setInt(3, familiar.getId());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        } 
    }

}
