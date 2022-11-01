# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Functions
thinkpad_safecharge() {
  echo 40 | sudo tee /sys/class/power_supply/BAT?/charge_start_threshold
  echo 50 | sudo tee /sys/class/power_supply/BAT?/charge_stop_threshold
}

thinkpad_fullcharge() {
  echo 80 | sudo tee /sys/class/power_supply/BAT?/charge_start_threshold
  echo 100 | sudo tee /sys/class/power_supply/BAT?/charge_stop_threshold
}
