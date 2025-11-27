let Env =
      ./Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

let Strategy =
      ./Strategy.dhall
        sha256:060bf27380c527f136c2c86ba1cf1f7cab6ad3dd339e655db0873cc8068b7b9d

in  { id : Optional Text
    , name : Optional Text
    , env : Optional Env
    , run : Optional Text
    , uses : Optional Text
    , shell : Optional Text
    , `with` : Optional (List { mapKey : Text, mapValue : Text })
    , continue-on-error : Optional Bool
    , strategy : Optional Strategy
    , `if` : Optional Text
    , working-directory : Optional Text
    , timeout-minutes : Optional Natural
    }
