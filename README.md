# Automatic Linux Update

## Description
This script is designed to automatically update your Linux-based system, with a particular focus on POP_OS! It streamlines the update process by executing several essential maintenance tasks in one go.

## Features
- APT Update: Refreshes the package list to get information on the newest versions of packages and their dependencies.
- APT Upgrade: Installs the newest versions of all packages currently installed on the system.
- APT Autoremove: Removes packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed.
- Flatpak Update: Updates all installed Flatpak applications.
- Recovery Partition Update: Updates the system's recovery partition.

## Requirements
- A Linux-based system (optimized for POP_OS!)
- Sudo privileges

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/bcore-arch/pop-updater.git```
