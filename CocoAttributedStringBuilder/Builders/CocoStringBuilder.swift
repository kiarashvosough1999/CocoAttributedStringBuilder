//
//  StringAttributeBuilder.swift
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

public struct CocoString {
    
    internal let attributedString: NSAttributedString
    
    public init(_ string: String,
                @CocoStringBuilder _ attributes: @escaping StringBuilderBlock) {
        self.attributedString = NSMutableAttributedString(string: string, with: attributes(string))
    }
    
    public init(_ string: String,
                @CocoStringBuilder _ attributes: @escaping AttributeBuilderBlock) {
        self.attributedString = NSMutableAttributedString(string: string, with: attributes(string, CocoAttribute.self))
    }
}

@resultBuilder
public struct CocoStringBuilder {
    
    public static func buildBlock(_ components: AttributeKeyValueConvertible...) -> [CocoStringAttributeHolder] {
        components.map { $0.attribute }
    }
}
