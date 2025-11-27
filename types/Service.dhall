let Credentials =
      ./Credentials.dhall
        sha256:32e5e57c1f6d54f9814d9b7b806923f2ba80374d3ff0596adbd400c420d7dafd

let Env =
      ./Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

in  { image : Text
    , credentials : Optional Credentials
    , env : Optional Env
    , ports : Optional (List Text)
    , volumes : Optional (List Text)
    , options : Optional Text
    }
