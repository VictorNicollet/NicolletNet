open Common 

let article path page = 
  Write.html path begin
    "<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
    <title>" ^ BatOption.default "" page.Page.title ^ "</title>
  </head>
  <body>
" ^ page.Page.content ^ " 
  </body>
</html>"
  end
