function capturador(){
document.getElementById("form-login").addEventListener("submit", function(event){
    event.preventDefault();
    let nombre = document.getElementById("login-usuario").value;
    let clave = document.getElementById("login-password").value;

    axios.get(`http://localhost:3000/autenticacion/${nombre}/${clave}`)
      .then(function (response) {
            let usuario = response.data.message;
            console.log(usuario);
            
            if(usuario){
                alert('Usuario autenticado')
            }else{
                Swal.fire('Datos incorrectos');
            }
      })
      .catch(function (error) {
        console.log(error.response)
        alert(`Error al autenticar usuario`);
      })
      .then(function(){
            let link = `/usuario?nombre=${nombre}`
            location.replace(link)
      })
   
})
}

capturador()



