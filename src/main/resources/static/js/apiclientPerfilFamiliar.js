/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var apiclientPerfilFamiliar = (function(){
    var equipoBackEnd = "http://54.186.163.136:8087";
    return{
        getSolicitudesPendientes(id,nombres,apellidos,documentoIdentidad,nombreUsuario,tipoDocumento,correo){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/familiares/relaciones/pacientes/pendientes",
                type: "POST",
                data: '{"id":'+id+' ,"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "documentoIdentidad":"'+documentoIdentidad+'","nombreUsuario":"'+nombreUsuario+'","password":"","tipoDocumento":"'+tipoDocumento+'","correo":"'+correo+'"}',
                contentType: "application/json",
                headers: {'Authorization':'Bearer '+sessionStorage.getItem("Token")}
            });
        },
        getSolicitudesAceptadas(id,nombres,apellidos,documentoIdentidad,nombreUsuario,tipoDocumento,correo){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/familiares/relaciones/pacientes/aceptadas",
                type: "POST",
                data: '{"id":'+id+' ,"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "documentoIdentidad":"'+documentoIdentidad+'","nombreUsuario":"'+nombreUsuario+'","password":"","tipoDocumento":"'+tipoDocumento+'","correo":"'+correo+'"}',
                contentType: "application/json"
            });
        },
        getBusquedaPacientes(dato){
            return $.get(equipoBackEnd+"/entremente/V1/pacientes/"+dato);  
        },
        aceptarSolicitud(id, idPaciente, idFamiliar){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/familiares/relaciones/pacientes",
                type: "PUT",
                data: '{"id":'+id+' ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":""}',
                contentType: "application/json"
            });
        },
        eliminarSolicitud(id, idPaciente, idFamiliar){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/familiares/relaciones/pacientes",
                type: "DELETE",
                data: '{"id":'+id+' ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":""}',
                contentType: "application/json"
            });
        },
        adicionarSolicitud(idPaciente, idFamiliar,relacion){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/familiares/relaciones/pacientes",
                type: "POST",
                data: '{"id":0 ,"idPaciente":'+idPaciente+',"idFamiliar":'+idFamiliar+', "estado":"","relacion":"'+relacion+'"}',
                contentType: "application/json"
            });
        },
        getTodosMensajes(idPaciente){
            return $.get(equipoBackEnd+"/entremente/V1/mensajes/otros/"+idPaciente);  
        },
        enviarMensaje(idPaciente, idFamiliar, fecha, mensaje, tipo, rol, puedeVerPac, nombreRemitente, checkBox){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/mensajes",
                type: "POST",
                data: '{"id":0 ,"idPaciente":"'+idPaciente+'","idFamiliar":"'+idFamiliar+'", "fecha":"'+fecha+'" ,"mensaje":"'+mensaje+'","tipo":"'+tipo+'","rol":"'+rol+'","puedeVerPac":"'+puedeVerPac+'","nombreRemitente":"'+nombreRemitente+'","checkBox":"'+checkBox+'"}',
                contentType: "application/json"
            });
        },
        getHistorialMedico(idPaciente){
            return $.get(equipoBackEnd+"/entremente/V1/historialMedico/"+idPaciente);  
        },
        modificarFamiliar(nombres,apellidos,id){
            return $.ajax({
                url: equipoBackEnd+"/entremente/V1/familiares",
                type: "PUT",
                data: '{"nombres":"'+nombres+'","apellidos":"'+apellidos+'", "id":'+id+'}',
                contentType: "application/json"
            });
        }
    };
    
}());


