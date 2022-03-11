# ISSoundAdditions

<a href="https://swift.org/package-manager">
  <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
</a>

ISSoundAdditions is a Swift Package for macOS that allows to control the volume of the default output device, as well as muting and unmuting. The entire implementation relies on various CoreAudio calls, but they are exposed in a clean and simple Swift flavor.

## Installation
ISSoundAdditions is available via [Swift Package Manager](https://swift.org/package-manager).

```swift
.package(url: "https://github.com/InerziaSoft/ISSoundAdditions", from: "<see GitHub releases>")
```

### Latest Release
To find out the latest version, look at the Releases tab of this repository.

## Getting Started
All the functions of the library are exposed through the `Sound` class. This class cannot be instantiated, but it provides a structure to access the `output`, which represents the default device using for sound output. This structure also allows for future improvements, such as adding support for `input` devices.

There are two ways to interact with the library: simple mode (via properties) or manual mode (via method calls).

### Simple Mode
If your application doesn't care about errors management and you're just looking for a simple way to change the system volume, mute or unmute, you can interact with the properties offered by the shared instance of `SoundOutputManager`.

```swift
// Retrieve the default output device
let deviceID = Sound.output.defaultOutputDevice

// Get the current volume
let currentVolume = Sound.output.volume
// Set the volume (values between 0 and 1)
Sound.output.volume = 0.7

// Get the mute property value
let isMuted = Sound.output.isMuted
// Mute or unmute
Sound.output.isMuted = true
Sound.output.isMuted = false
```

When interacting with these properties, all errors will be ignored. _When running in Debug mode, you will still be able to see some of the errors, as CoreAudio logs them to the console._

#### Goodies
This library also provides some additional methods that interact with the properties shown above.

```swift
// Increase the volume by a given amount
Sound.output.increaseVolume(by: 0.2)
// Decrease the volume by a given amount
Sound.output.decreaseVolume(by: 0.2)

// Set the volume and, optionally,
// automatically mutes or unmutes if the resulting volume
// is below or above the given threshold (which defaults to 0.005).
// The `autoMuteUnmute` parameter can also be used on the other
// two methods above.
Sound.output.setVolume(0, autoMuteUnmute: true)
```

### Manual Mode
A lot of things can go wrong when trying to manipulate the system volume, muting, unmuting and even when getting the current default output device. If you're interested in intercepting these errors, you can call the methods provided by the shared instance of `SoundOutputManager`.

```swift
// Retrieve the default output device
// Returns `nil` if no device is set or throws if an error occurs.
let deviceID = try Sound.output.retrieveDefaultOutputDevice()

// Get the current volume
// Throws if an error occurs and will also throw if
// the current output device doesn't have a volume (eg. virtual devices)
let currentVolume = try Sound.output.readVolume
// Set the volume (values between 0 and 1)
// Throws if an error occurs, including when the current output device
// doesn't have a volume or doesn't allow changing it.
try Sound.output.setVolume(0.7)

// Get the mute property value
// Throws if an error occurs and will also throw if
// the current output device doesn't have the mute property.
let isMuted = try Sound.output.readMute()
// Mute or unmute
// Throws if an error occurs, including when the current output device
// doesn't have the mute property or doesn't allow changing it.
try Sound.output.mute(true)
try Sound.output.mute(false)
```

## Documentation
All classes and methods are fully documented.
You can access the documentation in Xcode.

## Compatibility
ISSoundAdditions is compatible with **macOS 10.12** or higher.

*If you're targeting older versions of macOS, you can download version 1 using the Releases tab here on GitHub. Version 1 requires macOS 10.6 or later.*

## Contributions
All contributions to expand the library are welcome. Fork the repo, make the changes you want, and open a Pull Request.

If you make changes to the codebase, we are not enforcing a coding style, but we may ask you to make changes based on how the rest of the library is made.

## Status
The library can be considered **stable** and can be used in Production apps.

Starting with version 2, in case breaking changes are introduced, we will follow [Semantic Versioning](https://semver.org/) strictly.

## License
ISSoundAdditions is distributed under the MIT license. See [LICENSE](https://github.com/InerziaSoft/ISSoundAdditions/blob/master/LICENSE) for details.
