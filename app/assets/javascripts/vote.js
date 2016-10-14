function clickUpvote () {
  event.preventDefault();
  let id = event.currentTarget.id;
  let request = $.ajax({
    url: `/reviews/${id}/upvote.json`,
    method: "POST",
    error: function() {
      alert('You need to sign in or sign up before continuing')
    }
  });
  request.done(function(data) {
    document.getElementById(`total${id}`).innerHTML = data.vote;
  });
};


function clickDownvote() {
  event.preventDefault();
  let id = event.currentTarget.id;
  let request = $.ajax({
    url: `/reviews/${id}/downvote.json`,
    method: "POST",
    error: function() {
      alert('You need to sign in or sign up before continuing')
    }
  });
  request.done(function(data) {
    document.getElementById(`total${id}`).innerHTML = data.vote;
  });
};
