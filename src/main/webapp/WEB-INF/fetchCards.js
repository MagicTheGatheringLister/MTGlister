
let promises = [];
const fetchMagicCards = () => {

    let url = `https://api.magicthegathering.io/v1/cards`;
    console.log(url)
    fetch(url)
        .then((response) => response.json())
        .then((json) => {
            promises.push(json)
            // window.localStorage.setItem("promises", JSON.stringify(promises));
            for(let i = 0; i < promises[0].cards.length; i++) {
                // console.log(promises[0].cards[i].imageUrl)
                if (promises[0].cards[i].imageUrl == undefined){

                }else{
                    $("#magic").append(`
<div class="card-group ">
  <div class="card " style="width: 8rem;">
    <img src="${promises[0].cards[i].imageUrl}" style="width: 235px; height: 300px;" class="card-img-top" alt="...">
    <div class="card-body d-flex justify-content-center">
    <button type="button" id="btn${i}" class="btn btn-outline-primary">Add to Deck</button>
    </div>
    </div>
    </div>
       `)
                    $("#btn" + i).on("click", e =>{
                        e.preventDefault();
                        document.getElementById("hiddenName").value=promises[0].cards[i].name;
                        document.getElementById("hiddenImage").value=promises[0].cards[i].imageUrl;
                    })
                }
            }})};

fetchMagicCards();
// if (JSON.parse(window.localStorage.getItem('promises')) !== null) {
//     promises = JSON.parse(window.localStorage.getItem('promises'));
//     console.log("from local")
//     console.log(promises)
// } else {
//     console.log("new Request")
//     fetchMagicCards();
//     console.log(promises)
// }

let searchArray= [];
$("#search").on("click", e => {
    e.preventDefault();
    let cardName = $("#input").val();
    for (let i = 0; i < promises[0].cards.length; i++){
        if(promises[0].cards[i].name.includes(cardName)){
            searchArray = promises[0].cards[i].imageUrl;
            // console.log(searchArray)
            $("#magic").empty();
            $("#searchedCard").append(`
<div class="card-group ">
  <div class="card " style="width: 8rem;">
    <img src="${searchArray}" style="width: 235px; height: 300px;" class="card-img-top" alt="...">
    <div class="card-body d-flex justify-content-center">
    <button type="button" id="searchBtn${i}" class="btn btn-outline-primary">Add to Deck </button>
    </div>
    </div>
    </div>
       `)
            $("#searchBtn" + i).on("click", e =>{
                e.preventDefault();
                console.log(promises[0].cards[i].name)
            })

        }
    }
})

window.onload=function(){
    var auto = setTimeout(function(){ autoRefresh(); }, 100);

    function submitForm(){
        document.getElementById("#submit").submit();
    }

    function autoRefresh(){
        clearTimeout(auto);
        auto = setTimeout(function(){ submitForm(); autoRefresh(); }, 2000);
    }
}
