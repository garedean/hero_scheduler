$(function() {
  $('.swap-link').click(function() {
    resetOtherRows($(this));
    replaceWithSelect($(this));
  })

  function replaceWithSelect($e) {
    $e.hide();
    $e.parent().find('form.edit_work_day').show();
  }

  function resetOtherRows($e) {
    var thisRowForm = $e.parent().find('form.edit_work_day');

    thisRowForm.show();
    $('td .swap-link').not($(this)).show();
    $("form.edit_work_day").not(thisRowForm).hide();
  }

  $('.reschedule-link').click(function() {
    var nextOpenDay = $(this).data('next-open-day');
    var response    = confirm("The next open shift is " + nextOpenDay + ". Reschedule to that date?");

    if (response === true) {
      $(this).parent().find('.edit_user').submit();
    }
  });
})

$(document).on('page:change', function(event) {
  $('.flash').delay(1500).fadeOut(500);
});
