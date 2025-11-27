let Credentials =
      ../types/Credentials.dhall
        sha256:32e5e57c1f6d54f9814d9b7b806923f2ba80374d3ff0596adbd400c420d7dafd

let Env =
      ../types/Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

in  { credentials = None Credentials
    , env = None Env
    , ports = None (List Text)
    , volumes = None (List Text)
    , options = None Text
    }
