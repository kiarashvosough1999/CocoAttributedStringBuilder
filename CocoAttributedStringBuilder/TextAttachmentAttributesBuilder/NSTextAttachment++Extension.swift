//
//  NSTextAttachment++Extension.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/2/1400 AP.
//

import UIKit

extension NSTextAttachment {
    convenience init(with attachments: [StringTextAttachment]) {
        self.init()
        attachments.forEach { $0.apply(on: self) }
    }
}
