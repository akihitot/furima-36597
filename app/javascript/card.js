//pay関数
const pay = () => {
  //公開鍵を設定
  Payjp.setPublicKey("pk_test_7d83f536df000b2935d86cdf");
  //buttonの要素を変数submitへ代入
  const submit = document.getElementById("button");
  //クリックしたら発火
  submit.addEventListener("click", (e) => {
    //フォーム送信処理キャンセル
    e.preventDefault();
    //charge-form要素をformResultへ代入
    const formResult = document.getElementById("charge-form");
    //FormDataオブジェクト生成
    const formData = new FormData(formResult);
    //FormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入
    const card = {
      number: formData.get("purchase_shipping[number]"),
      cvc: formData.get("purchase_shipping[cvc]"),
      exp_month: formData.get("purchase_shipping[exp_month]"),
      exp_year: `20${formData.get("purchase_shipping[exp_year]")}`,
    };

    console.log(card);
    //カード情報をPAY.JP側に送りトークン化するメソッド
    //cardは、PAY.JP側に送るカードの情報
    //第二引数のcallback(status,response)には、PAY.JP側からトークンが送付された後に実行する処理
    Payjp.createToken(card, (status, response) => {
      //statusはHTTPステータスコード
      if (status == 200) {
        //responseはそのレスポンスの内容が含まれ、response.idとすることでトークンの値を取得
        const token = response.id;
        //input要素にトークンの値を埋め込みフォームに追加
        const renderDom = document.getElementById("charge-form");
        //valueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）
        //hiddenでフォーム内のトークンの値隠す
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        //フォームの中に作成したinput要素を追加
        //beforeend:element内部の最後の子要素の後に挿入
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      //この段階でカード情報はトークン化されて不要なので、削除する
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      //フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
  });
});
};
window.addEventListener("load", pay);//ページを読み込んだらpay関数を実行