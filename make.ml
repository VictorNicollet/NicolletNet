open Common

let () = 
  Hashtbl.iter Render.article Page.all 


let () = 
  Write.raw "old-blog.css" (Read.file "old-blog.css")
