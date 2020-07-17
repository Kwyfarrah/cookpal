const updateNavbar = () =>{
  const loggedIn = document.querySelector(".logged-in");
  const navLink = document.querySelector(".nav-link");
  const dropdownIcon = document.querySelector(".dropdown-icon");
  if (loggedIn){
    navLink.parentNode.className = "nav-item displayNone";
  } else {
    dropdownIcon.className = "nav-item dropdown-icon displayNone";
  }
};



export { updateNavbar };
