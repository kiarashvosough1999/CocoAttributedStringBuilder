//
//  TextTabAttributesBuilder.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/7/1400 AP.
//

import UIKit

@available(iOS 9.0, *)
public struct CocoTextTab: NSConvertible {
    
    private let textAlignment: NSTextAlignment
    private let location: CGFloat
    private let options: [NSTextTab.OptionKey : Any]
    
    private init(textAlignment: NSTextAlignment, location: CGFloat, options: [NSTextTab.OptionKey : Any]) {
        self.textAlignment = textAlignment
        self.location = location
        self.options = options
    }
    
    internal func toNS() -> NSTextTab {
        NSTextTab(textAlignment: textAlignment, location: location, options: options)
    }
}

extension CocoTextTab {
    
    public static func tab(textAlignment alignment: NSTextAlignment, location loc: CGFloat, options: [NSTextTab.OptionKey : Any] = [:]) -> CocoTextTab {
        CocoTextTab(textAlignment: alignment, location: loc, options: options)
    }
    
}

@available(iOS 9.0, *)
public final class TextTab {

    public var tabs: [NSTextTab]
    
    public init(@TextTabAttributesBuilder _ builder: TabBuilderBlock) {
        self.tabs = builder()
    }
    
    public init(@TextTabAttributesBuilder _ builder: TextTabBuilderBlock) {
        self.tabs = builder(CocoTextTab.self)
    }
}

@resultBuilder
@available(iOS 9.0, *)
public struct TextTabAttributesBuilder {
    
    public static func buildExpression(_ expression: NSTextTab) -> CocoTextTab {
        .tab(textAlignment: expression.alignment, location: expression.location, options: expression.options)
    }
    
    public static func buildExpression(_ expression: CocoTextTab) -> CocoTextTab {
        expression
    }
    
    public static func buildBlock(_ components: CocoTextTab...) -> [NSTextTab] {
        components.map { $0.toNS() }
    }
}
