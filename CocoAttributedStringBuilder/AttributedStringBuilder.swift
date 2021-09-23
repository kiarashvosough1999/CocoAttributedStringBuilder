//
//  AttributedStringBuilder.swift
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

internal protocol SpecificAppliableAttributes {
    associatedtype T: AnyObject
    func apply(on object: T)
}


@resultBuilder
public struct AttributedStringBuilder {
    
    public static func buildBlock(_ components: AttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        components.forEach { attributedString.append($0.toNSAttributedString()) }
        return attributedString
    }
}


public struct AttributedString {
    
    internal let string: String
    
    @StringAttributeBuilder internal var attributes: () -> [NSAttributedString.Key : Any]
    
    public init(_ string: String,
                @StringAttributeBuilder _ attributes: @escaping () -> [NSAttributedString.Key : Any]) {
        self.string = string
        self.attributes = attributes
    }
    
    public func toNSAttributedString() -> NSAttributedString {
        return NSAttributedString(string: string, attributes: attributes())
    }
}
