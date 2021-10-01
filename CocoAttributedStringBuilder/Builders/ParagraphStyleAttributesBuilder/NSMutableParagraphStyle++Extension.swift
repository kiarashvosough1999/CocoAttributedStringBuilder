//
//  NSMutableParagraphStyle++Extension.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/2/1400 AP.
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

internal final class ParagraphStyleAdapter: NSMutableParagraphStyle {
    
    /// On this special adapter we are not going to save the adaptee as we map them to super class's properties
    internal init(adaptee: [CocoParagraphStyle]) {
        super.init()
        setNeedsAttributes(adaptee: adaptee)
    }
    
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setNeedsAttributes(adaptee: [CocoParagraphStyle]) {
        adaptee.forEach {
            switch $0 {
            case let .baseWritingDirection(value): baseWritingDirection = value
            case let .textAlignment(value): alignment = value
            case let .lineSpacing(value): lineSpacing = value
            case let .lineHeightMultiple(value): lineHeightMultiple = value
            case let .lineBreakMode(value): lineBreakMode = value
            case let .paragraphSpacing(value): paragraphSpacing = value
            case let .firstLineHeadIndent(value): firstLineHeadIndent = value
            case let .headIndent(value): headIndent = value
            case let .tailIndent(value): tailIndent = value
            case let .minimumLineHeight(value): minimumLineHeight = value
            case let .maximumLineHeight(value): maximumLineHeight = value
            case let .paragraphSpacingBefore(value): paragraphSpacingBefore = value
            case let .hyphenationFactor(value): hyphenationFactor = value
            case let .tabStops(value): tabStops = value
            case let .defaultTabInterval(value): defaultTabInterval = value
            case let .allowsDefaultTighteningForTruncation(value): allowsDefaultTighteningForTruncation = value
            case let .lineBreakStrategy(value): lineBreakStrategy = value
            case let .defaultWritingDirection(languageName): baseWritingDirection = NSParagraphStyle.defaultWritingDirection(forLanguage: languageName)
            }
        }
    }
}
