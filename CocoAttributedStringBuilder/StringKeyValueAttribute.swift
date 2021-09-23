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

import UIKit

public struct StringKeyValueAttribute: NSAttributedStringKeyValueConvertible {

    public typealias BuilderBlock = () -> StringKeyValueAttribute
    
    public let key:NSAttributedString.Key
    public let value: Any
    
    public func asKeyValue() -> (key: NSAttributedString.Key, value: Any) {
        (key,value)
    }
}

extension StringKeyValueAttribute {
    
    
    public static func underlineStyle(with style: NSUnderlineStyle) -> Self {
        .init(key: .underlineStyle, value: style.rawValue)
    }
    
    public static func font(with font:UIFont) -> Self {
        .init(key: .font, value: font)
    }
    
    public static func foregroundColor(with color:UIColor) -> Self {
        .init(key: .foregroundColor, value: color)
    }
    
    public static func backgroundColor(with color:UIColor) -> Self {
        .init(key: .backgroundColor, value: color)
    }
    
    public static func underlineColor(with color:UIColor) -> Self {
        .init(key: .underlineColor, value: color)
    }
    
    public static func strikethroughColor(with color:UIColor) -> Self {
        .init(key: .strikethroughColor, value: color)
    }
    
    public static func strokeColor(with color:UIColor) -> Self {
        .init(key: .strokeColor, value: color)
    }
    
    public static func ligature(with value:NSNumber) -> Self {
        .init(key: .ligature, value: value)
    }
    
    @available(iOS 14.0, *)
    public static func tracking(with value:NSNumber) -> Self {
        .init(key: .tracking, value: value)
    }
    
    public static func strikethroughStyle(with value:NSNumber) -> Self {
        .init(key: .strikethroughStyle, value: value)
    }
    
    public static func strokeWidth(with value:NSNumber) -> Self {
        .init(key: .strokeWidth, value: value)
    }
    
    public static func textEffect(with value:String) -> Self {
        .init(key: .textEffect, value: value)
    }
    
    public static func baselineOffset(with value:NSNumber) -> Self {
        .init(key: .baselineOffset, value: value)
    }
    
    public static func obliqueness(with value:NSNumber) -> Self {
        .init(key: .obliqueness, value: value)
    }
    
    public static func expansion(with value:NSNumber) -> Self {
        .init(key: .expansion, value: value)
    }
    
    public static func link(with url:NSURL) -> Self {
        .init(key: .link, value: url)
    }
    
    public static func kern(with value:CGFloat) -> Self {
        .init(key: .kern, value: value)
    }
    
    public static func verticalGlyphForm(with value:NSNumber) -> Self {
        .init(key: .verticalGlyphForm, value: value)
    }
    
}
