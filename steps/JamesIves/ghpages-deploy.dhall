let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

let AuthSchema =
      ./AuthSchema.dhall
        sha256:d7db887a6d0c63cb42f8d0915fd5484791afa213192b5f12525fef25c42cf521

let Options =
      ./Options.dhall
        sha256:966916e1bc2898c2156a22783cbbb2c65e75ac2384c24cc768f6a12862f1c9bf

let auth =
      λ(authSchema : AuthSchema) →
        merge
          { accessToken = toMap
              { ACCESS_TOKEN = "\${{ secrets.ACCESS_TOKEN }}" }
          , githubToken = toMap
              { GITHUB_TOKEN = "\${{ secrets.GITHUB_TOKEN }}" }
          , ssh = toMap { SSH = "true" }
          }
          authSchema

let R = List { mapKey : Text, mapValue : Text }

let opts =
      λ(options : Options) →
        merge { None = [] : R, Some = λ(xs : R) → xs } options

in  λ ( args
      : { authSchema : AuthSchema
        , branch : Text
        , folder : Text
        , opts : Options
        }
      ) →
      Step::{
      , id = None Text
      , name = Some "Deploy 🚀"
      , uses = Some "JamesIves/github-pages-deploy-action@3.5.3"
      , run = None Text
      , `with` = Some
          (   toMap { BRANCH = args.branch, FOLDER = args.folder }
            # auth args.authSchema
            # opts args.opts
          )
      }
