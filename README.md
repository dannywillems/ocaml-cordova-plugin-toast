# ocaml-cordova-plugin-toast

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-toast/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-toast.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-toast)

Binding to [EddyVerbrugen Cordova_toast
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
opam switch 4.03.0
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
