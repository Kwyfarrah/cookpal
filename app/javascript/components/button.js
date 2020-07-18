const activateButton = () => {
  const homecookBtn = document.getElementById("homecook-btn");
  const customerBtn = document.getElementById("customer-btn");

  homecookBtn.addEventListener("click", (event) => {
    homecookBtn.classList.add("active");
    customerBtn.classList.remove("active");
  });

  customerBtn.addEventListener("click", (event) => {
    customerBtn.classList.add("active");
    homecookBtn.classList.remove("active");
  });

};

const updateAcceptButton = (eventTarget) => {
  eventTarget.classList.add("btn-updated");
  eventTarget.classList.add("disabled");
  eventTarget.innerHTML = "Accepted"
  eventTarget.nextElementSibling.remove("btn-updated");
};

const updateRejectButton = (eventTarget) => {
  eventTarget.classList.add("btn-updated");
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

const upadteReservationStatus = () => {
  const accepts = document.querySelectorAll(".accept");
  const rejects = document.querySelectorAll(".reject");

  accepts.forEach((accept) => {
    accept.addEventListener("click", (event) => {
    // target reservation id to update reservation status
    const reservationId = event.currentTarget.parentNode.dataset.reservation;
    const eventTarget = event.currentTarget;
    // const result = patchReservationStatusToAccept(reservationId);
    patchReservationStatusToAccept(reservationId, eventTarget);
    // eventTarget.style.backgroundColor = "red"
    });
  });

  rejects.forEach((reject) => {
    reject.addEventListener("click", (event) => {
    const reservationId = event.currentTarget.parentNode.dataset.reservation;
    const eventTarget = event.currentTarget;
    // console.log(eventTarget);
    // eventTarget.style.backgroundColor = "red"
    patchReservationStatusToReject(reservationId, eventTarget);
    // const result = patchReservationStatusToReject(reservationId);
    // if (result) updateButton(eventTarget);
    });
  });

};

export { activateButton, upadteReservationStatus };
