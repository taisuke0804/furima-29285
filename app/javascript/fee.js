function check() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const itemProfit = document.getElementById("profit")

  itemPrice.addEventListener("change", function(){
    const price = itemPrice.value;
    const tax = price * 0.1;
    const profit = price - tax;
    taxPrice.innerHTML = tax
    itemProfit.innerHTML = profit
  })
}
window.addEventListener("load", check);