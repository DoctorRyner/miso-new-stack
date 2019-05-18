# miso-new-stack

It doesn't work yet, It was created as an example for issue, checkout https://github.com/DoctorRyner/miso-template, especially cabal-example branch for a working configuration

install ghcjs globaly, for example, you can use nix

``bash
nix-channel --add https://nixos.org/channels/nixos-19.03 nixos
nix-channel --update
nix-env -f channel:nixos-19.03 -iA haskell.compiler.ghcjs
```

stack build --stack-yaml=stack-ghcjs.yaml
