/* 삭제하기 */
function deletePost(id){
  var postId=id;
  $.ajax({
    url: "/app/reviewFeed/delete",
    type: "POST",
    data: { "postId" : postId },
    success: function(){
      location.reload();
    },
    error: function(xhr, status, msg) {
        console.log(xhr);
        console.log(status);
        console.log(msg);
      }
  });
}