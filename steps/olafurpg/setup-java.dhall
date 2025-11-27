let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  λ(args : { java-version : Text }) →
      Step::{
      , id = None Text
      , name = Some "java ${args.java-version} setup"
      , uses = Some "olafurpg/setup-java@v6"
      , run = None Text
      , `with` = Some (toMap { java-version = args.java-version })
      }
