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

let Checkout =
      ../../schemas/actions/Checkout.dhall
        sha256:d9c339bf138755db638c58f18d91dcd40a49f5905064af111b1b56d8eec57c5a

let stringBool =
      Optional/map Bool Text (λ(b : Bool) → if b then "true" else "false")

let stringNatural = Optional/map Natural Text (λ(n : Natural) → Natural/show n)

let checkout
    : Checkout.Type → Step.Type
    = λ(args : Checkout.Type) →
        Step::{
        , uses = Some "actions/checkout@v4"
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
                    { repository = args.repository
                    , ref = args.ref
                    , token = args.token
                    , ssh-key = args.ssh-key
                    , ssh-known-hosts = args.ssh-known-hosts
                    , ssh-strict = stringBool args.ssh-strict
                    , ssh-user = args.ssh-user
                    , persist-credentials = stringBool args.persist-credentials
                    , path = args.path
                    , clean = stringBool args.clean
                    , filter = args.filter
                    , sparse-checkout = args.sparse-checkout
                    , sparse-checkout-cone-mode =
                        stringBool args.sparse-checkout-cone-mode
                    , fetch-depth = stringNatural args.fetch-depth
                    , fetch-tags = stringBool args.fetch-tags
                    , show-progress = stringBool args.show-progress
                    , lfs = stringBool args.lfs
                    , submodules = args.submodules
                    , set-safe-directory = stringBool args.set-safe-directory
                    , github-server-url = args.github-server-url
                    }
                )
            )
        }

in  checkout
