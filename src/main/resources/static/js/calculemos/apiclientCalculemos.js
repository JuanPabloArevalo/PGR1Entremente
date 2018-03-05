/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var arregloIndices= [];
var mockdata=[];
var arreglo;

var apiclientCalculemos = (function(){
    var equipoBackEnd = "http://54.186.163.136:8087";
    return{
        cargarPreguntas(idPaciente, nivel, callback){
            var promesa2 = $.get(equipoBackEnd+"/entremente/V1/juegos/calculo/"+idPaciente);
            promesa2.then(
                function () { 
                    mockdata[1] = promesa2.responseJSON[0];
                    mockdata[2] = promesa2.responseJSON[1];
                    mockdata[3] = promesa2.responseJSON[2];
                    mockdata[4] = promesa2.responseJSON[3];
                    apiclientCalculemos.getPreguntaAleatorea(nivel,callback);
                },
                function (dato) {
                    alert(dato.responseText);
                }
            );
        },
        getPreguntaAleatorea:function(nivel,callback){
            if(arregloIndices.length===0){
                apiclientCalculemos.llenarArreglo(nivel);
            }
            
            var numero = getRandomArbitrary(arregloIndices);
//            console.info(nivel);
//            console.info(numero);
//            console.info(mockdata[nivel]);
            callback(
                    mockdata[nivel][arregloIndices[numero]]
            );
            arregloIndices.splice(numero , 1);
        },
        llenarArreglo:function(nivel){
                for (i = 0; i < mockdata[nivel].length; i++) {
                        arregloIndices.push(i);
                }
        },
        cambiarNivel:function(nivel){
                arregloIndices= [];
                apiclientCalculemos.llenarArreglo(nivel);	
        },
        getArreglo:function(nivel){
                return arregloIndices;
        },
        enviarResultados(idPaciente, fecha, acertadas, erroneas, tiempo, nivelMaximo){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/juegos/resultados/calculo",
                type: "POST",
                data: '{"idPaciente":"'+idPaciente+'" ,"fecha":"'+fecha+'","acertadas":'+acertadas+', "erroneas":'+erroneas+',"tiempo":'+tiempo+',"nivelMaximo":'+nivelMaximo+'}',
                contentType: "application/json"
            });
        },
        getTodasPreguntas(idPaciente){
            return $.get(equipoBackEnd+"/entremente/V1/juegos/calculo/todas/"+idPaciente);;
        },
        modificarPregunta(id, nivelPersonalizado, estado){
            return $.ajax({
                url:  equipoBackEnd+"/entremente/V1/juegos/calculo",
                type: "POST",
                data: '{"id":'+id+' ,"nivel":'+nivelPersonalizado+',"estado":"'+estado+'"}',
                contentType: "application/json"
            });
        }
    };
    
}());

function getRandomArbitrary(arrgloIndices) {
  	return parseInt(Math.random() * (arrgloIndices.length));
}

