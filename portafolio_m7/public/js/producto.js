
  const addToCart = (id) => {
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
  
    fetch("http://localhost:3000/carritos", requestOptions)
      .then(response => response.json())
      .then(result => {
        alert(result.message)
        location.reload()
      })
      .catch(error => console.log('error', error));
  }

