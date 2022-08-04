
<p align="center">
  <img src="https://github.com/kiarashvosough1999/CocoAttributedStringBuilder/blob/master/resources/coco_icon.png">
</p>

![Swift](https://img.shields.io/badge/Swift-5.3_or_Higher-orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-iOS_9_or_Higher-yellowgreen?style=flat-square)
![Swift](https://img.shields.io/badge/Swift-5.3_or_Higher-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/Twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/vosough_k)
[![Linkedin](https://img.shields.io/badge/Linkedin-KiarashVosough-blue.svg?style=flat-square)](https://www.linkedin.com/in/kiarashvosough/)

CocoAttributedStringBuilder: Elegant and Easy AttributedStringBuilder in Swift

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [SampleProjects](#sample)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Features

- [x] Use resultBuilder to create attributes
- [x] Support NSShadow Attributes
- [x] Support NSTextAttachment Attributes
- [x] Support NSParagraphStyle Attributes
- [x] Support NSParagraphStyle's NextTabs
- [x] Specify range for each attribute
- [ ] Support if-statement on builders
- [ ] Provide operator to define an attribute

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 9.0+ | 5.3 | [CocoaPods](#cocoapods) | Tested |

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
| :-------------      |:-------------|
| `CocoAttribute`     | Provide a keyValue interface for `NSAttributedString.Key` |
| `TextAttachment`    | Provide a builder block for `CocoAttachment` which is an interface for `NSTextAttachment` |
| `ParagrapghStyle`   | Provide a builder block for `CocoParagraphStyle` which is an interface for `NSParagraphStyle` |
| `TextTab`           | Provide a builder block for `CocoTextTab` which is an interface for `NSTextTab` |
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
        .within(str.startIndex..<str.firstIndex(of: "r")!)
        
        ParagrapghStyle {
            CocoParagraphStyle.lineHeightMultiple(8)
            CocoParagraphStyle.lineSpacing(2.3)
            TextTab {
                CocoTextTab.tab(textAlignment: .left, location: 5)
                CocoTextTab.tab(textAlignment: .center, location: 5)
            }
        }
        .within { str.startIndex..<str.firstIndex(of: "h")! }

        Shadow {
            CocoShadow.shadowOffset(.init(width: 1.5, height: 1))
            CocoShadow.shadowColor(UIColor.black)
        }
        .within(str.startIndex..<str.firstIndex(of: "d")!)
    }
}
```

#### Using Meta-Type

Instead of Using Each `Coco` Enums to use its Attributes, you can use BuilderBlock with meta-type of `Coco` Enum provided for that Block.

```swift
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
func build() -> NSAttributedString {
CocoString("Test Builder") { str, a in
    a.foregroundColor(.red)
        .within(str.startIndex..<str.firstIndex(of: "r")!)

    TextAttachment { t in
        t.bounds(.infinite)
    }
}
```

#### Use Concrete Types

I recommend you to use either meta-type provides block or `Coco` Enums, but there is another way with one special condition.
you can use each attribute Concrete type directly in each block if and only if that type is unique on that Enum.

> On this example Bounds input argument is Unique in `CocoCocoAttachment`, so we can use its input concrete type to add as attribute,
> `CGRect` which is defined is consided as `b.bounds(.infinite)`
```swift
import CocoAttributedStringBuilder

@CocoAttributedStringBuilder
func build() -> NSAttributedString {
CocoString("Test Builder") { str, a in

    TextAttachment { t in
        CGRect.infinite
    }
}
```

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

CocoAttributedStringBuilder is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/CocoAttributedStringBuilder/blob/master/LICENSE) for more information.
