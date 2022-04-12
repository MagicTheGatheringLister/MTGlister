
    let promises = [];
    const fetchMagicCards = () => {

    let url = `https://api.magicthegathering.io/v1/cards`;
    console.log(url)
    fetch(url)
    .then((response) => response.json())
    .then((json) => {
    promises.push(json)
    for(let i = 0; i < promises[0].cards.length; i++) {
    console.log(promises[0].cards[i].imageUrl)
    if (promises[0].cards[i].imageUrl === undefined){
    console.log("none")
}else{
        $("#magic").append(`
<div class="card-group">
  <div class="card" style="width: 8rem;">
    <img src="${promises[0].cards[i].imageUrl}" style="width: 220px; height: 300px;" class="card-img-top" alt="...">
    <div class="card-body">
    <button type="button" class="btn btn-outline-primary">Add to Deck</button>
    </div>
    </div>
    </div>
       `)
}

}})};

    fetchMagicCards();