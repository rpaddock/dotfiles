#!/bin/sh
#
# Slate
#
# https://github.com/jigish/slate

if test ! -d "/Applications/Slate.app"
then
  echo "  Installing Slate for you."

  if test "$(uname)" = "Darwin"
  then
    curl -fsSL https://github.com/jigish/slate/raw/master/build/Release/Slate.dmg --output /tmp/Slate.dmg
    sudo hdiutil attach /tmp/Slate.dmg
    sudo cp -R /Volumes/Slate/Slate.app /Applications
    sudo hdiutil unmount /Volumes/Slate/
    rm /tmp/Slate.dmg
  fi
fi

exit 0
