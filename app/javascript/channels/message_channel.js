import consumer from "./consumer"

if (location.pathname.match(/\/rooms\/\d\/messages/)) {

  consumer.subscriptions.create({
    channel: "MessageChannel",
    room_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const yyyymmdd = new Intl.DateTimeFormat(
        undefined,
        {
          year:   'numeric',
          month:  '2-digit',
          day:    '2-digit',
          hour:   '2-digit',
          minute: '2-digit',
          second: '2-digit',
        }
      );
      const messageDate = yyyymmdd.format( new Date() );
      const html = `
        <div class="message">
          <div class="upper-message">
            <div class="message-user">
              ${data.store.name}
            </div>
            <div class="message-date">
              ${messageDate}
            </div>
          </div>
          <div class="middle-message">
            <div class="message-comment">
              ${data.message.comment}
            </div>
          </div>
          <div class="lower-message">
            <div class="message-ingredients">
              ${data.message.ingredients}
            </div>
            <div class="message-quantity">
              ${data.message.quantity}
            </div>
            <div class="message-preservation">
              ${data.message.preservation}
            </div>
            <div class="message-expiry">
              ${data.message.expiry}
            </div>
          </div>
        </div>`;
      const messages = document.getElementsByClassName("messages")[0];
      messages.insertAdjacentHTML("beforeend", html);
      const form = document.getElementsByClassName("form")[0];
      form.reset();
    }
  });
}
