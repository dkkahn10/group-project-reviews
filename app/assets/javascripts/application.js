$(document).ready (function() {
  $('#get-dish').on('click', function (event) {
    event.preventDefault();
    var request =$.ajax({
      method: "POST",
      url: "/dishes.json"
    });
    request.done(function(data) {
      alert(data.dish);
    })
  })
})
