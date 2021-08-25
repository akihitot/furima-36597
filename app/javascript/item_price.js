
// ブラウザをロードしたら発火
window.addEventListener('load', () => {
  //id:item-priceの要素を取得し定義
  const priceInput = document.getElementById("item-price");
// 値を入力したら発火
priceInput.addEventListener("input", () => {
  //要素の値を定義 
  const inputValue = priceInput.value;
  //値を計算して、税金を定義
  const taxValue = Math.floor(inputValue * 0.1);
  //置き換える税金の要素を取得し定義
  const addTaxDom = document.getElementById("add-tax-price");
  //innerHTMLで税金を表示させる
addTaxDom.innerHTML = taxValue
  //置き換える利益の要素を取得し定義
  const addProfitDom = document.getElementById("profit");
  //innerHTMLで利益を表示させる
addProfitDom.innerHTML = inputValue - taxValue
  })
})