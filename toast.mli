(* -------------------------------------------------------------------------- *)
(* Binding to toast object *)
class toast : Ojs.t ->
  object
    inherit Ojs.obj
    method show_short_top       : string -> unit
    method show_short_center    : string -> unit
    method show_short_bottom    : string -> unit
    method show_long_top        : string -> unit
    method show_long_center     : string -> unit
    method show_long_bottom     : string -> unit
    method hide                 : unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> toast
[@@js.get "window.plugins.toast"]
(* -------------------------------------------------------------------------- *)
