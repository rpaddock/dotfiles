# Show/Hide hidden files in finder
function showall() {
  defaults write com.apple.finder AppleShowAllFiles -bool YES
  killall Finder
}

function hideall() {
  defaults write com.apple.finder AppleShowAllFiles -bool NO
  killall Finder
}

