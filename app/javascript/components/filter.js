const setGetParameter = () => {
  const selected = document.querySelector('#sort-price');

  selected.addEventListener("change", (event) => {
   console.log('hi');
   var url = window.location.href;
      var hash = location.hash;
      url = url.replace(hash, '');
      if (url.indexOf('option' + "=") >= 0)
      {
          var prefix = url.substring(0, url.indexOf('option' + "="));
          var suffix = url.substring(url.indexOf('option' + "="));
          suffix = suffix.substring(suffix.indexOf("=") + 1);
          suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
          url = prefix + 'option' + "=" + selected.value + suffix;
      }
      else
      {
      if (url.indexOf("?") < 0)
          url += "?option=" + selected.value;
      else
          url += "&option=" + selected.value;
      }
      window.location.href = url + hash;
  });
}

export { setGetParameter };
