//var apimockCalculemos=(function(){
//	var arregloIndices= [];
//	var mockdata=[];
//        mockdata[1]=[
//            {"operacion":"2+1=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"S"},
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"4","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"1+1=","respuestas":[
//            	{"opcion":"0","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"S"},
//            	{"opcion":"7","respuestaCorrecta":"N"},
//            	{"opcion":"3","respuestaCorrecta":"N"}]
//            },
//	    {"operacion":"4+3=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"7","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"2+6=","respuestas":[
//            	{"opcion":"4","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"S"},
//            	{"opcion":"10","respuestaCorrecta":"N"},
//            	{"opcion":"7","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"9+0=","respuestas":[
//            	{"opcion":"7","respuestaCorrecta":"N"},
//            	{"opcion":"10","respuestaCorrecta":"N"},
//            	{"opcion":"9","respuestaCorrecta":"S"},
//            	{"opcion":"0","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"2+2=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"4","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"8-1=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"7","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"5+4=","respuestas":[
//            	{"opcion":"1","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"9","respuestaCorrecta":"S"},
//            	{"opcion":"7","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"3+3=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"4","respuestaCorrecta":"N"},
//            	{"opcion":"6","respuestaCorrecta":"S"},
//            	{"opcion":"9","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"5+3=","respuestas":[
//            	{"opcion":"7","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"S"},
//            	{"opcion":"3","respuestaCorrecta":"N"}]
//            }
//        ];
//
//	mockdata[2]=[
//            {"operacion":"12-1=","respuestas":[
//            	{"opcion":"13","respuestaCorrecta":"N"},
//            	{"opcion":"12","respuestaCorrecta":"N"},
//            	{"opcion":"11","respuestaCorrecta":"S"},
//            	{"opcion":"14","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"14+2=","respuestas":[
//            	{"opcion":"13","respuestaCorrecta":"N"},
//            	{"opcion":"12","respuestaCorrecta":"N"},
//            	{"opcion":"28","respuestaCorrecta":"N"},
//            	{"opcion":"16","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"2x1=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"7","respuestaCorrecta":"N"},
//            	{"opcion":"2","respuestaCorrecta":"S"},
//            	{"opcion":"1","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"11+12=","respuestas":[
//            	{"opcion":"23","respuestaCorrecta":"S"},
//            	{"opcion":"24","respuestaCorrecta":"N"},
//            	{"opcion":"1","respuestaCorrecta":"N"},
//            	{"opcion":"18","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"12-11=","respuestas":[
//            	{"opcion":"3","respuestaCorrecta":"N"},
//            	{"opcion":"23","respuestaCorrecta":"N"},
//            	{"opcion":"18","respuestaCorrecta":"N"},
//            	{"opcion":"1","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"3*3=","respuestas":[
//            	{"opcion":"6","respuestaCorrecta":"N"},
//            	{"opcion":"0","respuestaCorrecta":"N"},
//            	{"opcion":"9","respuestaCorrecta":"S"},
//            	{"opcion":"14","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"8/2=","respuestas":[
//            	{"opcion":"16","respuestaCorrecta":"N"},
//            	{"opcion":"4","respuestaCorrecta":"S"},
//            	{"opcion":"6","respuestaCorrecta":"N"},
//            	{"opcion":"10","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"14+8=","respuestas":[
//            	{"opcion":"22","respuestaCorrecta":"S"},
//            	{"opcion":"6","respuestaCorrecta":"N"},
//            	{"opcion":"28","respuestaCorrecta":"N"},
//            	{"opcion":"14","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"14+18=","respuestas":[
//            	{"opcion":"33","respuestaCorrecta":"N"},
//            	{"opcion":"35","respuestaCorrecta":"N"},
//            	{"opcion":"4","respuestaCorrecta":"N"},
//            	{"opcion":"32","respuestaCorrecta":"S"}]
//            },
//            {"operacion":"9+19=","respuestas":[
//            	{"opcion":"29","respuestaCorrecta":"N"},
//            	{"opcion":"28","respuestaCorrecta":"S"},
//            	{"opcion":"18","respuestaCorrecta":"N"},
//            	{"opcion":"27","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"41-21=","respuestas":[
//            	{"opcion":"29","respuestaCorrecta":"N"},
//            	{"opcion":"21","respuestaCorrecta":"N"},
//            	{"opcion":"20","respuestaCorrecta":"S"},
//            	{"opcion":"19","respuestaCorrecta":"N"}]
//            }
//        ];
//        mockdata[3]=[
//            {"operacion":"5x3=","respuestas":[
//            	{"opcion":"2","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"15","respuestaCorrecta":"S"},
//            	{"opcion":"17","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"6x4=","respuestas":[
//            	{"opcion":"30","respuestaCorrecta":"N"},
//            	{"opcion":"16","respuestaCorrecta":"N"},
//            	{"opcion":"24","respuestaCorrecta":"S"},
//            	{"opcion":"32","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"50/10=","respuestas":[
//            	{"opcion":"50","respuestaCorrecta":"N"},
//            	{"opcion":"10","respuestaCorrecta":"N"},
//            	{"opcion":"5","respuestaCorrecta":"S"},
//            	{"opcion":"11","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"121+4=","respuestas":[
//            	{"opcion":"121","respuestaCorrecta":"N"},
//            	{"opcion":"117","respuestaCorrecta":"N"},
//            	{"opcion":"125","respuestaCorrecta":"S"},
//            	{"opcion":"126","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"105-9=","respuestas":[
//            	{"opcion":"98","respuestaCorrecta":"N"},
//            	{"opcion":"114","respuestaCorrecta":"N"},
//            	{"opcion":"96","respuestaCorrecta":"S"},
//            	{"opcion":"95","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"35/5=","respuestas":[
//            	{"opcion":"35","respuestaCorrecta":"N"},
//            	{"opcion":"8","respuestaCorrecta":"N"},
//            	{"opcion":"7","respuestaCorrecta":"S"},
//            	{"opcion":"5","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"84/2=","respuestas":[
//            	{"opcion":"41","respuestaCorrecta":"N"},
//            	{"opcion":"86","respuestaCorrecta":"N"},
//            	{"opcion":"42","respuestaCorrecta":"S"},
//            	{"opcion":"36","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"10x10=","respuestas":[
//            	{"opcion":"110","respuestaCorrecta":"N"},
//            	{"opcion":"10","respuestaCorrecta":"N"},
//            	{"opcion":"100","respuestaCorrecta":"S"},
//            	{"opcion":"111","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"131+74=","respuestas":[
//            	{"opcion":"215","respuestaCorrecta":"N"},
//            	{"opcion":"105","respuestaCorrecta":"N"},
//            	{"opcion":"205","respuestaCorrecta":"S"},
//            	{"opcion":"206","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"11/11=","respuestas":[
//            	{"opcion":"0","respuestaCorrecta":"N"},
//            	{"opcion":"11","respuestaCorrecta":"N"},
//            	{"opcion":"1","respuestaCorrecta":"S"},
//            	{"opcion":"2","respuestaCorrecta":"N"}]
//            }
//        ];  
//        mockdata[4]=[
//            {"operacion":"15x15=","respuestas":[
//            	{"opcion":"30","respuestaCorrecta":"N"},
//            	{"opcion":"215","respuestaCorrecta":"N"},
//            	{"opcion":"225","respuestaCorrecta":"S"},
//            	{"opcion":"205","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"55/5=","respuestas":[
//            	{"opcion":"10","respuestaCorrecta":"N"},
//            	{"opcion":"15","respuestaCorrecta":"N"},
//            	{"opcion":"11","respuestaCorrecta":"S"},
//            	{"opcion":"9","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"125+342=","respuestas":[
//            	{"opcion":"477","respuestaCorrecta":"N"},
//            	{"opcion":"468","respuestaCorrecta":"N"},
//            	{"opcion":"467","respuestaCorrecta":"S"},
//            	{"opcion":"465","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"12x12=","respuestas":[
//            	{"opcion":"146","respuestaCorrecta":"N"},
//            	{"opcion":"136","respuestaCorrecta":"N"},
//            	{"opcion":"144","respuestaCorrecta":"S"},
//            	{"opcion":"157","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"148-148=","respuestas":[
//            	{"opcion":"1","respuestaCorrecta":"N"},
//            	{"opcion":"296","respuestaCorrecta":"N"},
//            	{"opcion":"0","respuestaCorrecta":"S"},
//            	{"opcion":"10","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"132/3=","respuestas":[
//            	{"opcion":"135","respuestaCorrecta":"N"},
//            	{"opcion":"12","respuestaCorrecta":"N"},
//            	{"opcion":"44","respuestaCorrecta":"S"},
//            	{"opcion":"48","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"30x20=","respuestas":[
//            	{"opcion":"736","respuestaCorrecta":"N"},
//            	{"opcion":"660","respuestaCorrecta":"N"},
//            	{"opcion":"600","respuestaCorrecta":"S"},
//            	{"opcion":"746","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"530/10=","respuestas":[
//            	{"opcion":"17","respuestaCorrecta":"N"},
//            	{"opcion":"70","respuestaCorrecta":"N"},
//            	{"opcion":"53","respuestaCorrecta":"S"},
//            	{"opcion":"37","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"131+740=","respuestas":[
//            	{"opcion":"781","respuestaCorrecta":"N"},
//            	{"opcion":"751","respuestaCorrecta":"N"},
//            	{"opcion":"871","respuestaCorrecta":"S"},
//            	{"opcion":"851","respuestaCorrecta":"N"}]
//            },
//            {"operacion":"214+328=","respuestas":[
//            	{"opcion":"532","respuestaCorrecta":"N"},
//            	{"opcion":"522","respuestaCorrecta":"N"},
//            	{"opcion":"542","respuestaCorrecta":"S"},
//            	{"opcion":"552","respuestaCorrecta":"N"}]
//            }
//        ];  
//	return {
//		getPreguntaAleatorea:function(nivel,callback){
//			if(arregloIndices.length===0){
//				apimockCalculemos.llenarArreglo(nivel);
//			}
//			
//			var numero = getRandomArbitrary(arregloIndices);
//			
//			callback(
//				mockdata[nivel][arregloIndices[numero]]
//			);
//			arregloIndices.splice(numero , 1);
//		},
//		llenarArreglo:function(nivel){
//			for (i = 0; i < mockdata[nivel].length; i++) {
//    				arregloIndices.push(i);
//			}
//		},
//		cambiarNivel:function(nivel){
//			arregloIndices= [];
//			apimockCalculemos.llenarArreglo(nivel);	
//		},
//		getArreglo:function(nivel){
//			return arregloIndices;
//		}
//	}	
//
//})();
//
//function getRandomArbitrary(arrgloIndices) {
//  	return parseInt(Math.random() * (arrgloIndices.length));
//}
