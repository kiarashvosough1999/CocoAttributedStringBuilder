//
//  ShadowAttributesBuilder.swift
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

public enum StringShadow: SpecificAppliableAttributes {
    
    case shadowOffset(CGSize)
    case shadowBlurRadius(CGFloat)
    case shadowColor(Any?)
    
    func apply(on object: NSShadow) {
        switch self {
        case let .shadowOffset(size):
            object.shadowOffset = size
        case let .shadowBlurRadius(value):
            object.shadowBlurRadius = value
        case let .shadowColor(color):
            object.shadowColor = color
        }
    }
}

public struct Shadow: NSAttributedStringKeyValueConvertible {
    
    @AttributedStringShadowBuilder internal var builder: StringKeyValueAttribute.BuilderBlock
    
    public init(@AttributedStringShadowBuilder _ builder: @escaping StringKeyValueAttribute.BuilderBlock) {
        self.builder = builder
    }
    
    public func asKeyValue() -> KeyValue {
        builder().asKeyValue()
    }
}

@resultBuilder
public struct AttributedStringShadowBuilder {
    
    public static func buildBlock(_ components: StringShadow...) -> StringKeyValueAttribute {
        .init(key: .shadow, value: NSShadow(with: components))
    }
}
