window.addEventListener('load', () => {
  const item_price = document.getElementById("item-price");
  if (!item_price) { return false; }
  item_price.addEventListener("input", () => {
    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.innerHTML = Math.round(item_price.value * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.round(item_price.value - Math.round(item_price.value * 0.1))
  })
});