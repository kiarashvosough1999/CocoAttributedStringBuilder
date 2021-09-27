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
- [SampleProjects](#Sample)
- [Usage](#Usage)
- [Contributors](#Contributors)
- [License](#license)

## Features

- [x] Use resultBuilder to create attributes
- [x] Support NSShadow Attributes
- [x] Support NSTextAttachment Attributes
- [x] Support NSParagraphStyle Attributes
- [x] Specify range for each attribute
- [ ] Support if-statement on builders
- [ ] Provide operator to define an attribute

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

## Sample

I have provided one sample project in the repository. To use it clone the repo, Source files for these are in the `CocoAttributedStringBuilderExamples` directory in project navigator. Have fun!

## Usage

Using Coco is so easy, It is inspired by SwiftUI and the very useful PropertyWrapper `@resultBuilder` in swift.

You just need to annotate the functions or properties which return `NSAttributedString` to use Coco provided builders.

```swift
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
var builder: NSAttributedString { }

@CocoAttributedStringBuilder
func build() -> NSAttributedString { }
```

### Create Your First CocoAttributedString

In order to create an AttributedString on Coco, you should use `CocoString` which takes a `String` and a builderBlock arguments.

> String which was provided as an input argument is also available on the builderBlock to avoid outer variable or self capturing.

```swift
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
var builder: NSAttributedString {
    CocoString("Test Builder") { str in 
      // attributes comes here
    }
}

@CocoAttributedStringBuilder
func build() -> NSAttributedString {
    CocoString("Test Builder") { str in 
      // attributes comes here
    }
}
```


## Attributes

Coco supports four kind of Attributes.

> Each attribute is normally added to whole string, unless you specify the range of string you demand.
>> Coco is not responsible for handling invalid ranges, so be more careful on specifying the ranges.

| Builders            | Description |
| :-------------:     |:-------------|
| `CocoAttribute`     | Provide a keyValue interface for `NSAttributedString.Key` |
| `TextAttachment`    | Provide a builder block for `CocoAttachment` which is an interface for `NSTextAttachment` |
| `ParagrapghStyle`   | Provide a builder block for `CocoParagraphStyle` which is an interface for `NSParagraphStyle` |
| `CocoShadow`        | Provide a builder block for `CocoShadow which` is an interface for `NSShadow` |

```swift
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
func build() -> NSAttributedString {
    CocoString("Test Builder") { str in
        CocoAttribute.foregroundColor(.red)
            .on(str.startIndex..<str.firstIndex(of: "r")!)

        TextAttachment {
            CocoAttachment.bounds(.infinite)
        }
        .on(str.startIndex..<str.firstIndex(of: "r")!)
        
        ParagrapghStyle {
            CocoParagraphStyle.lineHeightMultiple(8)
            CocoParagraphStyle.lineSpacing(2.3)
        }
        .on(str.startIndex..<str.firstIndex(of: "t")!)

        Shadow {
            CocoShadow.shadowOffset(.init(width: 1.5, height: 1))
            CocoShadow.shadowColor(UIColor.black)
        }
        .on(str.startIndex..<str.firstIndex(of: "d")!)
    }
}
```

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

CocoAttributedStringBuilder is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/CocoAttributedStringBuilder/blob/master/LICENSE) for more information.
