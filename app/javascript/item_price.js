window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom1 = document.getElementById("add-tax-price");
  const tax = 10;
  const total = Math.floor(inputValue * 0.1)
  addTaxDom1.innerHTML = total
  const addTaxDom2 = document.getElementById("profit");
  const profitTax = Math.floor(inputValue - total)
  addTaxDom2.innerHTML = profitTax
})
profit

})