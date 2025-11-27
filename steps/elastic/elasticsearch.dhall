let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  λ(args : { stack-version : Text, nodes : Optional Natural }) →
      let nodes-vars =
            merge
              { None = [] : List { mapKey : Text, mapValue : Text }
              , Some = λ(nodes : Natural) → toMap { nodes = Natural/show nodes }
              }
              args.nodes

      in  Step::{
          , id = None Text
          , name = Some "Runs elasticsearch version ${args.stack-version}"
          , uses = Some "elastic/elastic-github-actions/elasticsearch@master"
          , run = None Text
          , `with` = Some
              (toMap { stack-version = args.stack-version } # nodes-vars)
          }
