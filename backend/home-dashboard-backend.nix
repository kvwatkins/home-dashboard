{ mkDerivation, base, lib }:
mkDerivation {
  pname = "home-dashboard-backend";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = lib.licenses.mit;
}
