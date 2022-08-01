function post() {
  const submit = document.getElementsByClassName("form-submit")[0];
  submit.addEventListener('click', () => {
    const form = document.getElementsByClassName("form")[0];
    const formData = new FormData(form);
  });
}

window.addEventListener('load', post);