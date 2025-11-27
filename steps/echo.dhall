let run =
      ./run.dhall
        sha256:1ed6d8f02429df6620ffa02b3118aebb08f1473413ea1f8cea1fedddf23296fe

in  λ(args : { name : Text, what : Text }) →
        run { run = "echo ${args.what}" }
      ⫽ { id = None Text, name = Some args.name }
