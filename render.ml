open Common 

let bestof = 
  let list = 
    Hashtbl.fold (fun _ page list -> if page.Page.bestof then page :: list else list) 
      Page.all []
  in
  String.concat "" (List.map (fun page -> 
    "<li><a href='" ^ page.Page.url ^ "'>" 
    ^ BatOption.default "Untitled" page.Page.title 
    ^ "</a></li>"
  ) list)

let article path page = 
  Write.html path begin
    "<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
    <title>" ^ BatOption.default "" page.Page.title ^ "</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Fjalla+One&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link rel=\"stylesheet\" href=\"/old-blog.css\"/>
  </head>
  <body>
    <div class=side>
      <div id=victor></div>
      <p>
        Hi. My name is Victor Nicollet. <br/>
        I built <a href='http://runorg.com'>RunOrg</a> and 
        <a href='http://ohm-framework.com'>Ohm</a>.<br/>
      </p>
      <p>
        More articles from me ? Try these: 
      </p>
      <ul>" ^ bestof ^ "</ul>
      <p>
        Or visit the <a href='/archives'>archives</a>. 
      </p>
    </div>
    <div class=main>
      <h2>
        <div class=date>
          " ^ (match page.Page.date with None -> "" | Some d ->
            Page.(Printf.sprintf "%d / %02d / %02d" d.y d.m d.d) ) ^ "
        </div>
        <span>" ^ BatOption.default "Untitled" page.Page.title ^ "</span>
      </h2>
      <div class=content>
      " ^ (if page.Page.draft then "	  
          <div class=draft>This page has been automatically recovered from my old blog. As such, the layout may be a little off. I am incrementally converting all pages to the new system, so it will eventually look much better.</div>
      " else "") ^ "
      " ^ page.Page.content ^ "
      </div> 
    </div>
  </body>
</html>"
  end
