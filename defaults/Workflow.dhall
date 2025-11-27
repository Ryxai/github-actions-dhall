let Env =
      ../types/Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

let Defaults =
      ../types/Defaults.dhall
        sha256:a2963761aaa06bae9abd5575667afbba6539d8ce694a4a82900bf4f9df2e7932

let Concurrency =
      ../types/Concurrency.dhall
        sha256:76a98598b0b13d496c062d301b27c82059be340aae993285c6b345ec494a4913

let Permission =
      ../types/Permission.dhall
        sha256:b2a2f093af7412e34040a806e226ee4e7d691bd18df5c46bbfcc7cd222a37a2d

let PermissionAccess =
      ../types/PermissionAccess.dhall
        sha256:50f036b7dc434a4b2e7e847943fe5c31846bf38ec1795de8baafe76cfe6382b6

in  { env = None Env
    , defaults = None Defaults
    , concurrency = None Concurrency
    , permissions =
        None (List { mapKey : Permission, mapValue : PermissionAccess })
    }
