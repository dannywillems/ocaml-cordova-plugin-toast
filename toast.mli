class styling_toast : Ojs.t ->
  object
    inherit Ojs.obj
    method opacity              : float
    method background_color     : string
    method text_color           : string
    method corner_radius        : int
    method horizontal_padding   : int
    method vertical_padding     : int
  end

val create_styling_toast :
  ?opacity:(float [@js.default 0.8])                  ->
  ?background_color:(string [@js.default "#333333"])  ->
  ?text_color:(string [@js.default "#FFFFFF"])        ->
  (* Need to have the cordova plugin to change the default value depending on
   * the platform.*)
  ?corner_radius:int                                  ->
  (* Need to have the cordova plugin to change the default value depending on
   * the platform.*)
  ?horizontal_padding:int                             ->
  (* Need to have the cordova plugin to change the default value depending on
   * the platform.*)
  ?vertical_padding:int                               ->
  unit                                                ->
  styling_toast
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* -------------------- *)
type duration =
  | Short [@js "short"]
  | Long [@js "long"]
  [@@js.enum]

[@@@js.stop]
val short : duration
val long  : duration
[@@@js.start]

[@@@js.implem
let short = Short
let long  = Long
]
(* -------------------- *)

(* -------------------- *)
type position =
  | Bottom [@js "bottom"]
  | Center [@js "center"]
  | Long   [@js "long"]
  [@@js.enum]

[@@@js.stop]
val bottom  : position
val center  : position
val long    : position
[@@@js.start]

[@@@js.implem
let bottom  = Bottom
let center  = Center
let long    = Long
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class options : Ojs.t ->
  object
    inherit Ojs.obj
    method message              : string
    method duration             : string
    method position             : string
    method add_pixels_y         : int
  end

val create_options :
  ?message:(string [@js.default ""])        ->
  ?duration:(duration [@js.default Long])   ->
  ?position:(position [@js.default Bottom]) ->
  ?add_pixels_y:int                         ->
  unit                                      ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Binding to toast object *)
class toast : Ojs.t ->
  object
    inherit Ojs.obj
    (* ---------------------------------------------------------------------- *)
    method show_short_top       : string -> unit
    method show_short_top_cb    : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showShortTop"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method show_short_center    : string -> unit
    method show_short_center_cb : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showShortCenter"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method show_short_bottom    : string -> unit
    method show_short_bottom_cb : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showShortBottom"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method show_long_top        : string -> unit
    method show_long_top_cb     : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showLongTop"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method show_long_center     : string -> unit
    method show_long_center_cb  : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showLongCenter"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method show_long_bottom     : string -> unit
    method show_long_bottom_cb  : string          -> (* message *)
                                  (unit -> unit)  -> (* success_cb *)
                                  (unit -> unit)  -> (* error_cb *)
                                  unit
    [@@js.call "showLongBottom"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    method hide                 : unit
    (* ---------------------------------------------------------------------- *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> toast
[@@js.get "window.plugins.toast"]
(* -------------------------------------------------------------------------- *)
