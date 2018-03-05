/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var apiclientPerfilPersonalSalud = (function(){
    var equipoBackEnd = "http://54.186.163.136:8087";
    return{
        getSolicitudesPendientes(id,nombres,apellidos,documentoIdentidad,nombreUsuario,tipoDocumento,correo,rol){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/personalSalud/relaciones/pacientes/pendientes",
                type: "POST",
                data: '{"id":'+id+' ,"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "documentoIdentidad":"'+documentoIdentidad+'","nombreUsuario":"'+nombreUsuario+'","password":"","tipoDocumento":"'+tipoDocumento+'","correo":"'+correo+'","rol":"'+rol+'" }',
                contentType: "application/json"
            });
        },
        getSolicitudesAceptadas(id,nombres,apellidos,documentoIdentidad,nombreUsuario,tipoDocumento,correo,rol){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/personalSalud/relaciones/pacientes/aceptadas",
                type: "POST",
                data: '{"id":'+id+' ,"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "documentoIdentidad":"'+documentoIdentidad+'","nombreUsuario":"'+nombreUsuario+'","password":"","tipoDocumento":"'+tipoDocumento+'","correo":"'+correo+'","rol":"'+rol+'"}',
                contentType: "application/json"
            });
        },
        getBusquedaPacientes(dato){
            return $.get(equipoBackEnd+"/entremente/V1/pacientes/"+dato);  
        },
        aceptarSolicitud(id, idPaciente, idFamiliar){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/personalSalud/relaciones/pacientes",
                type: "PUT",
                data: '{"id":'+id+' ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":""}',
                contentType: "application/json"
            });
        },
        eliminarSolicitud(id, idPaciente, idFamiliar){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/personalSalud/relaciones/pacientes",
                type: "DELETE",
                data: '{"id":'+id+' ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":""}',
                contentType: "application/json"
            });
        },
        adicionarSolicitud(idPaciente, idFamiliar,relacion){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/personalSalud/relaciones/pacientes",
                type: "POST",
                data: '{"id":0 ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":"'+relacion+'"}',
                contentType: "application/json"
            });
        },
        getTodosMensajes(idPaciente){
            return $.get(equipoBackEnd+"/entremente/V1/mensajes/otros/"+idPaciente);  
        },
        enviarMensaje(idPaciente, idPersonalSalud, fecha, mensaje, tipo, rol, puedeVerPac, nombreRemitente, checkBox){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/mensajes",
                type: "POST",
                data: '{"id":0 ,"idPaciente":"'+idPaciente+'","idPersonalSalud":"'+idPersonalSalud+'", "fecha":"'+fecha+'" ,"mensaje":"'+mensaje+'","tipo":"'+tipo+'","rol":"'+rol+'","puedeVerPac":"'+puedeVerPac+'","nombreRemitente":"'+nombreRemitente+'","checkBox":"'+checkBox+'"}',
                contentType: "application/json"
            });
        },
        getEnfermedades(){
            return $.get(equipoBackEnd+"/entremente/V1/enfermedades");  
        },
        guardarHistorialMedico(idPaciente, idEnfermedad, idPersonalSalud, fecha, rol){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/historialMedico",
                type: "POST",
                data: '{"id":0 ,"idPaciente":"'+idPaciente+'","idPersonalSalud":"'+idPersonalSalud+'", "fecha":"'+fecha+'" , "rol":"'+rol+'", "enfermedad" : {"id":'+idEnfermedad+'}}',
                contentType: "application/json"
            });
        },
        getHistorialMedico(idPaciente){
            return $.get(equipoBackEnd+"/entremente/V1/historialMedico/"+idPaciente);  
        },
        eliminarHistorialMedico(id){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/historialMedico",
                type: "DELETE",
                data: '{"id":'+id+',"idPaciente":"0"}',
                contentType: "application/json"
            });
        },
        modificar(nombres,apellidos,rol,id){
            return $.ajax({
                url: equipoBackEnd+"/entremente/V1/personalSalud",
                type: "PUT",
                data: '{"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "rol":"'+rol+'","id":'+id+'}',
                contentType: "application/json"
            });
        }
    };
    
}());


