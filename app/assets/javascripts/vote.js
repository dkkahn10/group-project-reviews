$(document).ready(function() {

  $('.thumbs-up-button').on('click', function(event) {
    event.preventDefault();
    let url = this.parentElement.action;
    let currentTarget = $(event.currentTarget);
    let id = parseInt(this.id);
    let request = $.ajax({
      url: `${url}.json`,
      method: "POST",
    });
    request.done(function(data) {
      document.getElementById(`total${id}`).innerHTML = data.vote;
    });
  });

  $('.thumbs-down-button').on('click', function(event) {
    let url = this.parentElement.action;
    event.preventDefault();
    let currentTarget = $(event.currentTarget);
    let id = parseInt(this.id);
    let request = $.ajax({
      url: `${url}.json`,
      method: "POST",
    });
    request.done(function(data) {
      document.getElementById(`total${id}`).innerHTML = data.vote;
    });
  });

});
