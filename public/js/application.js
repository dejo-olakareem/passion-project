$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
showRegisterForm();
// submitRegisterForm();

});

var showRegisterForm = function(){
  $("#register").on("click",function(e){
      e.preventDefault();
      var url = $(this).attr("href");
      var method = "GET"

      console.log(url,method);
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

var submitRegisterForm = function(){
  $("body").on("submit",".sub_form",function(e){
      alert("HI AJAX IS WORKING");
      e.preventDefault();
      console.log("url, method, data")


      var url = $(this).attr("action");
      var method = $(this).attr("method");
      var data = $(this).serialize();

      $.ajax({
        url: url,
        method: method,
        data: data
      }).done(function(res){
        console.log(res);
       $("#main").html(res)
         // $("new").html(res)
         // $("form").html(res)

      })
  })
}
