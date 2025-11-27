let Concurrency =
      ../types/Concurrency.dhall
        sha256:76a98598b0b13d496c062d301b27c82059be340aae993285c6b345ec494a4913

let Container =
      ../types/Container.dhall
        sha256:5a34665083d530f74f272ccd1de39e5be731d0b14ea4114dcccb35e56eadc37d

let Defaults =
      ../types/Defaults.dhall
        sha256:a2963761aaa06bae9abd5575667afbba6539d8ce694a4a82900bf4f9df2e7932

let Env =
      ../types/Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

let JobEnv =
      ../types/JobEnv.dhall
        sha256:521e86d74ae30cec88804eb9fa8014510297c9cf6b4b412d1576df31ed72dc6f

let Service =
      ../types/Service.dhall
        sha256:c957b80c6a0d53dce7bf05921c1983797b5d52958ded76244cd94ae80deb94e5

let Strategy =
      ../types/Strategy.dhall
        sha256:060bf27380c527f136c2c86ba1cf1f7cab6ad3dd339e655db0873cc8068b7b9d

let Permission =
      ../types/Permission.dhall
        sha256:b2a2f093af7412e34040a806e226ee4e7d691bd18df5c46bbfcc7cd222a37a2d

let PermissionAccess =
      ../types/PermissionAccess.dhall
        sha256:50f036b7dc434a4b2e7e847943fe5c31846bf38ec1795de8baafe76cfe6382b6

let ContinueOnError =
      ../types/ContinueOnError.dhall
        sha256:83ad8f8eea100277b6658ac27c590d6ee43df14e4d1fc49a55c691e1033fd3e9

in  { name = None Text
    , needs = None (List Text)
    , continue-on-error = None ContinueOnError
    , strategy = None Strategy
    , environment = None JobEnv
    , outputs = None (List { mapKey : Text, mapValue : Text })
    , env = None Env
    , defaults = None Defaults
    , timeout-minutes = None Natural
    , `if` = None Text
    , services = None (List { mapKey : Text, mapValue : Service })
    , container = None Container
    , concurrency = None Concurrency
    , permissions =
        None (List { mapKey : Permission, mapValue : PermissionAccess })
    , secrets = None (List { mapKey : Text, mapValue : Text })
    }
