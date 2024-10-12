# watcher: Simple Terminal Video Player with `mpv`

This script provides a convenient way to play video files directly in your terminal using `mpv`. It automatically detects your operating system and package manager, offers to install `mpv` if it's not already present, and provides a streamlined fullscreen playback experience.

## Features

* **Automatic `mpv` Installation:**  If `mpv` is not found, the script will prompt you to install it using your system's package manager (apt, pacman, dnf, yum, zypper, or brew).
* **Fullscreen Playback:** Plays videos in fullscreen mode with no borders.
* **Looping:** Videos loop by default.
* **Customizable Controls:**  Default `mpv` keybindings are disabled, allowing you to create your own custom controls (see `mpv` documentation for creating an `input.conf` file).
* **Simplified OSC:** The on-screen controller is simplified for a cleaner look.

## Prerequisites

* A terminal emulator.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/robinhirst11/watcher.git
   ```
2. **Make the script executable:**
   ```bash
   chmod +x watcher/watcher.sh
   ```

## Usage

```bash
./watcher/watcher.sh <video_file>
```

**Example:**

```bash
[robin@USSEnterprise ~]$ ./watcher/watcher.sh video.mp4 
```

## Supported Operating Systems and Package Managers

* **Linux:** apt, pacman, dnf, yum, zypper
* **macOS:** brew

If your package manager is not automatically detected, you will be prompted to install `mpv` manually.
## Contributing

Contributions are welcome!  Please submit pull requests or open issues for any bugs or feature requests.
