let args = 
  match Array.to_list Sys.argv with 
    | _ :: args -> args
    | [] -> assert false

let make () =
  let _ = Sys.command "make Makefile" in
  let _ = Sys.command "make all" in
  () 

let add files = 
  let lines = List.filter (fun i -> not (List.mem i files)) (All.read ()) in 
  All.write (List.rev_append files lines) 

let () = 
  match args with 
    | [] | ["make"] -> make ()
    | "add" :: files -> add files  
    | _ -> print_endline "Unknown command"
