const dateTimePicker = () => {
  const el = document.getElementById('datetimepicker');
  if (el) {
    flatpickr(el, {
      enableTime:      true,
      altInput:        true,
      minDate:         "today",
      altFormat:       "F j, Y at h:i K",
      dateFormat:      "Y-m-d H:i",
      defaultHour:     23,
      defaultMinute:   59,
      minuteIncrement: 1
    });
  }

}
export { dateTimePicker };
