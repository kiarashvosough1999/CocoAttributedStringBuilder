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
    
    @CocoAttributedStringBuilder
    func build() -> NSAttributedString {
        CocoString("Test Builder\n kiarash vosough") { str in
            CocoAttribute.foregroundColor(.red)
                .on(str.startIndex..<str.firstIndex(of: "r")!)
            
            TextAttachment {
                CocoAttachment.bounds(.infinite)
            }
            
            ParagrapghStyle {
                CocoParagraphStyle.lineHeightMultiple(8)
                CocoParagraphStyle.lineSpacing(2.3)
            }
            
            Shadow {
                CocoShadow.shadowOffset(.init(width: 1.5, height: 1))
                CocoShadow.shadowColor(UIColor.black)
            }
        }
    }
}

