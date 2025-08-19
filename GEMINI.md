# Project Overview

This repository contains Omadora, a comprehensive system for transforming a fresh Fedora 42 installation into a fully-configured, modern web development environment based on Hyprland. It is an opinionated setup that automates the configuration of a wide range of tools and applications, from system-level settings to desktop aesthetics.

The project is primarily composed of shell scripts that handle the installation, configuration, and management of the system. It uses `dnf` for package management.

## Key Features

*   **Automated Installation:** A single `install.sh` script bootstraps the entire system setup.
*   **Comprehensive Configuration:**  Includes configurations for a wide range of tools, including Alacritty, btop, Hyprland, Neovim, and more.
*   **Theming Support:** Provides a robust theming system that allows users to easily switch between different visual styles.
*   **Command-line Tools:** A rich set of `omadora-*` command-line tools are provided to manage the system, including package installation, theme management, and system updates.
*   **Migration System:** Includes a migration system to handle updates and changes to the configuration over time.

# Building and Running

This is not a typical software project with a build process. To "run" the project, you execute the `install.sh` script on a fresh Fedora 42 installation.

**Installation:**

```bash
./install.sh
```

**TODO:** It is not clear from the scripts how to run the project in a development or "dry-run" mode. This would be a useful addition to the documentation.

# Development Conventions

The project is written entirely in Bash. The scripts are well-structured and organized into different directories based on their functionality.

*   **`bin/`:** Contains the `omadora-*` command-line tools that are available to the user.
*   **`config/`:** Contains the configuration files for various applications.
*   **`default/`:** Contains default configuration files that are copied to the user's home directory.
*   **`install/`:** Contains the scripts that are executed during the installation process.
*   **`migrations/`:** Contains the migration scripts that are executed during updates.
*   **`themes/`:** Contains the different themes that can be applied to the system.

The scripts make extensive use of command-line tools like `sed`, `awk`, `grep`, and `gum` for text processing and user interaction.
