$(document).ready(function() {

  $('.thumbs-up-button').on('click', function(event) {
    event.preventDefault();
    var url = this.parentElement.action;
    var currentTarget = $(event.currentTarget);
    var id = this.id;
    var request = $.ajax({
      url: `${url}.json`,
      method: "PUT"
    })
  })

  $('.thumbs-down-button').on('click', function(event) {
    event.preventDefault();
    var url = this.parentElement.action;
    var currentTarget = $(event.currentTarget);
    var id = this.id;
    var request = $.ajax({
      url: `${url}.json`,
      method: "PUT"
    })
  })

  request.done(function(data) {
    getElementByClass(".total-votes-value").innerHTML = "lksdjfoisdj"
  });

})
