open Common 

let article path page = 
  Write.html path begin
    "<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
    <title>" ^ BatOption.default "" page.Page.title ^ "</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic' rel='stylesheet' type='text/css'>
    <link rel=\"stylesheet\" href=\"/old-blog.css\"/>
  </head>
  <body>
" ^ page.Page.content ^ " 
  </body>
</html>"
  end
