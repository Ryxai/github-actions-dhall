let Step =
      ../../schemas/Step.dhall
        sha256:7e0c2877e2ee3d57de46c1bf631d36f3d0ff636f73514233dbed3f100d2530ce

in  Step::{
    , id = None Text
    , name = Some "Publish \${{ github.ref }}"
    , uses = None Text
    , run = Some "sbt ci-release"
    , env = Some
        ( toMap
            { PGP_PASSPHRASE = "\${{ secrets.PGP_PASSPHRASE }}"
            , PGP_SECRET = "\${{ secrets.PGP_SECRET }}"
            , SONATYPE_PASSWORD = "\${{ secrets.SONATYPE_PASSWORD }}"
            , SONATYPE_USERNAME = "\${{ secrets.SONATYPE_USERNAME }}"
            }
        )
    }
