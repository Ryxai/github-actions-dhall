let Strategy =
      ../types/Strategy.dhall
        sha256:060bf27380c527f136c2c86ba1cf1f7cab6ad3dd339e655db0873cc8068b7b9d

let Env =
      ../types/Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

in  { env = None Env
    , id = None Text
    , name = None Text
    , shell = None Text
    , run = None Text
    , uses = None Text
    , continue-on-error = None Bool
    , `with` = None (List { mapKey : Text, mapValue : Text })
    , strategy = None Strategy
    , `if` = None Text
    , working-directory = None Text
    , timeout-minutes = None Natural
    }
