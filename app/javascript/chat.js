function post() {
  const submit = document.getElementsByClassName("form-submit")[0];
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementsByClassName("form")[0];
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    let url = window.location.pathname;
    XHR.open("POST", url, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const messages = document.getElementsByClassName("messages")[0];
      const item = XHR.response.message;
      const html = `
        <div class="message">
          <div class="upper-message">
            <div class="message-user">
              //（要修正）idから店舗名に変換
              ${item.store_id}
            </div>
            <div class="message-date">
              //（要修正）日本時間表記に変換
              ${item.created_at}
            </div>
          </div>
          <div class="middle-message">
            <div class="message-comment">
              ${item.comment}
            </div>
          </div>
          <div class="lower-message">
            <div class="message-ingredients">
              ${item.ingredients}
            </div>
            <div class="message-quantity">
              ${item.quantity}
            </div>
            <div class="message-preservation">
              ${item.preservation}
            </div>
            <div class="message-expiry">
              ${item.expiry}
            </div>
          </div>
        </div>`;
      messages.insertAdjacentHTML("beforeend", html);
    };
  });
}

window.addEventListener('load', post);