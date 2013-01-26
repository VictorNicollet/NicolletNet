let mkdir path access = 
  Unix.mkdir path access
    
let is_dir path =
  try Sys.is_directory path with
  | Sys_error str when str = path ^ ": No such file or directory" -> false
  | exn -> raise exn 

let mkdir_ensure path access =
  let rec make path =
    if not (is_dir path) then (
      make (Filename.dirname path) ; 
      mkdir path access
    )
  in make path

let root = Filename.dirname (Sys.getcwd ()) 
let www  = Filename.concat root "www"

module Write = struct

  let raw path contents = 
    let path = Filename.concat www path in 
    let ()   = mkdir_ensure (Filename.dirname path) 0o777 in
    let chan = open_out path in 
    output_string chan contents ;
    close_out chan 

  let html path contents = 
    let path = if BatString.ends_with path ".htm" then path else path ^ ".htm" in
    raw path contents

end 

module Read = struct

  let file path = 
    let channel = open_in path in
    let length = in_channel_length channel in
    let string = String.create length in
    let () = really_input channel string 0 length in
    close_in channel ;
    string

  let lines path = 
    BatList.filter_map begin fun str -> 
      let str = BatString.strip str in 
      if str = "" then None else Some str
    end (BatString.nsplit (file path) "\n") 

end
