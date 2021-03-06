
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});


var iniciarSesion = (function () {
    return {
        iniciarSesionPaciente(){
            var nombreUsuario = $("#usuarioPaciente").val();
            var password = $("#passwordPaciente").val();
            
            if(nombreUsuario===""){
                $("#mensajeFaltaProm").text("Por favor ingrese el usuario"); 
                $("#divProm").show();
            }
            else if(password===""){
                $("#mensajeFaltaProm").text("Por favor ingrese la contraseña"); 
                $("#divProm").show();
            }
            else{
                var promesa = apiclientIniciarSesion.autenticacionPaciente(nombreUsuario,password , function(usuario){ 
                    
                    sessionStorage.setItem("id", usuario.id);
                    sessionStorage.setItem("nombres", usuario.nombres);
                    sessionStorage.setItem("apellidos", usuario.apellidos);
                    sessionStorage.setItem("documentoIdentidad", usuario.documentoIdentidad);
                    sessionStorage.setItem("fechaNacimiento", usuario.fechaNacimiento);
                    sessionStorage.setItem("genero", usuario.genero);
                    sessionStorage.setItem("pais", usuario.pais);
                    sessionStorage.setItem("nombreUsuario", usuario.nombreUsuario);
                    sessionStorage.setItem("password", usuario.password);
                    sessionStorage.setItem("direccion", usuario.direccion);
                    sessionStorage.setItem("ciudad", usuario.ciudad);
                    sessionStorage.setItem("tipoDocumento", usuario.tipoDocumento);
                    sessionStorage.setItem("correo", usuario.correo);
                    sessionStorage.setItem("Token", usuario.token);
                    alert("Bienvenido, " + usuario.nombres+" "+usuario.apellidos);
                    window.location.href = "menuPaciente.html";
                }); 
                promesa.then(function(){},function(){
                    $("#mensajeFaltaProm").text(promesa.responseText); 
                    $("#divProm").show();
                });
            }
        },
        iniciarSesionFamiliar(){
            var nombreUsuario = $("#usuarioFamiliar").val();
            var password = $("#passwordFamiliar").val();
            
            if(nombreUsuario===""){
                $("#mensajeFaltaFam").text("Por favor ingrese el usuario"); 
                $("#divFam").show();
            }
            else if(password===""){
                $("#mensajeFaltaFam").text("Por favor ingrese la contraseña"); 
                $("#divFam").show();
            }
            else{
                var promesa = apiclientIniciarSesion.autenticacionFamiliar(nombreUsuario,password , function(usuario){ 
                    sessionStorage.setItem("id", usuario.id);
                    sessionStorage.setItem("nombres", usuario.nombres);
                    sessionStorage.setItem("apellidos", usuario.apellidos);
                    sessionStorage.setItem("documentoIdentidad", usuario.documentoIdentidad);
                    sessionStorage.setItem("nombreUsuario", usuario.nombreUsuario);
                    sessionStorage.setItem("password", usuario.password);
                    sessionStorage.setItem("tipoDocumento", usuario.tipoDocumento);
                    sessionStorage.setItem("correo", usuario.correo);
                    sessionStorage.setItem("Token", usuario.token);
                    alert("Bienvenido, " + usuario.nombres+" "+usuario.apellidos);
                    window.location.href = "perfilFamiliar.html";
                }); 
                promesa.then(function(){},function(){
                    $("#mensajeFaltaFam").text(promesa.responseText); 
                    $("#divFam").show();
                });
            }
        },
        iniciarSesionPersonalSalud(){
            var nombreUsuario = $("#usuarioPersonalSalud").val();
            var password = $("#passwordPersonalSalud").val();
            console.info(nombreUsuario)
            console.info(password)
            if(nombreUsuario===""){
                $("#mensajeFaltaPerSal").text("Por favor ingrese el usuario"); 
                $("#divPerSal").show();
            }
            else if(password===""){
                $("#mensajeFaltaPerSal").text("Por favor ingrese la contraseña"); 
                $("#divPerSal").show();
            }
            else{
                var promesa = apiclientIniciarSesion.autenticacionPersonalSalud(nombreUsuario,password , function(usuario){ 
                    sessionStorage.setItem("id", usuario.id);
                    sessionStorage.setItem("nombres", usuario.nombres);
                    sessionStorage.setItem("apellidos", usuario.apellidos);
                    sessionStorage.setItem("documentoIdentidad", usuario.documentoIdentidad);
                    sessionStorage.setItem("nombreUsuario", usuario.nombreUsuario);
                    sessionStorage.setItem("password", usuario.password);
                    sessionStorage.setItem("tipoDocumento", usuario.tipoDocumento);
                    sessionStorage.setItem("correo", usuario.correo);
                    sessionStorage.setItem("rol", usuario.rol);
                    sessionStorage.setItem("Token", usuario.token);
                    alert("Bienvenido, " + usuario.nombres+" "+usuario.apellidos);
                    window.location.href = "perfilPersonalSalud.html";
                }); 
                promesa.then(function(){},function(){
                    $("#mensajeFaltaPerSal").text(promesa.responseText); 
                    $("#divPerSal").show();
                });
            }
        },
        iniciarSesionInvitado(){
            var promesa = apiclientIniciarSesion.autenticacionInvitado(function(usuario){ 
                sessionStorage.setItem("Token", usuario.accessToken);
                window.location.href = "menuPaciente.html";
            }); 
            promesa.then(function(){},function(){
                alert("Ha ocurrido un error con el token de acceso. "+promesa.responseText);
            });
        }
    };
}());