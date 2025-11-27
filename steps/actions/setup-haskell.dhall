let List/concatMap =
      https://prelude.dhall-lang.org/v17.1.0/List/concatMap.dhall
        sha256:3b2167061d11fda1e4f6de0522cbe83e0d5ac4ef5ddf6bb0b2064470c5d3fb64

let Map =
      https://prelude.dhall-lang.org/v17.1.0/Map/package.dhall
        sha256:598e9c76103b2686fbbda6cc30078f9e60dd846d9eaf155d0149cf0ae06c21c5

let Optional/map =
      https://prelude.dhall-lang.org/v17.1.0/Optional/map.dhall
        sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

let HaskellSetup =
      ../../schemas/actions/HaskellSetup.dhall
        sha256:e6dbbacedf33965f5005dc2a22164d0a5edb3e09b2b4842104cec011c6d3c95d

let stringBool =
      Optional/map Bool Text (λ(b : Bool) → if b then "true" else "false")

let haskell-setup
    : HaskellSetup.Type → Step.Type
    = λ(args : HaskellSetup.Type) →
        Step::{
        , uses = Some "haskell/actions/setup@v1"
        , `with` = Some
            ( List/concatMap
                (Map.Entry Text (Optional Text))
                (Map.Entry Text Text)
                ( λ(e : Map.Entry Text (Optional Text)) →
                    merge
                      { None = [] : Map.Type Text Text
                      , Some = λ(v : Text) → [ Map.keyText e.mapKey v ]
                      }
                      e.mapValue
                )
                ( toMap
                    { ghc-version = args.ghc-version
                    , cabal-version = args.cabal-version
                    , stack-version = args.stack-version
                    , enable-stack = stringBool args.enable-stack
                    , stack-no-global = stringBool args.stack-no-global
                    , stack-setup-ghc = stringBool args.stack-setup-ghc
                    , disable-matcher = stringBool args.disable-matcher
                    }
                )
            )
        }

in  haskell-setup
