const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form"); 
  form.addEventListener("submit", (e) => {
    e.preventDefault();
  });
 };