let path = "all"
    
let read () = 
  let chan = open_in path in 
  let rec aux acc = 
    let line = try Some (input_line chan) with End_of_file -> None in
    match line with None -> acc | Some line -> aux (line :: acc) 
  in
  let lines = aux [] in
  close_in chan ; 
  lines
    
let write lines = 
  let lines = List.rev lines in 
  let chan = open_out path in 
  let output str = output_string chan str ; output_char chan '\n' in
  List.iter output lines ;
  close_out chan 
