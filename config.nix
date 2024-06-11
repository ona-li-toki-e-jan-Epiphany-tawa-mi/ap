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

{
  # Basic device configuration.
  hostName = "";
  timeZone = "";

  # The amount of disk space to allocate for swap in GiB. Set to null to
  # disable.
  swapSpace = null;



  # Access point network settings.
  ssid     = "";
  password = "";

  # Access point network interface for accessing the internet.
  internetInterface = "";

  # Access point network interface device to accept client connections from
  # (must be a Wi-Fi interface.)
  wifiInterface = "";

  # The mode to set for the interface MAC addresses. See
  # networking.networkmanager.wifi.macAddress or
  # networking.networkmanager.ethernet.macAddress for details.
  macAddressMode = "";



  # Admin user account configuration.
  adminUserName = "";
  adminSSHKeys  = [];

  # The intial (or permanent, if you don't change it via passwd later) password
  # for your user account. Use mkpasswd to generate a password hash.
  adminInitialHashedPassword = "";
}
