#!/bin/bash

cp com.ngrok.onstartup.plist /Library/LaunchDaemons/com.ngrok.onstartup.plist
launchctl load /Library/LaunchDaemons/com.ngrok.onstartup.plist
launchctl list com.ngrok.onstartup.plist

