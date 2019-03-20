// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

function ChangeLikeCount(post_id) {
  display = document.getElementById("count_with_post.id=" + post_id);
  $.get("/posts/" + post_id + "/likes", function(response) {
    count = response.length;
    display.innerHTML = count + " likes";
  });
}

function ChangeLikeButton(post_id) {
  var button = document.getElementById("like_with_post.id=" + post_id);
  if (button.innerHTML === "Like") {
    ChangeButtonToUnlike(button);
    AddLike(post_id);
  } else {
    ChangeButtonToLike(button);
    DeleteLike(post_id);
  }
}

function AddLike(post_id) {
  $.post("/posts/" + post_id + "/likes", { post_id: post_id }, function() {
    ChangeLikeCount(post_id);
  });
}

function DeleteLike(post_id) {
  $.post(
    "/posts/" + post_id + "/likes/destroy_like_on_post",
    { post_id: post_id },
    function() {
      ChangeLikeCount(post_id);
    }
  );
}

function ChangeButtonToUnlike(button) {
  button.innerHTML = "Unlike";
}

function ChangeButtonToLike(button) {
  button.innerHTML = "Like";
}
