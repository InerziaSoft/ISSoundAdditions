import XCTest
@testable import ISSoundAdditions
import CoreAudio

/// A suite of integration tests that can be used to ensure the library
/// works and also demonstrates how to use it.
///
/// These tests interact and modify the system output settings on the
/// current macOS instance.
///
/// - warning: These tests are meant to be executed on a macOS instance
/// that has access to an output device (which is also selected as default).
/// Running without this prerequisite will cause all test to fail.
final class ISSoundAdditionsTests: XCTestCase {
  func testDefaultOutputDevice() {
    // GIVEN
    let defaultOutputDevice = Sound.output.defaultOutputDevice
    
    // WHEN
    // This test assumes that the current device has a default
    // output device and that no action
    // is needed to select it.
    // All Macs, including virtual machines should have a
    
    // THEN
    XCTAssertNotNil(defaultOutputDevice)
    XCTAssertNotEqual(kAudioObjectUnknown, defaultOutputDevice)
  }
  
  func testSetAndGetVolume() {
    // GIVEN
    let expectedVolume: Float = 0.3
    
    // WHEN
    Sound.output.volume = expectedVolume
    
    // THEN
    XCTAssertEqual(expectedVolume, Sound.output.volume)
  }
  
  func testSetAndGetMute() {
    // GIVEN
    let firstExpectedMuteState = false
    let secondExpectedMuteState = true
    
    // WHEN
    Sound.output.isMuted = firstExpectedMuteState
    let firstActualMuteState = Sound.output.isMuted
    
    Sound.output.isMuted = secondExpectedMuteState
    let secondActualMuteState = Sound.output.isMuted
    
    // THEN
    XCTAssertEqual(firstExpectedMuteState, firstActualMuteState)
    XCTAssertEqual(secondExpectedMuteState, secondActualMuteState)
  }
  
  func testAutoMute() {
    // GIVEN
    let expectedUnmutedVolume: Float = 0.7
    let expectedMutedVolume: Float = 0.1
    let muteThreshold: Float = 0.2
    
    // WHEN
    Sound.output.isMuted = true
    Sound.output.setVolume(expectedUnmutedVolume, autoMuteUnmute: true, muteThreshold: muteThreshold)
    let expectUnmuted = Sound.output.isMuted
    
    Sound.output.setVolume(expectedMutedVolume, autoMuteUnmute: true, muteThreshold: muteThreshold)
    let expectMuted = Sound.output.isMuted
    
    // THEN
    XCTAssertFalse(expectUnmuted)
    XCTAssertTrue(expectMuted)
  }
}
