$(document).ready (function() {
  $('#get-vote').on('click', function (event) {
    event.preventDefault();
    var request =$.ajax({
      method: "POST",
      url: "/"
    });
    request.done(function(data) {
      alert(data.dish);
    })
  })
})
