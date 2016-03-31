# ocaml-cordova-plugin-toast

Binding in OCaml to [EddyVerbrugen Toast
plugin](https://github.com/EddyVerbruggen/Toast-PhoneGap-Plugin) using js_of_ocaml.

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-toast-example)

## What does the toast plugin do ?

```
This plugin allows you to show a native Toast (a little text popup) on iOS,
Android and WP8. It's great for showing a non intrusive native notification
which is guaranteed always in the viewport of the browser.
```

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the tags
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-toast/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to use it ?

TODO

## ! BE CAREFUL !

The device plugin creates a new object called *window.plugins.toast*, but the object is
available when the *deviceready* event is handled.

We provide a function *Toast.t* of type unit -> Toast.toast.

You need to get the return value of this function in the *deviceready*
event handler.
So, use (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let t = Toast.t () in
  (* Some code *)
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```

