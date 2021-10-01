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

public enum CocoAttachment {
    case content(Data)
    case fileType(String)
    case bounds(CGRect)
    case image(UIImage)
    case fileWrapper(FileWrapper)
}

public final class TextAttachment: AttributeKeyValueConvertible, AttributeRangeProvider {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(@TextAttachmentBuilder _ builder: BuilderBlock) {
        self.attribute = builder()
    }
    
    public init(@TextAttachmentBuilder _ builder: AttachmentBuilderBlock) {
        self.attribute = builder(CocoAttachment.self)
    }
    
    public func within(_ range: Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range)
        return self
    }
    
    public func within(_ range: () -> Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range())
        return self
    }
}

@resultBuilder
public struct TextAttachmentBuilder {
    
    public static func buildExpression(_ expression: CocoAttachment) -> CocoAttachment {
        expression
    }
    
    public static func buildExpression(_ expression: String) -> CocoAttachment {
        .fileType(expression)
    }
    public static func buildExpression(_ expression: CGRect) -> CocoAttachment {
        .bounds(expression)
    }
    public static func buildExpression(_ expression: UIImage) -> CocoAttachment {
        .image(expression)
    }
    public static func buildExpression(_ expression: Data) -> CocoAttachment {
        .content(expression)
    }
    public static func buildExpression(_ expression: FileWrapper) -> CocoAttachment {
        .fileWrapper(expression)
    }
    
    
    public static func buildBlock(_ components: CocoAttachment...) -> CocoStringAttributeHolder {
        .attribute(key: .attachment, value: AttachmentAdapter(adaptee: components))
    }
}
