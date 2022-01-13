let version = "1.0.0"

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
public typealias CocoColor = UIColor
public typealias CocoFont = UIFont
public typealias CocoImage = UIImage
#endif

#if os(macOS)
import AppKit
public typealias CocoColor = NSColor
public typealias CocoFont = NSFont
public typealias CocoImage = NSImage
#endif

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

@resultBuilder
public struct CocoAttributedStringBuilder {
    
    public static func buildBlock(_ components: CocoString...) -> NSAttributedString {
        return NSMutableAttributedString(by: components)
    }
}
