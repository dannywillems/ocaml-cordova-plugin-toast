# ocaml-cordova-plugin-toast

Binding in OCaml to [EddyVerbrugen Toast
plugin](https://github.com/EddyVerbruggen/Toast-PhoneGap-Plugin) using js_of_ocaml.

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-toast)

## What does the toast plugin do ?

```
This plugin allows you to show a native Toast (a little text popup) on iOS,
Android and WP8. It's great for showing a non intrusive native notification
which is guaranteed always in the viewport of the browser.
```

## ! BE CAREFUL !

The device plugin creates a new object called *window.plugins.toast*, but the object is
available when the *deviceready* event is handled.

We don't provide a *window.plugins.toast* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *window.plugins.toast* will be set to **undefined**
because the *window.plugins.toast* object doesn't exist when we create the variable.

Instead of that, we provide a **function** of type unit -> Toast.toast Js.t,
name *toast*.

You need to get the return value of this function in the *deviceready*
event handler.
So, use

```OCaml
let on_device_ready =
  let t = Toast.toast () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
