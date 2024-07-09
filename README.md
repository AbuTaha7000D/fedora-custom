# fedora-custom: Enhance Your Fedora Experience

This repository offers a collection of scripts and customizations to make your Fedora Linux experience more efficient, stylish, and tailored to your preferences.

## Why Customize Fedora?

Fedora is a powerhouse of a Linux distribution, known for its bleeding-edge software and flexibility. This repo empowers you to:

- **Streamline Your Workflow:** Make your shell more efficient with helpful aliases and commands.
- **Boost Productivity:** Save time with convenient shortcuts and automations.
- **Personalize Your System:** Give Fedora a unique and visually appealing boot experience.

## What's Inside?

- **`install.sh`:** This is the heart of the repository. It's a shell script that automatically sets up the customizations for you.
- **`additional_files/`:** This directory contains the files that are used by `install.sh` to enhance your Fedora environment.
  - **`add_to_bashrc`:** A Bash script that adds aliases and commands to your `.bashrc` file for a more streamlined shell.
  - **`add_to_grub`:** Configuration tweaks for GRUB2, the bootloader, to customize boot behavior and appearance.
  - **`fedora/` directory:** A visually appealing custom GRUB2 theme for a more stylish boot experience.

## Getting Started

1. **Clone the repository:**

```bash
git clone https://github.com/AbuTaha7000D/fedora-custom.git
```

2. **Run the installation script:**

```bash
cd fedora-custom && sudo ./install.sh
```

**This script will:**

- Install necessary packages for the customizations.
- Apply the `add_to_bashrc` script.
- Customize your GRUB menu settings.
- Apply the custom `fedora` GRUB theme.

**Reboot your system:** `systemctl reboot`

## Using the Customizations

Once you've run the `install.sh` script, you'll have a range of convenient aliases at your fingertips:

- **`supdate`:** Updates and upgrades your Fedora system with a single command.
- **`edge`:** Opens Microsoft Edge (requires Flatpak).
- **`chrome`:** Opens Google Chrome (requires Flatpak).
- **`ff`:** Runs `fastfetch` for system information.
- **`snano`:** Opens `nano` editor with root privileges.
- **`refresh`:** Reloads your `.bashrc` file for immediate alias and function updates.
- **`update-grub`:** Updates your GRUB configuration.
- **`dnf`:** A shortcut for `sudo dnf`.

## Explore Fedora

- **GNOME Desktop:** Fedora's default desktop environment is GNOME, known for its intuitive interface and powerful features.
- **Terminal:** Provides access to the command line for managing your system and running applications.
- **Software Center:** Install and manage applications easily.

## Resources

- **Fedora Project:** [https://fedoraproject.org/](https://fedoraproject.org/)
- **Fedora Documentation:** [https://docs.fedoraproject.org/](https://docs.fedoraproject.org/)
- **Fedora Wiki:** [https://fedoraproject.org/wiki/](https://fedoraproject.org/wiki/)

## Contributing

Contributions are always welcome!

1. **Fork this repository.**
2. **Make changes.**
3. **Create a pull request.**
