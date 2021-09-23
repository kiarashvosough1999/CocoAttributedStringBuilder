//
//  NSMutableParagraphStyle++Extension.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/2/1400 AP.
//

import UIKit

extension NSMutableParagraphStyle {
    convenience init(with shadows: [StringParagraphStyle]) {
        self.init()
        shadows.forEach { $0.apply(on: self) }
    }
}
