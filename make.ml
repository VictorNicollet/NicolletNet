open Common

let all = Read.lines "all"

let () = List.iter begin fun path ->
  try 
    let raw  = Read.file path in
    let page = Page.load raw in 
    Render.article path page
  with exn -> 
    Printf.printf "%s : exception %s\n" path (Printexc.to_string exn) 
end all 
