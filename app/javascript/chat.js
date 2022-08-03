function post() {
  const submit = document.getElementsByClassName("form-submit")[0];
  submit.addEventListener('click', () => {
    const form = document.getElementsByClassName("form")[0];
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/rooms/:room_id/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
}

window.addEventListener('load', post);