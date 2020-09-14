function calculation() {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", (e)  => {
    let priceValue = document.getElementById("item-price").value;
    let tax = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    profit.innerHTML = Math.round(priceValue * 0.9).toLocaleString();
    tax.innerHTML = Math.round(priceValue * 0.1).toLocaleString();
  })
}
window.addEventListener("load", calculation);