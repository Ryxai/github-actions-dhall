{ inputs :
    Optional
      ( List
          { mapKey : Text
          , mapValue :
              ../Input.dhall
                sha256:03df056682410688325a8cca24cd3c167b2db0a1b87596450de5638ffaa68b2c
          }
      )
, outputs :
    Optional
      ( List
          { mapKey : Text
          , mapValue :
              ../Output.dhall
                sha256:4c7baccef8bd151904013c18b9cb539944019e8d85c2cb53c89d01988cde052c
          }
      )
, secrets :
    Optional
      ( List
          { mapKey : Text
          , mapValue :
              ../Secret.dhall
                sha256:8db70cb6694b1748740dd506ebb8e35af3baa01cf3e1b7883dbac2637703c081
          }
      )
}
