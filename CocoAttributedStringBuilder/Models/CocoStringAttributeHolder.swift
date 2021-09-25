//
//  Attribute.swift
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

public struct CocoStringAttributeHolder {
    
    internal let key: NSAttributedString.Key
    internal let value: Any
    internal let range: Range<String.Index>?
    
    fileprivate init(key: NSAttributedString.Key, value: Any, range: Range<String.Index>?) {
        self.key = key
        self.value = value
        self.range = range
    }
}

extension CocoStringAttributeHolder {
    
    public static func attribute(key: NSAttributedString.Key, value: Any) -> Self {
        .init(key: key, value: value, range: nil)
    }
    
    public static func rangedAttribute(key: NSAttributedString.Key, value: Any, range: Range<String.Index>) -> Self {
        .init(key: key, value: value, range: range)
    }
}
