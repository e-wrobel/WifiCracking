# WifiCracking
Scripts for testing Wifi security

Prerequisites on Mac OS:

 1. /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 2. brew install aircrack-ng
 3. sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
 
 Remark, when starting point 4 from wifi_crack.sh script, remeber to 
 deactivate any logged user from tested network. You can try to use JamWIFI:
 https://github.com/unixpickle/JamWiFi (unfortunately it hangs Mac OS Mojave during jamming procedure).