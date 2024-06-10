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

# Networking code.
#
# NOTE: make sure to set services.create_ap.settings.INTERNET_IFACE and
# services.create_ap.settings.INTERNET_IFACE.
# NOTE: you will have to create a file called "ap-password.nix" in the base of
# this project with the password for the access point.

{ hostName
, apSSID
, ...
}:

{
  imports = [ ./ssh.nix
              ./epiphany.nix
            ];



  networking.hostName = hostName;

  # Network Manager is used to set the network to be an access point for.
  networking.networkmanager = {
    enable = true;

    # MAC address randomization because why not.
    ethernet.macAddress = "random";
    wifi.macAddress     = "random";
  };

  # Core functionality.
  services.create_ap = {
    enable   = true;
    settings = {
      "SSID"       = apSSID;
      "PASSPHRASE" = import ../ap-password.nix;
    };
  };
}
