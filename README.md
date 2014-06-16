ISSoundAdditions
================

NSSound category to read and modify system volume effortlessly.

GOAL
This is a category of NSSound build using CoreAudio to get and set the volume of the
system sound and some other utility.
It was implemented using the Apple documentation and various unattributed code fragments
found on the net. For this reason, its use is free for all.
 
USE
To maintain the Cocoa conventions, a property-like syntax was used; the following
methods ("properties") are available:
 
  (float)systemVolume			            - return the volume of the default sound device
	setSystemVolume(float)			        - set the volume of the default sound device
	(AudioDeviceID)defaultOutput Device	- return the default output device
	applyMute(boolean)			            - enable or disable muting, if supported
 
REQUIREMENTS
At least MacOS X 10.6
Core Audio Framework
