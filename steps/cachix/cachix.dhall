let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  λ(args : { cache-name : Text }) →
      Step::{
      , id = None Text
      , name = None Text
      , uses = Some "cachix/cachix-action@v6"
      , run = None Text
      , `with` = Some
          ( toMap
              { name = args.cache-name
              , signingKey = "\${{ secrets.CACHIX_SIGNING_KEY }}"
              }
          )
      }
