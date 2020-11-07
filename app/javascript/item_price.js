window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = tax;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = inputValue - tax;
  })
});