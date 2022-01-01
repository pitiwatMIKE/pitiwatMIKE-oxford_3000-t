const api = "oxford_words/api"

function remember(e) {
    data = {id: e.id}
    _id = e.id.split("-")[1]
    fetch(`${host}/${api}/remember`, {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
      if (data.status){
        word = document.getElementById(`dropdownMenuLink${_id}`)
        word.style.background = "#ffff89"
        word.style.borderRadius = "5px"
        word.style.fontWeight = "600"
        document.getElementById(`remember-${_id}`).style.display = "none"
        document.getElementById(`cancle_remember-${_id}`).style.display = "block"
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  };

  function marked(e) {
    data = {id: e.id}
    _id = e.id.split("-")[1]
    fetch(`${host}/${api}/marked`, {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
      if (data.status){
        word = document.getElementById(`dropdownMenuLink${_id}`)
        word.style.textDecoration = "underline"
        word.style.textDecorationColor = "red"
        word.style. textDecorationThickness = "3px"
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
    document.getElementById(`marked-${_id}`).style.display = "none"
    document.getElementById(`cancle_marked-${_id}`).style.display = "block"
  }

  function cancle_remember(e) {
    data = {id: e.id}
    _id = e.id.split("-")[1]
    fetch(`${host}/${api}/cancle_remember`, {
      method: 'put',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
      if (data.status){
        word = document.getElementById(`dropdownMenuLink${_id}`)
        word.style.background = "none"
        word.style.borderRadius = "black"
        word.style.fontWeight = "400"
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
    document.getElementById(`remember-${_id}`).style.display = "block"
    document.getElementById(`cancle_remember-${_id}`).style.display = "none"
  };

  function cancle_marked(e) {
    data = {id: e.id}
    _id = e.id.split("-")[1]
    fetch(`${host}/${api}/cancle_marked`, {
      method: 'put',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
      if (data.status){
        word = document.getElementById(`dropdownMenuLink${_id}`)
        word.style.textDecoration = "none"
        word.style.textDecorationColor = "none"
        word.style. textDecorationThickness = "none"
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
    document.getElementById(`marked-${_id}`).style.display = "block"
    document.getElementById(`cancle_marked-${_id}`).style.display = "none"
  }