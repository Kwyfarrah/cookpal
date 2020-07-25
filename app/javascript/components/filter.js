const setGetParameter = () => {
  const price = document.getElementById('sort-price');
  const cusine = document.getElementById('filter-cuisine');
  const asc = document.getElementById('asc');
  const desc = document.getElementById('desc');

  price.addEventListener("change", (event) => {
   var url = window.location.href;
      var hash = location.hash;
      url = url.replace(hash, '');
      if (url.indexOf('price' + "=") >= 0)
      {
          var prefix = url.substring(0, url.indexOf('price' + "="));
          var suffix = url.substring(url.indexOf('price' + "="));
          suffix = suffix.substring(suffix.indexOf("=") + 1);
          suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
          url = prefix + 'price' + "=" + price.value + suffix;
      }
      else
      {
      if (url.indexOf("?") < 0)
          url += "?price=" + price.value;
      else
          url += "&price=" + price.value;
      }
      window.location.href = url + hash;

      if (selected.value =='ASC') {
        asc.setAttribute('selected', 'selected');
      } else if (selected.value =='DESC') {
        desc.setAttribute('selected', 'selected');
      }
  });

 cusine.addEventListener("change", (event) => {
   var url = window.location.href;
      var hash = location.hash;
      url = url.replace(hash, '');
      if (url.indexOf('cuisine' + "=") >= 0)
      {
          var prefix = url.substring(0, url.indexOf('cuisine' + "="));
          var suffix = url.substring(url.indexOf('cuisine' + "="));
          suffix = suffix.substring(suffix.indexOf("=") + 1);
          suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
          url = prefix + 'cuisine' + "=" + cusine.value + suffix;
      }
      else
      {
      if (url.indexOf("?") < 0)
          url += "?cuisine=" + cusine.value;
      else
          url += "&cuisine=" + cusine.value;
      }
      window.location.href = url + hash;
  });



}

export { setGetParameter };
