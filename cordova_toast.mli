type styling_toast = private Ojs.t

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
(* -------------------- *)

(* -------------------- *)
type position =
  | Bottom [@js "bottom"]
  | Center [@js "center"]
  | Long   [@js "long"]
  [@@js.enum]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type options = private Ojs.t

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
(* ---------------------------------------------------------------------- *)
val show_short_top :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showShortTop"]

val show_short_center :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showShortCenter"]

val show_short_bottom :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showShortBottom"]

val show_long_top :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showShortTop"]

val show_long_center :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showShortTop"]

val show_long_bottom :
  string                                                -> (* message *)
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showLongBottom"]

val show_with_options :
  ?options:(options [@js.default create_options ()])    ->
  ?succ_cb:((unit -> unit) [@js.default fun () -> ()])  -> (* success_cb *)
  ?error_cb:((unit -> unit) [@js.default fun () -> ()]) -> (* error_cb *)
  unit                                                  ->
  unit
[@@js.global "window.plugins.toast.showWithOptions"]

val hide : unit -> unit
[@@js.global "window.plugins.toast.hide"]
(* -------------------------------------------------------------------------- *)
