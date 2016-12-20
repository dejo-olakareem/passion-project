$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
showRegisterForm()

});

var showRegisterForm = function(){
  $("#register").on("click",function(e){
      e.preventDefault()
      var url = $(this).attr("href")
      var method = "GET"

      console.log(url,method)
      $.ajax({
        url: url,
        method: method
      }).done(function(res){
        console.log(res)
       // $("#new").append(res)
         // $("new").html(res)
         $(".form").html(res)

      })
  })
}
