structure Futures =
struct

open CML
	 
fun hello () =
  let val c : string chan = channel ()
  in
      spawn (fn () => TextIO.print (recv c));
      send (c, "hello, world\n");
      exit ()
  end

fun f () =
  RunCML.doit (fn () => ignore (spawn hello), NONE)
end
