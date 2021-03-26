window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  
  priceInput.addEventListener("input", () => {
    
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const inputValue = priceInput.value;
    const tax = inputValue / 10
    addTaxDom.innerHTML = tax
    profitDom.innerHTML = inputValue - tax
  })
});



