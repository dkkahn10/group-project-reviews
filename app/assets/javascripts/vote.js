// var calculateUpvote = function(id) {
//
//   if (current_vote == 1) {
//
//   } else if (current_vote == 0) {
//
//   } else (current_vote == -1) {
//
//   }
// }
//
// var calculateDownvote = function(id)

$(document).ready (function() {
  $('.thumbs-up-button').on('click', function(event) {
    event.preventDefault();

    var request = $.ajax({
      method: "PUT"
      url: "/reviews/" + id + "/votes"
    })
  })
  $('.thumbs-down-button').on('click', function(event) {
    event.preventDefault();
    var request = $.ajax({
      method: "PUT",
      url: "/reviews/" + id + "/votes"
    })
  })


  request.done...

  getElementby(get id from your html).innerHTML = data.upvote_count `${} upvotes`
})
