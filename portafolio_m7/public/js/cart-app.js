  function btnComprarAhora(id){

        let precioTotalCompra = document.getElementById('subtotal').innerText
        axios.post("/venta/", {id, precioTotalCompra})
        .then(function (response) {
            if(response.data.code != 201){
              console.log(response)
                alert('Error: se ha producido un error al generar la venta')
            }else {
              console.log(response)
              alert(`VENTA ID ${response.data.data.id}\n
              Tu compra por un total de $${response.data.data.precioTotal} se ha procesado exitosamente.\n
              Te esperamos de vuelta pronto!`)
            }
        })
        .catch(function (error) {
            console.log(error)
            alert(`Se ha producido un error al generar la venta`);
        })
        .then(function (){
          location.replace('/')
         });
    
  }

// logica restar y sumar carro

function restar(id) {

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    var raw = JSON.stringify({
      "id_cliente": "2",
      "id_producto": id
    });

    var requestOptions = {
    method: 'DELETE',
    headers: myHeaders,
    body: raw,
    redirect: 'follow'
    };

    fetch("/carritos", requestOptions)
    .then(response => response.json())
    .then(result =>{
        alert(result.message);
        location.reload();
    })
    .catch(error => {
        console.log(error);
        alert('se ha generado un error al intentar descontar el producto')
    });

}

function sumar(id) {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    var raw = JSON.stringify({
      "id_cliente": "2",
      "id_producto": id
    });

    var requestOptions = {
    method: 'POST',
    headers: myHeaders,
    body: raw,
    redirect: 'follow'
    };

    fetch("/carritos", requestOptions)
    .then(response => response.json())
    .then(result =>{
        alert(result.message);
        location.reload();
    })
    .catch(error => {
        alert('se ha generado un error al intentar agregar el producto')
    });
}

// logica vaciar carrito
document.getElementById("btn-vaciar").addEventListener("click", function(event){
  event.preventDefault();
  let respuesta= confirm("¿Está seguro que desea vaciar el carro de compras?")
  if(respuesta){
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    var raw = JSON.stringify({
      "id_cliente": "2",
    });

    var requestOptions = {
    method: 'DELETE',
    headers: myHeaders,
    body: raw,
    redirect: 'follow'
    };

    fetch("/carrito", requestOptions)
    .then(response => response.json())
    .then(result =>{
        alert(result.message);
        location.reload();
    })
    .catch(error => {
        console.log(error);
        alert('se ha generado un error al intentar vaciar el carro')
    });

  } 
})