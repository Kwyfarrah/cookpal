// const initialDisplay = () => {
//   const homecookBtn = document.getElementById("homecook-btn");
//   const customerBtn = document.getElementById("customer-btn");
//   const customerTab = document.querySelector(".customer-tab");
//   const homecookTab = document.querySelector(".homecook-tab");
//   if (homecookTab.classList.contains("active")){
//     customerTab.classList.add("hidden")
//   } else if (customerTab.classList.contains("active")){
//     homecookTab.classList.add("hidden")
//   }
// };

const activateButton = () => {
  const homecookBtn = document.getElementById("homecook-btn");
  const customerBtn = document.getElementById("customer-btn");
  const customerTab = document.querySelector(".customer-tab-wrapper");
  const homecookTab = document.querySelector(".homecook-tab-wrapper");
  homecookBtn.addEventListener("click", (event) => {
    homecookBtn.classList.add("active");
    customerBtn.classList.remove("active");
    customerTab.classList.add("hidden");
    homecookTab.classList.remove("hidden");
  });

  customerBtn.addEventListener("click", (event) => {
    customerBtn.classList.add("active");
    homecookBtn.classList.remove("active");
    homecookTab.classList.add("hidden");
    customerTab.classList.remove("hidden");
  });

};

const updateAcceptButton = (eventTarget) => {
  eventTarget.classList.add("btn-updated-accepted");
  eventTarget.classList.add("disabled");
  eventTarget.innerHTML = "Accepted"
  eventTarget.nextElementSibling.remove("btn-updated");
};

const updateRejectButton = (eventTarget) => {
  eventTarget.classList.add("btn-updated-rejected");
  eventTarget.classList.add("disabled");
  eventTarget.innerHTML = "Rejected"
  eventTarget.previousElementSibling.remove("btn-updated");
};

const patchReservationStatusToAccept = (reservationId, eventTarget) => {
  fetch("/reservations/" + reservationId + "?status=accept", {
    method: "PATCH",
    // body: JSON.stringify({ 'status': "accept" })
  })
    .then((data) => {
      console.log(data.ok);
      if (data.ok) updateAcceptButton(eventTarget);
    });
};

const patchReservationStatusToReject = (reservationId, eventTarget) => {
  fetch("/reservations/" + reservationId + "?status=reject", {
    method: "PATCH",
    // body: JSON.stringify({ 'status': "reject" })
  })
    // .then(response => response.json())
    .then((data) => {
      console.log(data.ok);
     if (data.ok) updateRejectButton(eventTarget);
    });
};

const targetReservationID = (btn) => {
  btn.addEventListener("click", (event) => {
  // target reservation id to update reservation status
  const reservationId = event.currentTarget.parentNode.dataset.reservation;
  const eventTarget = event.currentTarget;
  console.log(eventTarget);
  if (eventTarget.className.includes('accept')){
    patchReservationStatusToAccept(reservationId, eventTarget);
  } else if (eventTarget.className.includes('reject')){
    patchReservationStatusToReject(reservationId, eventTarget);
  }
  });
};

const upadteReservationStatus = () => {
  const accepts = document.querySelectorAll(".accept");
  const rejects = document.querySelectorAll(".reject");

  accepts.forEach((accept) => {
    targetReservationID(accept);
  });

  rejects.forEach((reject) => {
    targetReservationID(reject);
  });

};

export { activateButton, upadteReservationStatus };
