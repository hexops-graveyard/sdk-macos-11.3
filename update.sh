#!/usr/bin/env bash
set -ex

rm -rf ./root ./MacOSX11.3.sdk
mkdir -p MacOSX11.3.sdk
cp -R /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.3.sdk/* ./MacOSX11.3.sdk/

# Hack: link some header files under a common folder to workaround an issue in Zig:
# https://github.com/ziglang/zig/issues/8811

pushd ./MacOSX11.3.sdk/usr/include/
cp -R ../../System/Library/Frameworks/Cocoa.framework/Versions/Current/Headers Cocoa
cp -R ../../System/Library/Frameworks/Foundation.framework/Versions/Current/Headers Foundation
cp -R ../../System/Library/Frameworks/AppKit.framework/Versions/Current/Headers AppKit
cp -R ../../System/Library/Frameworks/CoreData.framework/Versions/Current/Headers CoreData
cp -R ../../System/Library/Frameworks/CoreImage.framework/Versions/Current/Headers CoreImage
cp -R ../../System/Library/Frameworks/CoreVideo.framework/Versions/Current/Headers CoreVideo
cp -R ../../System/Library/Frameworks/Metal.framework/Versions/Current/Headers Metal
cp -R ../../System/Library/Frameworks/IOSurface.framework/Versions/Current/Headers IOSurface
cp -R ../../System/Library/Frameworks/QuartzCore.framework/Versions/Current/Headers QuartzCore
cp -R ../../System/Library/Frameworks/CloudKit.framework/Versions/Current/Headers CloudKit
cp -R ../../System/Library/Frameworks/CoreLocation.framework/Versions/Current/Headers CoreLocation
cp -R ../../System/Library/Frameworks/Kernel.framework/Versions/Current/Headers Kernel

cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Versions/Current/Headers ApplicationServices
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/ATS.framework/Versions/Current/Headers ATS
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/ATSUI.framework/Versions/Current/Headers ATSUI
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/ColorSync.framework/Versions/Current/Headers ColorSync
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreGraphics.framework/Versions/Current/Headers CoreGraphics
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreText.framework/Versions/Current/Headers CoreText
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/HIServices.framework/Versions/Current/Headers HIServices
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/ImageIO.framework/Versions/Current/Headers ImageIO
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/LangAnalysis.framework/Versions/Current/Headers LangAnalysis
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/PrintCore.framework/Versions/Current/Headers PrintCore
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/QD.framework/Versions/Current/Headers QD
cp -R ../../System/Library/Frameworks/ApplicationServices.framework/Frameworks/SpeechSynthesis.framework/Versions/Current/Headers SpeechSynthesis

cp -R ../../System/Library/Frameworks/Carbon.framework/Versions/Current/Headers Carbon
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/CommonPanels.framework/Versions/Current/Headers CommonPanels
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/Headers HIToolbox
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/Help.framework/Versions/Current/Headers Help
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/ImageCapture.framework/Versions/Current/Headers ImageCapture
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/OpenScripting.framework/Versions/Current/Headers OpenScripting
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/Print.framework/Versions/Current/Headers Print
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/SecurityHI.framework/Versions/Current/Headers SecurityHI
cp -R ../../System/Library/Frameworks/Carbon.framework/Frameworks/SpeechRecognition.framework/Versions/Current/Headers SpeechRecognition

cp -R ../../System/Library/Frameworks/IOKit.framework/Versions/Current/Headers IOKit
cp -R ../../System/Library/Frameworks/CoreFoundation.framework/Versions/Current/Headers CoreFoundation
cp -R ../../System/Library/Frameworks/DiskArbitration.framework/Versions/Current/Headers DiskArbitration
cp -R ../../System/Library/Frameworks/CFNetwork.framework/Versions/Current/Headers CFNetwork
pushd security && cp -R ../../../System/Library/Frameworks/Security.framework/Versions/Current/Headers/* . && popd
mv security/ Security/

cp -R ../../System/Library/Frameworks/CoreServices.framework/Versions/Current/Headers CoreServices
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/AE.framework/Versions/Current/Headers AE
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/DictionaryServices.framework/Versions/Current/Headers DictionaryServices
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/Current/Headers LaunchServices
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/OSServices.framework/Versions/Current/Headers OSServices
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/SharedFileList.framework/Versions/Current/Headers SharedFileList
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Versions/Current/Headers CarbonCore
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/FSEvents.framework/Versions/Current/Headers FSEvents
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/Metadata.framework/Versions/Current/Headers Metadata
cp -R ../../System/Library/Frameworks/CoreServices.framework/Frameworks/SearchKit.framework/Versions/Current/Headers SearchKit

cp -R ../../System/Library/Frameworks/OpenGL.framework/Versions/Current/Headers OpenGL
popd

# Remove unnecessary files (574M -> 164M)
rm -rf MacOSX11.3.sdk/usr/share/man/
rm -rf MacOSX11.3.sdk/System/PrivateFrameworks/
rm -rf MacOSX11.3.sdk/usr/lib/swift
rm -rf MacOSX11.3.sdk/System/iOSSupport/usr/lib/swift
rm -rf MacOSX11.3.sdk/System/Library/Perl/

rm -rf MacOSX11.3.sdk/System/Library/Frameworks/SwiftUI.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Ruby.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Python.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/SwiftUI.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Combine.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Accelerate.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/WebKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Python.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/RealityKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/AVFoundation.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Intents.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/CoreTelephony.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/AudioToolbox.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Quartz.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/OpenCL.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/CryptoKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/DriverKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Tcl.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/Tk.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/IOBluetooth.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/DiscRecording.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/JavaScriptCore.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/HIDDriverKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/GameKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/SceneKit.framework
rm -rf MacOSX11.3.sdk/System/Library/Frameworks/WidgetKit.framework

mv MacOSX11.3.sdk root