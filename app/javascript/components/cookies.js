if (window.localStorage.getItem('cookieSeen') != 'shown'){
  setTimeout(function () {
      $("#cookieConsent").fadeIn(200);
    }, 1000);
  window.localStorage.setItem('cookieSeen','shown');
}
$("#closeCookieConsent, .cookieConsentOK").click(function() {
  $("#cookieConsent").fadeOut(200);
})