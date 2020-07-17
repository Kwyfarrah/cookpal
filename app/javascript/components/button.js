const activateButton = () => {
  const homecookBtn = document.getElementById("homecook-btn");
  const customerBtn = document.getElementById("customer-btn");

  homecookBtn.addEventListener("click", (event) =>{
    homecookBtn.classList.add("active");
    customerBtn.classList.remove("active");
  });

  customerBtn.addEventListener("click", (event) =>{
    customerBtn.classList.add("active");
    homecookBtn.classList.remove("active");
  });

};

export { activateButton };
