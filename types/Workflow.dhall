let On =
      ./On.dhall
        sha256:72fbd13d4345c106ea4dcaea1e90886f87132165c9203ffcf4a230c216ddb754

let Env =
      ./Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

let Concurrency =
      ./Concurrency.dhall
        sha256:76a98598b0b13d496c062d301b27c82059be340aae993285c6b345ec494a4913

let Defaults =
      ./Defaults.dhall
        sha256:a2963761aaa06bae9abd5575667afbba6539d8ce694a4a82900bf4f9df2e7932

let Job =
      ./Job.dhall
        sha256:3c2dcde4757d50d1e834c41af37386249f22a201bc5686ea17d583be3cc05ffa

let Permission =
      ./Permission.dhall
        sha256:b2a2f093af7412e34040a806e226ee4e7d691bd18df5c46bbfcc7cd222a37a2d

let PermissionAccess =
      ./PermissionAccess.dhall
        sha256:50f036b7dc434a4b2e7e847943fe5c31846bf38ec1795de8baafe76cfe6382b6

in  { name : Text
    , on : On
    , env : Optional Env
    , concurrency : Optional Concurrency
    , defaults : Optional Defaults
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , jobs : List { mapKey : Text, mapValue : Job }
    }
