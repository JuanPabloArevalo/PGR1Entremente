/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.eci.pgr1.entremente.persistence.imp.juegos;

import edu.eci.pgr1.entremente.model.Paciente;
import edu.eci.pgr1.entremente.model.juegos.PreguntaGaleria;
import edu.eci.pgr1.entremente.model.juegos.PreguntaMusicoterapia;
import edu.eci.pgr1.entremente.model.juegos.RespuestaGaleria;
import edu.eci.pgr1.entremente.model.juegos.RespuestaMusicoterapia;
import edu.eci.pgr1.entremente.persistence.PersistenceException;
import edu.eci.pgr1.entremente.persistence.PersistenceNotFoundException;
import edu.eci.pgr1.entremente.persistence.imp.DatosBD;
import edu.eci.pgr1.entremente.persistence.juegos.JuegoMusicoterapiaRepository;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import org.springframework.stereotype.Service;

/**
 *
 * @author JuanArevaloMerchan
 */
@Service
public class JuegoMusicoterapiaRepositoryDatabase implements JuegoMusicoterapiaRepository{
    
    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String NOMBRETABLA = "JUEGOMUSICOTERAPIAPACIENTE";

    @Override
    public Set<PreguntaMusicoterapia> traerPreguntas(int nivel, Paciente paciente) throws PersistenceNotFoundException, PersistenceException {
        Set<PreguntaMusicoterapia> preguntas = new HashSet<>();
        ArrayList<RespuestaMusicoterapia> respuestas = null;
        PreguntaMusicoterapia pregunta = null;
        RespuestaMusicoterapia respuestaA = null;
        RespuestaMusicoterapia respuestaB = null;
        RespuestaMusicoterapia respuestaC = null;
        RespuestaMusicoterapia respuestaD = null;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            preparedStatement = connect.prepareStatement("SELECT * FROM "+NOMBRETABLA+" JGP LEFT JOIN PREGUNTAMUSICOTERAPIA PG ON (JGP.idPreguntaMusicoterapia=PG.ID) WHERE JGP.nivelPersonalizado = '"+nivel+"' AND JGP.idPaciente = '"+paciente.getId()+"' AND ESTADO = '"+PreguntaMusicoterapia.ESTADOACTIVO+"'");
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                pregunta = new PreguntaMusicoterapia();
                pregunta.setVideo(resultSet.getString("PG.Video"));
                pregunta.setNivel(nivel);
                pregunta.setPersonalizado("N");
                pregunta.setPregunta(resultSet.getString("PG.pregunta"));
                pregunta.setId(resultSet.getInt("JGP.id"));
                pregunta.setIdPregunta(resultSet.getInt("JGP.idPreguntaMusicoterapia"));
                pregunta.setEstado(PreguntaGaleria.ESTADOACTIVO);
                respuestas = new ArrayList<>();
                respuestaA = new RespuestaMusicoterapia();
                respuestaA.setOpcion(resultSet.getString("PG.opcionA"));
                respuestaA.setRespuestaCorrecta(resultSet.getString("PG.correctaA"));
                respuestas.add(respuestaA);

                respuestaB = new RespuestaMusicoterapia();
                respuestaB.setOpcion(resultSet.getString("PG.opcionB"));
                respuestaB.setRespuestaCorrecta(resultSet.getString("PG.correctaB"));
                respuestas.add(respuestaB);
                
                respuestaC = new RespuestaMusicoterapia();
                respuestaC.setOpcion(resultSet.getString("PG.opcionC"));
                respuestaC.setRespuestaCorrecta(resultSet.getString("PG.correctaC"));
                respuestas.add(respuestaC);
                
                respuestaD = new RespuestaMusicoterapia();
                respuestaD.setOpcion(resultSet.getString("PG.opcionD"));
                respuestaD.setRespuestaCorrecta(resultSet.getString("PG.correctaD"));
                respuestas.add(respuestaD);
                
                pregunta.setRespuestas(respuestas);
                preguntas.add(pregunta);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
        if(preguntas.isEmpty()){
            throw new PersistenceException("No hay preguntas para el nivel "+nivel);
        }
        
        return preguntas;
    }

