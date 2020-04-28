<html>
  <head>
    <title>Like Disklike</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
  </head>
  
  <body>
    <div id="demo">
      <button id="like-btn">Like</button>
    </div>
    
    <script>
       $("#like-btn").click((e) => {
         e.preventDefault();
         let txt = $("#like-btn").text();
         if (txt == "Like"){
           $("#like-btn").text("Liked");
           $("#like-btn").css({'background-color': 'blue', 'color': 'white'});
           //Database calls here.
         }else{
           $("#like-btn").text("Like");
           $("#like-btn").css({'background-color': 'gray', 'color': 'black'});
         }
       });
    </script>
    <style>
      #like-btn{
        background-color: gray;
        margin: 0;
        border: 0;
        padding: 2px;
        color: black;
        outline: 0;
      }
    </style>
  </body>
</html>