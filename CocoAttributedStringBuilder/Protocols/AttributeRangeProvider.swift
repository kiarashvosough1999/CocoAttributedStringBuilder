//
//  AttributeRangeProvider.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/9/1400 AP.
//

import Foundation

public protocol AttributeRangeProvider: AnyObject {
    
    typealias RangeBlock = () ->  Range<String.Index>
    
    func within(_ range: Range<String.Index>) -> Self
    
    func within(_ range: RangeBlock) -> Self
}
