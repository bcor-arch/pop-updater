
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
    check_success "Recovery Partion Updated!" && \
    
    
    # Check if script is running with sudo
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root or using sudo."
        say "Please run as root or using sudo."
        return
    fi
    

    

    
    
    # Output a final message
    echo "===> System Update Completed."
    say "Full System Update has been completed."
    
    }
