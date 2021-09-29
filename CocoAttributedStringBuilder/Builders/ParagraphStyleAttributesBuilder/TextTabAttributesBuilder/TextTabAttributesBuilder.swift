//
//  TextTabAttributesBuilder.swift
//  CocoAttributedStringBuilder
//
//  Created by Kiarash Vosough on 7/7/1400 AP.
//

import UIKit

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

public final class TextTab: CocoParagraphStyleConvertible {

    public var tabs: [CocoTextTab]
    
    public init(@TextTabAttributesBuilder _ builder: TabBuilderBlock) {
        self.tabs = builder()
    }
    
    public func apply(on object: NSMutableParagraphStyle) {
        tabs.forEach {object.addTabStop($0.toNS()) }
        
    }
}

@resultBuilder
public struct TextTabAttributesBuilder {
    
    public static func buildBlock(_ components: CocoTextTab...) -> [CocoTextTab] {
        components
    }
}
