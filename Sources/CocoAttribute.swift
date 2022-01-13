//
//  StringKeyValueAttribute.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/1/1400 AP.
//
//  Copyright 2020 KiarashVosough and other contributors
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

public final class CocoAttribute: AttributeKeyValueConvertible {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(key: NSAttributedString.Key, value: Any) {
        self.attribute = .attribute(key: key, value: value)
    }
    
    public func within(_ range: Swift.Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range)
        return self
    }
    
    public func within(_ range: () -> Swift.Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range())
        return self
    }
    
}

extension CocoAttribute {
    
    
    public static func underlineStyle(_ style: NSUnderlineStyle) -> Self {
        .init(key: .underlineStyle, value: style.rawValue)
    }
    
    
    public static func font( _ font: CocoFont) -> Self {
        .init(key: .font, value: font)
    }
    
    public static func foregroundColor(_ color: CocoColor) -> Self {
        .init(key: .foregroundColor, value: color)
    }
    
    public static func backgroundColor(_ color: CocoColor) -> Self {
        .init(key: .backgroundColor, value: color)
    }
    
    public static func underlineColor(_ color: CocoColor) -> Self {
        .init(key: .underlineColor, value: color)
    }
    
    public static func strikethroughColor(_ color: CocoColor) -> Self {
        .init(key: .strikethroughColor, value: color)
    }
    
    public static func strokeColor(_ color: CocoColor) -> Self {
        .init(key: .strokeColor, value: color)
    }
    
    public static func ligature(_ value: NSNumber) -> Self {
        .init(key: .ligature, value: value)
    }
    
    @available(watchOSApplicationExtension 7.0, *)
    @available(tvOSApplicationExtension 14.0, *)
    @available(macOS 11.0, *)
    @available(iOS 14.0, *)
    public static func tracking(_ value: NSNumber) -> Self {
        .init(key: .tracking, value: value)
    }
    
    public static func strikethroughStyle(_ value: NSNumber) -> Self {
        .init(key: .strikethroughStyle, value: value)
    }
    
    public static func strokeWidth(_ value: NSNumber) -> Self {
        .init(key: .strokeWidth, value: value)
    }
    
    @available(macOS 10.10, *)
    public static func textEffect(_ value: String) -> Self {
        .init(key: .textEffect, value: value)
    }
    
    public static func baselineOffset(_ value: NSNumber) -> Self {
        .init(key: .baselineOffset, value: value)
    }
    
    public static func obliqueness(_ value: NSNumber) -> Self {
        .init(key: .obliqueness, value: value)
    }
    
    public static func expansion(_ value: NSNumber) -> Self {
        .init(key: .expansion, value: value)
    }
    
    public static func link(_ url: NSURL) -> Self {
        .init(key: .link, value: url)
    }
    
    public static func kern(_ value: CGFloat) -> Self {
        .init(key: .kern, value: value)
    }
    
    public static func verticalGlyphForm(_ value: NSNumber) -> Self {
        .init(key: .verticalGlyphForm, value: value)
    }
}
