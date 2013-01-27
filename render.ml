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
    <h1>Nicollet.net</h1>
    <h2>" ^ BatOption.default "Untitled" page.Page.title ^ "
      <div class=date>" ^(match page.Page.date with None -> "" | Some d ->
        Page.(Printf.sprintf "%d / %02d / %02d" d.y d.m d.d) ) ^ "</div>
    </h2>
    <div class=content>
      " ^ (if page.Page.draft then "	  
        <div class=draft>This page has been automatically recovered from my old blog. As such, the layout may be a little off. I am incrementally converting all pages to the new system, so it will eventually look much better.</div>
      " else "") ^ "
      " ^ page.Page.content ^ "
    </div> 
  </body>
</html>"
  end
