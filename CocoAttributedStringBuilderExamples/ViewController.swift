//
//  ViewController.swift
//  CocoAttributedStringBuilderExamples
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
import CocoAttributedStringBuilder

final class ViewController: UIViewController {
    
    fileprivate lazy var label: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        constraintViews()
        setupViews()
    }
    
    fileprivate func setupViews() {
        label.attributedText = build()
    }
    
    fileprivate func constraintViews() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    fileprivate func addViews() {
        view.addSubview(label)
    }
    
    /// Example of Using each builder without take advantage of meta-type of Attribute in each block
    @CocoAttributedStringBuilder
    func build() -> NSAttributedString {
        CocoString("Test Builder1") { str in // str == "Test Builder\n kiarash vosough"
            CocoAttribute.foregroundColor(.blue)
                .within(str.startIndex..<str.firstIndex(of: "r")!) // make sure the range is valid, otherwise program will crash

            ParagrapghStyle {
                CocoParagraphStyle.lineHeightMultiple(8) // each Block has its own AttributeBuilders, here CocoAttachment is related to TextAttachment
                CocoParagraphStyle.lineSpacing(2.3)

                TextTab {
                    CocoTextTab.tab(textAlignment: .center, location: 5)
                    CocoTextTab.tab(textAlignment: .left, location: 5)
                }

            }.within { str.startIndex..<str.firstIndex(of: "l")! } // if you need more space to specifying range, use this overload of method within whihc take a closure of return type range
            
            Shadow {
                CocoShadow.shadowOffset(.init(width: 1.5, height: 5))
                CocoShadow.shadowColor(UIColor.orange)
            }.within(str.startIndex..<str.lastIndex(of: "B")!)
        }
    }
    
    /// Example of Using each builder with take advantage of meta-type of Attribute in each block
    /// instead of using each block attributeBuilder Name, the meta-type of that is provided in each closure
    /// some attributes are unique in their block, you can provide them with its own UIKit Implementation
    /// Although for the sake of clean code I recommend to use provided meta-type
    @CocoAttributedStringBuilder
    func build2() -> NSAttributedString {
        CocoString("Test 2 Builder") { str, a in
            a.foregroundColor(.red) // b is a meta-type for CocoAttribute
                .within(str.startIndex..<str.firstIndex(of: "r")!)
            
            TextAttachment { t in
                CGRect.infinite // bounds is a unique attribute in TextAttachment, there is no diffrrence between thses two way of specifying bounds.
                t.bounds(.infinite) // t is a meta-type for CocoAttachment
            }
            
            
            ParagrapghStyle { p in
                // there is no diffrrence between thses two way of specifying it.
                NSWritingDirection.natural
                p.baseWritingDirection(.natural)
                
                p.lineHeightMultiple(8)
                p.lineSpacing(2.3)
                
                TextTab { b in
                    NSTextTab(textAlignment: .center, location: 5, options: [:])
                    b.tab(textAlignment: .center, location: 5)
                    
                    b.tab(textAlignment: .left, location: 15)
                }
                
            }
            
            Shadow { b in
                // there is no diffrrence between thses two way of specifying shadowOffset.
                CGSize(width: 1.5, height: 1)
                b.shadowOffset(.init(width: 1.5, height: 1))
                
                b.shadowColor(.black)
            }
        }
    }
}

