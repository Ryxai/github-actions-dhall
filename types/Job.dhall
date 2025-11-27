let Concurrency =
      ./Concurrency.dhall
        sha256:76a98598b0b13d496c062d301b27c82059be340aae993285c6b345ec494a4913

let Container =
      ./Container.dhall
        sha256:5a34665083d530f74f272ccd1de39e5be731d0b14ea4114dcccb35e56eadc37d

let Defaults =
      ./Defaults.dhall
        sha256:a2963761aaa06bae9abd5575667afbba6539d8ce694a4a82900bf4f9df2e7932

let Env =
      ./Env.dhall
        sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6

let JobEnv =
      ./JobEnv.dhall
        sha256:521e86d74ae30cec88804eb9fa8014510297c9cf6b4b412d1576df31ed72dc6f

let RunsOn =
      ./RunsOn.dhall
        sha256:17864110f3cc91183c178f8218967c500f3493391e5327740dd1f19c74eb6ee2

let Service =
      ./Service.dhall
        sha256:c957b80c6a0d53dce7bf05921c1983797b5d52958ded76244cd94ae80deb94e5

let Step =
      ./Step.dhall
        sha256:c2efe65fd3b819521612000af9ebee52e7a74cce4c37de891dcdc7d6c25169fa

let Strategy =
      ./Strategy.dhall
        sha256:060bf27380c527f136c2c86ba1cf1f7cab6ad3dd339e655db0873cc8068b7b9d

let Permission =
      ./Permission.dhall
        sha256:b2a2f093af7412e34040a806e226ee4e7d691bd18df5c46bbfcc7cd222a37a2d

let PermissionAccess =
      ./PermissionAccess.dhall
        sha256:50f036b7dc434a4b2e7e847943fe5c31846bf38ec1795de8baafe76cfe6382b6

let ContinueOnError =
      ./ContinueOnError.dhall
        sha256:83ad8f8eea100277b6658ac27c590d6ee43df14e4d1fc49a55c691e1033fd3e9

in  { name : Optional Text
    , needs : Optional (List Text)
    , continue-on-error : Optional ContinueOnError
    , runs-on : RunsOn
    , environment : Optional JobEnv
    , strategy : Optional Strategy
    , outputs : Optional (List { mapKey : Text, mapValue : Text })
    , env : Optional Env
    , defaults : Optional Defaults
    , steps : List Step
    , timeout-minutes : Optional Natural
    , `if` : Optional Text
    , services : Optional (List { mapKey : Text, mapValue : Service })
    , container : Optional Container
    , concurrency : Optional Concurrency
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , secrets : Optional (List { mapKey : Text, mapValue : Text })
    }
