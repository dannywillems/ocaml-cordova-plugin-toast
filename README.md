# ocaml-cordova-plugin-toast

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-toast.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-toast)

Binding in OCaml to [EddyVerbrugen Cordova_toast
plugin](https://github.com/EddyVerbruggen/Cordova_toast-PhoneGap-Plugin).

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-toast-example)

## What does the toast plugin do ?

```
This plugin allows you to show a native Cordova_toast (a little text popup) on iOS,
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

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0+beta1
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-toast https://github.com/dannywillems/ocaml-cordova-plugin-toast.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-toast [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin toast with
```Shell
cordova plugin add cordova-plugin-x-toast
```


## How to use it ?

See the official documentation:
[EddyVerbrugen Cordova_toast plugin](https://github.com/EddyVerbruggen/Cordova_toast-PhoneGap-Plugin)
## ! BE CAREFUL !

The device plugin creates a new object called *window.plugins.toast*, but the object is
available when the *deviceready* event is handled.

We provide a function *Cordova_toast.t* of type unit -> Cordova_toast.toast.

You need to get the return value of this function in the *deviceready*
event handler.
So, use (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let t = Cordova_toast.t () in
  (* Some code *)
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```

