declare option exist:serialize "method=xhtml media-type=text/html";

let $dir := request:get-parameter("dir",())
let $images := 
   for $fn in xmldb:get-child-resources(concat("/db/apps/2d/imageanimation/",$dir)) 
   let $rfn := replace($fn,"%20"," ")
   order by $rfn return $rfn
   
return 
<html>
<head>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
      <script type="text/javascript">
       var dir ='{$dir}';
       var images = [ {string-join( for $image in $images return concat("'",$image,"'"),", ")} ];
       </script>
      <script type="text/javascript" src="animate.js"></script> 
</head>

<body>
   <h2 id="caption"/>
   <img id="photo" width="400"/>
   <br/>  
   <button onclick="show_image(1)">First</button> 
   <button onclick="prev_image()">Previous</button> 
   <button onclick="next_image()">Next</button> 
   <button onclick="show_image({count($images)})">Last</button>
   <button onclick="start_animate()">Start Animation</button> 
   <button onclick="stop_animate()">Stop Animation</button> 
 
</body>
</html>
