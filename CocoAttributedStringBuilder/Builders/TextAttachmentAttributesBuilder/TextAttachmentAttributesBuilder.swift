//
//  TextAttachmentAttributesBuilder.swift
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

public enum CocoAttachment: SpecificAppliableAttributes {
    
    case content(Data,String)
    case contents(Data)
    case fileType(String)
    case bounds(CGRect)
    case image(UIImage)
    case fileWrapper(FileWrapper)
    
    internal func apply(on object: NSTextAttachment) {
        switch self {
            case let .content(data,stringLiteral):
                object.contents = data
                object.fileType = stringLiteral
            case let .contents(data):
                object.contents = data
            case let .fileType(stringLiteral):
                object.fileType = stringLiteral
            case let .bounds(rect):
                object.bounds = rect
            case let .image(image):
                object.image = image
            case let .fileWrapper(wrapper):
                object.fileWrapper = wrapper
        }
    }
}

public final class TextAttachment: AttributeKeyValueConvertible {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(@TextAttachmentBuilder _ builder: BuilderBlock) {
        self.attribute = builder()
    }
    
    public func on(_ range: Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range)
        return self
    }
}

@resultBuilder
public struct TextAttachmentBuilder {
    
    public static func buildBlock(_ components: CocoAttachment...) -> CocoStringAttributeHolder {
        .attribute(key: .attachment, value: NSTextAttachment(with: components))
    }
}
