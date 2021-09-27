# CocoAttributedStringBuilder

[![Swift](https://img.shields.io/badge/Swift-5.1_or_Higher-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.1_5.2_5.3_5.4-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_9_or_Higher-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alamofire.svg?style=flat-square)](https://img.shields.io/cocoapods/v/Alamofire.svg)
[![Twitter](https://img.shields.io/badge/twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/AlamofireSF)
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

CocoAttributedStringBuilder: Elegant and Easy AttributedStringBuilder in Swift

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [License](#license)

## Features

- [x] Use resultBuilder to create attributes
- [x] Support NSShadow Attributes
- [x] Support NSTextAttachment Attributes
- [x] Support NSParagraphStyle Attributes
- [x] Specify range for each attribute
- [ ] Support if-statement on builders

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 9.0+ | 5.1 | [CocoaPods](#cocoapods) | Not Tested |

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate CocoAttributedStringBuilder into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'CocoAttributedStringBuilder'
```

## Sample Projects

I have provided one sample projects in the repository. To use it download the repo, Source files for these are in the `CocoAttributedStringBuilderExamples` directory in project navigator. Have fun!

## Usage

Using Coco is so easy, It is inspired by SwiftUI and the very useful PropertyWrapper `@resultBuilder` in swift.

You just need to annotate the functions or properties which return `NSAttributedString` to use Coco provided builders.

```swift
// swift-tools-version:5.3
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
func build() -> NSAttributedString { }
```

## License

CocoAttributedStringBuilder is released under the MIT license.
