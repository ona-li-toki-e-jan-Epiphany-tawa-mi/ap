# This file is part of ap.
#
# Copyright (c) 2024 ona-li-toki-e-jan-Epiphany-tawa-mi
#
# ap is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# ap is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# ap. If not, see <https://www.gnu.org/licenses/>.

# This file defines the confiurable options for ap. All values in this attrset
# are made avalible via the imports in the NixOS modules.

# release.nix for telling Hydra CI how to build the project.
#
# You can use the following command to build this/these derivation(s):
#   nix-build release.nix -A <attribute>

{ nixpkgs ? builtins.fetchTarball "https://github.com/NixOS/nixpkgs/tarball/23.11" }:

let pkgs = (import nixpkgs {});

    name = "ap";
    src  = ./.;
in
{
  # Makes tarballs of the source code.
  sourceTarball = pkgs.stdenv.mkDerivation {
    # No need to actually build the project.
    dontBuild   = true;
    dontInstall = true;

    inherit name;

    inherit src;

    doDist    = true;
    distPhase = ''
      runHook preDist

      mkdir -p $out/tarballs
      find -type f \! -path './.git' \! -path './.git/*' | sed 's|^\./||' | tar -T - -cavf $out/tarballs/${name}-source-dist.tar.xz

      runHook postDist
    '';

    postPhases = "finalPhase";
    finalPhase = ''
      mkdir -p $out/nix-support
      for i in $out/tarballs/*; do
          echo "file source-dist $i" >> $out/nix-support/hydra-build-products
      done
    '';
  };
}
