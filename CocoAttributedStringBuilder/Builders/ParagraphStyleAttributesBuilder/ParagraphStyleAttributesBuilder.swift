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

public enum CocoParagraphStyle: CocoParagraphStyleConvertible {
    
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
    
    public func apply(on object: NSMutableParagraphStyle) {
        switch self {
        case let .baseWritingDirection(value): object.baseWritingDirection = value
        case let .textAlignment(value): object.alignment = value
        case let .lineSpacing(value): object.lineSpacing = value
        case let .lineHeightMultiple(value): object.lineHeightMultiple = value
        case let .lineBreakMode(value): object.lineBreakMode = value
        case let .paragraphSpacing(value): object.paragraphSpacing = value
        case let .firstLineHeadIndent(value): object.firstLineHeadIndent = value
        case let .headIndent(value): object.headIndent = value
        case let .tailIndent(value): object.tailIndent = value
        case let .minimumLineHeight(value): object.minimumLineHeight = value
        case let .maximumLineHeight(value): object.maximumLineHeight = value
        case let .paragraphSpacingBefore(value): object.paragraphSpacingBefore = value
        case let .hyphenationFactor(value): object.hyphenationFactor = value
        case let .tabStops(value): object.tabStops = value
        case let .defaultTabInterval(value): object.defaultTabInterval = value
        case let .allowsDefaultTighteningForTruncation(value): object.allowsDefaultTighteningForTruncation = value
        case let .lineBreakStrategy(value): object.lineBreakStrategy = value
        case let .defaultWritingDirection(languageName): object.baseWritingDirection = NSParagraphStyle.defaultWritingDirection(forLanguage: languageName)
        }
    }
}

public final class ParagrapghStyle: AttributeKeyValueConvertible {
    
    public var attribute: CocoStringAttributeHolder
    
    public init(@ParagraphStyleBuilder _ builder: BuilderBlock) {
        self.attribute = builder()
    }
    
    public func on(_ range: Range<String.Index>) -> Self {
        self.attribute = .rangedAttribute(key: attribute.key, value: attribute.value, range: range)
        return self
    }
}

@resultBuilder
public struct ParagraphStyleBuilder {
    
    public static func buildBlock(_ components: CocoParagraphStyleConvertible...) -> CocoStringAttributeHolder {
        .attribute(key: .paragraphStyle, value: NSMutableParagraphStyle(with: components))
    }
}
