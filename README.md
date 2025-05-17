# Dr_Update

A simple script to check for system updates and review log file changes.

## Usage

Run the script directly. Optionally set `LOG_DIR` to change the directory of logs scanned after the update process.

```bash
# Default log directory (/var/log)
./update_checkup.sh

# Custom log directory
LOG_DIR=/path/to/logs ./update_checkup.sh
```

## Testing

This repository includes a Bats test to verify basic functionality. Ensure [Bats](https://bats-core.readthedocs.io/) is installed on your system before running the test:

```bash
bats test/update_checkup.bats
```

