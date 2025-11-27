let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  Step::{
    , id = None Text
    , name = None Text
    , uses = Some "olafurpg/setup-gpg@v2"
    , run = None Text
    , `with` = None (List { mapKey : Text, mapValue : Text })
    }
