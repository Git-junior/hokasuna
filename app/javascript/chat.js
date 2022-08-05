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
  });
}

window.addEventListener('load', post);