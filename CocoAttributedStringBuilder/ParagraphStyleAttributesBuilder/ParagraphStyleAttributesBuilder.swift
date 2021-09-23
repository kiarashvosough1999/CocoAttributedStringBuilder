//
//  ParagraphStyleAttributesBuilder.swift
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

public enum StringParagraphStyle: SpecificAppliableAttributes {
    
    case baseWritingDirection(NSWritingDirection)
    case textAlignment(NSTextAlignment)
    case lineSpacing(CGFloat)
    case lineHeightMultiple(CGFloat)
    case lineBreakMode(NSLineBreakMode)
    
    func apply(on object: NSMutableParagraphStyle) {
        switch self {
        case let .baseWritingDirection(value):
            object.baseWritingDirection = value
        case let .textAlignment(value):
            object.alignment = value
        case let .lineSpacing(value):
            object.lineSpacing = value
        case let .lineHeightMultiple(value):
            object.lineHeightMultiple = value
        case let .lineBreakMode(value):
            object.lineBreakMode = value
        }
    }
}

public struct ParagrapghStyle: NSAttributedStringKeyValueConvertible {
    
    @AttributedStringParagraphStyleBuilder internal var builder: StringKeyValueAttribute.BuilderBlock
    
    public init(@AttributedStringParagraphStyleBuilder _ builder: @escaping StringKeyValueAttribute.BuilderBlock) {
        self.builder = builder
    }
    
    public func asKeyValue() -> KeyValue {
        builder().asKeyValue()
    }
}

@resultBuilder
public struct AttributedStringParagraphStyleBuilder {
    
    public static func buildBlock(_ components: StringParagraphStyle...) -> StringKeyValueAttribute {
        .init(key: .paragraphStyle, value: NSMutableParagraphStyle(with: components))
    }
}
