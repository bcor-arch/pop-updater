# Automatic Linux Updat

![_5230c455-6cd2-4ecb-8664-a473e54794f4](https://github.com/bcor-arch/pop-updater/assets/171504632/cf39abc8-0edf-409d-8436-ddb08d574b7d)

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
   git clone https://github.com/bcor-arch/pop-update.git
   ```
2. Navigate to the script directory:
   ```bash
   cd automatic-linux-update
   ```
3. Make the script executable:
   ```bash
   chmod +x update.sh
   ```
4. Move the script to a directory in your PATH (e.g., `/usr/local/bin`):
   ```bash
   sudo mv update.sh /usr/local/bin/update
   ```

## Usage
### Terminal Command
1. Open a new terminal.
2. Run the update command:
   ```bash
   update
   ```
3. Authenticate as a sudo user when prompted.
4. The script will perform the following steps:
   1. APT Update
   2. APT Upgrade
   3. APT Autoremove
   4. Flatpak Update
   5. Recovery Partition Update

### Bash Alias
1. Add the following function to your `~/.bash_aliases` file:
   ```bash
   update() {

       # Function to check if the command execution was successful
       check_success() {
           if [ $? -ne 0 ]; then
               echo "Error: $1 failed."
               say "Error: $1 failed."
           else
               echo "$1 completed successfully."
               say "$1 completed successfully."
           fi
       }

       # Display a cool message
       echo "I'm the Updater! Please verify your admin privileges with your sudo password."
       say  "Warning! Level 10 security privileges required to run Updater." && \

       # Run update commands one after the other
       sudo apt update && \
       check_success "APT update" && \

       sudo apt upgrade -y && \
       check_success "APT upgrade" && \

       sudo apt autoremove && \
       check_success "APT autoremove" && \

       flatpak update -y && \
       check_success "Flatpak update" && \

       sudo pop-upgrade recovery upgrade from-release && \
       check_success "Recovery Partition Update" && \

       # Check if script is running with sudo
       if [ "$EUID" -ne 0 ]; then
           echo "Please run as root or using sudo."
           say "Please run as root or using sudo."
           return
       }

       # Output a final message
       echo "===> System Update Completed."
       say "Full System Update has been completed."
   }
   ```
2. Source the `~/.bash_aliases` file to apply the changes:
   ```bash
   source ~/.bash_aliases
   ```
3. Open a new terminal and run the update function:
   ```bash
   update
   ```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
