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

public enum CocoParagraphStyle {
    
    case baseWritingDirection(NSWritingDirection)
    case textAlignment(NSTextAlignment)
    case lineSpacing(CGFloat)
    case lineHeightMultiple(CGFloat)
    case lineBreakMode(NSLineBreakMode)
    case paragraphSpacing(CGFloat)
    case firstLineHeadIndent(CGFloat)
    case headIndent(CGFloat)
    case tailIndent(CGFloat)
    case minimumLineHeight(CGFloat)
    case maximumLineHeight(CGFloat)
    case paragraphSpacingBefore(CGFloat)
    case hyphenationFactor(Float)
    case defaultWritingDirection(languageName: String)
    
    @available(iOS 7.0, *)
    case tabStops([NSTextTab])

    @available(iOS 7.0, *)
    case defaultTabInterval(CGFloat)

    @available(iOS 9.0, *)
    case allowsDefaultTighteningForTruncation(Bool)

    @available(iOS 9.0, *)
    case lineBreakStrategy(NSParagraphStyle.LineBreakStrategy)

}

public final class ParagrapghStyle: AttributeKeyValueConvertible, AttributeRangeProvider {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(@ParagraphStyleBuilder _ builder: BuilderBlock) {
        self.attribute = builder()
    }
    
    public init(@ParagraphStyleBuilder _ builder: ParagraphStyleBuilderBlock) {
        self.attribute = builder(CocoParagraphStyle.self)
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
public struct ParagraphStyleBuilder {
    
    public static func buildExpression(_ expression: CocoParagraphStyle) -> CocoParagraphStyle {
        expression
    }
    
    public static func buildExpression(_ expression: NSWritingDirection) -> CocoParagraphStyle {
        .baseWritingDirection(expression)
    }
    
    public static func buildExpression(_ expression: NSTextAlignment) -> CocoParagraphStyle {
        .textAlignment(expression)
    }
    
    public static func buildExpression(_ expression: NSLineBreakMode) -> CocoParagraphStyle {
        .lineBreakMode(expression)
    }
    
    public static func buildExpression(_ expression: Float) -> CocoParagraphStyle {
        .hyphenationFactor(expression)
    }
    
    public static func buildExpression(_ expression: String) -> CocoParagraphStyle {
        .defaultWritingDirection(languageName: expression)
    }
    
    @available(iOS 9.0, *)
    public static func buildExpression(_ expression: TextTab) -> CocoParagraphStyle {
        .tabStops(expression.tabs)
    }
    
    public static func buildBlock(_ components: CocoParagraphStyle...) -> CocoStringAttributeHolder {
        .attribute(key: .paragraphStyle, value: ParagraphStyleAdapter(adaptee: components))
    }
}
