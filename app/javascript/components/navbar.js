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


const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-fixed');

      } else {
        navbar.classList.remove('navbar-fixed');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
