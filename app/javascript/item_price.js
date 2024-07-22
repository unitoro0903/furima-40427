window.addEventListener('turbo:load', function(){
  document.getElementById("item-price").addEventListener('keyup', function(){
    let price = Number(document.getElementById("item-price").value);
    let fee = Math.floor(price * 0.1);
    let profit = Math.floor(price - fee);
    document.getElementById("add-tax-price").textContent = fee;
    document.getElementById("profit").textContent = profit;
  })
})
