let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  λ(args : { name : Text, who-to-greet : Text }) →
      Step::{
      , name = Some args.name
      , uses = Some "actions/hello-world-javascript-action@v1"
      , `with` = Some (toMap { who-to-greet = args.who-to-greet })
      }
