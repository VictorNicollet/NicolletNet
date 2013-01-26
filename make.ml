open Common

let all = Read.lines "all"

let () = List.iter begin fun path ->
  Write.html path (Read.file path)  
end all 
