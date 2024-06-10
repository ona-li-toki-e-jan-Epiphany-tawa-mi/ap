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

# Creates my user account for administration.

{ ... }:

{
  users.users."epiphany" = {
    isNormalUser          = true;
    description           = "jan Epiphany";
    initialHashedPassword = "$y$j9T$tPqkwxEzz/qTTg4abhY08.$Zfus24pugl2Th/.EImtasVU51x39TgmSY86uKpTzv2D";
    extraGroups           = [ "wheel" ];

    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDGAY/OkxpxpW3uFP2i4PrE43fH1KqJHGqACMVVkRKMR epiphany@godsthirdtemple" ];
  };

  services.openssh.settings."AllowUsers" = [ "epiphany" ];

  # Makes my user a trusted user for remote rebuilding.
  nix.settings.trusted-users = [ "epiphany" ];
}