    @Override
    public ArrayList<PreguntaMusicoterapia> traerTODASPreguntas(Paciente paciente) throws PersistenceNotFoundException, PersistenceException {
        ArrayList<PreguntaMusicoterapia> preguntas = new ArrayList<>();
        ArrayList<RespuestaMusicoterapia> respuestas = null;
        PreguntaMusicoterapia pregunta = null;
        RespuestaMusicoterapia respuestaA = null;
        RespuestaMusicoterapia respuestaB = null;
        RespuestaMusicoterapia respuestaC = null;
        RespuestaMusicoterapia respuestaD = null;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            preparedStatement = connect.prepareStatement("SELECT * FROM "+NOMBRETABLA+" JGP LEFT JOIN PREGUNTAMUSICOTERAPIA PG ON (JGP.idPreguntaMusicoterapia=PG.ID) WHERE JGP.idPaciente = '"+paciente.getId()+"' ORDER BY nivelPersonalizado");
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                pregunta = new PreguntaMusicoterapia();
                pregunta.setVideo(resultSet.getString("PG.Video"));
                pregunta.setNivel(resultSet.getInt("JGP.nivelPersonalizado"));
                pregunta.setPersonalizado("S");
                pregunta.setPregunta(resultSet.getString("PG.pregunta"));
                pregunta.setId(resultSet.getInt("JGP.id"));
                pregunta.setIdPregunta(resultSet.getInt("JGP.idPreguntaMusicoterapia"));
                pregunta.setEstado(resultSet.getString("JGP.estado"));
                
                respuestas = new ArrayList<>();
                respuestaA = new RespuestaMusicoterapia();
                respuestaA.setOpcion(resultSet.getString("PG.opcionA"));
                respuestaA.setRespuestaCorrecta(resultSet.getString("PG.correctaA"));
                respuestas.add(respuestaA);

                respuestaB = new RespuestaMusicoterapia();
                respuestaB.setOpcion(resultSet.getString("PG.opcionB"));
                respuestaB.setRespuestaCorrecta(resultSet.getString("PG.correctaB"));
                respuestas.add(respuestaB);
                
                respuestaC = new RespuestaMusicoterapia();
                respuestaC.setOpcion(resultSet.getString("PG.opcionC"));
                respuestaC.setRespuestaCorrecta(resultSet.getString("PG.correctaC"));
                respuestas.add(respuestaC);
                
                respuestaD = new RespuestaMusicoterapia();
                respuestaD.setOpcion(resultSet.getString("PG.opcionD"));
                respuestaD.setRespuestaCorrecta(resultSet.getString("PG.correctaD"));
                respuestas.add(respuestaD);
                
                pregunta.setRespuestas(respuestas);
                preguntas.add(pregunta);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }        
        return preguntas;
    }

    @Override
    public void modificarPregunta(PreguntaMusicoterapia pregunta) throws PersistenceNotFoundException, PersistenceException {
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("UPDATE "+NOMBRETABLA+" SET nivelPersonalizado = ?, estado = ? WHERE id = ?");
            preparedStatement.setInt(1, pregunta.getNivel());
            preparedStatement.setString(2, pregunta.getEstado());
            preparedStatement.setInt(3, pregunta.getId());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        } 
    }

    @Override
    public void adicionarPregunta(PreguntaMusicoterapia pregunta, Paciente paciente) throws PersistenceNotFoundException, PersistenceException {
        long idInsertado = 0;
        try {
            Class.forName(DatosBD.DRIVER);
            connect = DriverManager.getConnection(DatosBD.CONECTOR);
            connect.setAutoCommit(false);
            statement = connect.createStatement();
            preparedStatement = connect.prepareStatement("insert into  PREGUNTAMUSICOTERAPIA (video, pregunta, opcionA, opcionB, opcionC, opcionD, nivelPredeterminado, personalizado, correctaA, correctaB, correctaC, correctaD) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, pregunta.getVideo());
            preparedStatement.setString(2, pregunta.getPregunta());
            preparedStatement.setString(3, pregunta.getRespuestas().get(0).getOpcion());
            preparedStatement.setString(4, pregunta.getRespuestas().get(1).getOpcion());
            preparedStatement.setString(5, pregunta.getRespuestas().get(2).getOpcion());
            preparedStatement.setString(6, pregunta.getRespuestas().get(3).getOpcion());
            preparedStatement.setInt(7, pregunta.getNivel());
            preparedStatement.setString(8, "S");
            preparedStatement.setString(9, pregunta.getRespuestas().get(0).getRespuestaCorrecta());
            preparedStatement.setString(10, pregunta.getRespuestas().get(1).getRespuestaCorrecta());
            preparedStatement.setString(11, pregunta.getRespuestas().get(2).getRespuestaCorrecta());
            preparedStatement.setString(12, pregunta.getRespuestas().get(3).getRespuestaCorrecta());
            preparedStatement.executeUpdate();
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                idInsertado = rs.getLong(1);
            }
            preparedStatement = connect.prepareStatement("INSERT INTO  "+NOMBRETABLA+" (IdPaciente, idPreguntaMusicoterapia, nivelPersonalizado, estado) values (?, ?, ?, ?)");
            preparedStatement.setLong(1, paciente.getId());
            preparedStatement.setLong(2, idInsertado);
            preparedStatement.setInt(3, pregunta.getNivel());
            preparedStatement.setString(4, PreguntaMusicoterapia.ESTADOACTIVO);
            preparedStatement.executeUpdate();
            
            
            try {
                connect.commit();
            } catch (SQLException e) {
                connect.rollback();
                throw new PersistenceNotFoundException(e.getMessage());
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new PersistenceNotFoundException(e.getMessage());
        } finally {
            close();
        }
    }
    
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
    
}
