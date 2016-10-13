$(document).ready(function() {

  $('.thumbs-up-button').on('click', function(event) {
    event.preventDefault();
    var url = this.parentElement.action;
    var currentTarget = $(event.currentTarget);
    var id = parseInt(this.id);
    var request = $.ajax({
      url: `${url}.json`,
      method: "POST",
    })

    request.done(function(data) {
      document.getElementById(`total${id}`).innerHTML = data.vote;
    });
  });

  $('.thumbs-down-button').on('click', function(event) {
    event.preventDefault();
    var url = this.parentElement.action;
    var currentTarget = $(event.currentTarget);
    var id = parseInt(this.id);
    var request = $.ajax({
      url: `${url}.json`,
      method: "POST",
    })
    request.done(function(data) {
      document.getElementById(`total${id}`).innerHTML = data.vote;
    });
  })

})
