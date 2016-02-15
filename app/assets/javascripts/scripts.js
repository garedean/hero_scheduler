$(function() {
  // Insert test user credentials on login screen
  $('#user_login').val('boris');
  $('#user_password').val('123abc!!');

  // Fade out flash when it appears
  $('.flash').delay(1000).fadeOut(500);
})
