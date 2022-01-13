//
//  Helpers.swift
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

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

public typealias StringBuilderBlock = (String) -> [CocoStringAttributeHolder]

public typealias AttributeBuilderBlock = (String, CocoAttribute.Type) -> [CocoStringAttributeHolder]

public typealias BuilderBlock = () -> CocoStringAttributeHolder

public typealias ParagraphStyleBuilderBlock = (CocoParagraphStyle.Type) -> CocoStringAttributeHolder

#if !os(watchOS)
@available(iOS 7.0, *)
@available(macOS 10.11, *)
@available(macCatalyst 13.0, *)
@available(tvOS 9.0, *)
public typealias AttachmentBuilderBlock = (CocoAttachment.Type) -> CocoStringAttributeHolder
#endif

public typealias ShadowBuilderBlock = (CocoShadow.Type) -> CocoStringAttributeHolder

public typealias TabBuilderBlock = () -> [NSTextTab]

public typealias TextTabBuilderBlock = (CocoTextTab.Type) -> [NSTextTab]

protocol NSConvertible {
    associatedtype T: AnyObject
    func toNS() -> T
}

public protocol CocoParagraphStyleConvertible {
    func apply(on object: NSMutableParagraphStyle)
}
