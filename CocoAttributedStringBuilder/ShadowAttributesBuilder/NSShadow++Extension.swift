//
//  NSShadow++Extension.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/2/1400 AP.
//

import UIKit

extension NSShadow {
    convenience init(with shadows: [StringShadow]) {
        self.init()
        shadows.forEach { $0.apply(on: self) }
    }
}
