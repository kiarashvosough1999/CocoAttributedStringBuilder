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

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

public enum CocoShadow {
    case shadowOffset(CGSize)
    case shadowBlurRadius(CGFloat)
    case shadowColor(CocoColor? = .black.withAlphaComponent(1/3))
}

public final class Shadow: AttributeKeyValueConvertible, AttributeRangeProvider {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(@ShadowBuilder _ builder: BuilderBlock) {
        self.attribute = builder()
    }
    public init(@ShadowBuilder _ builder: ShadowBuilderBlock) {
        self.attribute = builder(CocoShadow.self)
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
public struct ShadowBuilder {
    
    public static func buildExpression(_ expression: CocoShadow) -> CocoShadow {
        expression
    }
    
    public static func buildExpression(_ expression: CGSize) -> CocoShadow {
        .shadowOffset(expression)
    }
    
    public static func buildExpression(_ expression: CGFloat) -> CocoShadow {
        .shadowBlurRadius(expression)
    }
    
    public static func buildExpression(_ expression: CocoColor) -> CocoShadow {
        .shadowColor(expression)
    }
    
    public static func buildBlock(_ components: CocoShadow...) -> CocoStringAttributeHolder {
        .attribute(key: .shadow, value: ShadowAdapter(adaptee: components))
    }
}
