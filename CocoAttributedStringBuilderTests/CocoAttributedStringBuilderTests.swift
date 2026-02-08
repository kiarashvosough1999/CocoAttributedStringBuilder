//
//  CocoAttributedStringBuilderTests.swift
//  CocoAttributedStringBuilderTests
//
//  Created by Kiarash Vosough on 7/1/1400 AP.
//

import XCTest
@testable import CocoAttributedStringBuilder

/// Empty attribute list for CocoStringBuilder; use so `[]` is typed as [CocoStringAttributeHolder].
private let noAttributes: [CocoStringAttributeHolder] = []

final class CocoAttributedStringBuilderTests: XCTestCase {

    // MARK: - Basic usage (no control flow)

    func testBasicBuilder_SingleCocoString() {
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Hello") { _ in noAttributes }
        }
        XCTAssertEqual(result.string, "Hello")
    }

    func testBasicBuilder_MultipleCocoStrings() {
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Hello") { _ in noAttributes }
            CocoString(" ") { _ in noAttributes }
            CocoString("World") { _ in noAttributes }
        }
        XCTAssertEqual(result.string, "Hello World")
    }

    func testBasicBuilder_WithAttributes() {
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Red") { _ in
                CocoAttribute.foregroundColor(.red)
            }
        }
        XCTAssertEqual(result.string, "Red")
        var effectiveRange = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &effectiveRange) as? UIColor
        XCTAssertNotNil(color)
        XCTAssertTrue(color?.isEqual(UIColor.red) ?? false)
    }

    // MARK: - CocoAttributedStringBuilder: if (optional)

    func testBuilder_IfTrue_IncludesContent() {
        let include = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Before") { _ in noAttributes }
            if include {
                CocoString("Middle") { _ in noAttributes }
            }
            CocoString("After") { _ in noAttributes }
        }
        XCTAssertEqual(result.string, "BeforeMiddleAfter")
    }

    func testBuilder_IfFalse_OmitsContent() {
        let include = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Before") { _ in noAttributes }
            if include {
                CocoString("Middle") { _ in noAttributes }
            }
            CocoString("After") { _ in noAttributes }
        }
        XCTAssertEqual(result.string, "BeforeAfter")
    }

    func testBuilder_IfTrue_MultipleInBlock() {
        let include = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if include {
                CocoString("A") { _ in noAttributes }
                CocoString("B") { _ in noAttributes }
                CocoString("C") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "ABC")
    }

    // MARK: - CocoAttributedStringBuilder: if-else

    func testBuilder_IfElse_ThenBranch() {
        let useFirst = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if useFirst {
                CocoString("First") { _ in noAttributes }
            } else {
                CocoString("Second") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "First")
    }

    func testBuilder_IfElse_ElseBranch() {
        let useFirst = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if useFirst {
                CocoString("First") { _ in noAttributes }
            } else {
                CocoString("Second") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "Second")
    }

    func testBuilder_IfElse_WithAttributes() {
        let red = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if red {
                CocoString("Red") { _ in
                    CocoAttribute.foregroundColor(.red)
                }
            } else {
                CocoString("Blue") { _ in
                    CocoAttribute.foregroundColor(.blue)
                }
            }
        }
        XCTAssertEqual(result.string, "Red")
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.red) ?? false)
    }

    // MARK: - CocoAttributedStringBuilder: switch

    func testBuilder_Switch_FirstCase() {
        let value = 1
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            switch value {
            case 1:
                CocoString("One") { _ in noAttributes }
            case 2:
                CocoString("Two") { _ in noAttributes }
            default:
                CocoString("Other") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "One")
    }

    func testBuilder_Switch_SecondCase() {
        let value = 2
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            switch value {
            case 1:
                CocoString("One") { _ in noAttributes }
            case 2:
                CocoString("Two") { _ in noAttributes }
            default:
                CocoString("Other") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "Two")
    }

    func testBuilder_Switch_DefaultCase() {
        let value = 99
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            switch value {
            case 1:
                CocoString("One") { _ in noAttributes }
            case 2:
                CocoString("Two") { _ in noAttributes }
            default:
                CocoString("Other") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "Other")
    }

    // MARK: - CocoAttributedStringBuilder: for-in array

    func testBuilder_ForIn_ArrayOfStrings() {
        let words = ["Hello", " ", "World"]
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            for word in words {
                CocoString(word) { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "Hello World")
    }

    func testBuilder_ForIn_EmptyArray() {
        let words: [String] = []
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Start") { _ in noAttributes }
            for word in words {
                CocoString(word) { _ in noAttributes }
            }
            CocoString("End") { _ in noAttributes }
        }
        XCTAssertEqual(result.string, "StartEnd")
    }

    func testBuilder_ForIn_WithAttributes() {
        let segments = ["Red", "Green", "Blue"]
        let colors: [UIColor] = [.red, .green, .blue]
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            for (text, color) in zip(segments, colors) {
                CocoString(text) { _ in
                    CocoAttribute.foregroundColor(color)
                }
            }
        }
        XCTAssertEqual(result.string, "RedGreenBlue")
        var range = NSRange(location: 0, length: 0)
        let r = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(r?.isEqual(UIColor.red) ?? false)
    }

    // MARK: - CocoStringBuilder (attributes): if

    func testAttributeBuilder_IfTrue_IncludesAttribute() {
        let addRed = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Text") { _ in
                if addRed {
                    CocoAttribute.foregroundColor(.red)
                }
            }
        }
        XCTAssertEqual(result.string, "Text")
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertNotNil(color)
        XCTAssertTrue(color?.isEqual(UIColor.red) ?? false)
    }

    func testAttributeBuilder_IfFalse_OmitsAttribute() {
        let addRed = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Text") { _ in
                if addRed {
                    CocoAttribute.foregroundColor(.red)
                }
            }
        }
        XCTAssertEqual(result.string, "Text")
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertNil(color)
    }

    // MARK: - CocoStringBuilder: if-else

    func testAttributeBuilder_IfElse_ThenBranch() {
        let useRed = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Colored") { _ in
                if useRed {
                    CocoAttribute.foregroundColor(.red)
                } else {
                    CocoAttribute.foregroundColor(.blue)
                }
            }
        }
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.red) ?? false)
    }

    func testAttributeBuilder_IfElse_ElseBranch() {
        let useRed = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Colored") { _ in
                if useRed {
                    CocoAttribute.foregroundColor(.red)
                } else {
                    CocoAttribute.foregroundColor(.blue)
                }
            }
        }
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.blue) ?? false)
    }

    // MARK: - CocoStringBuilder: switch

    func testAttributeBuilder_Switch_FirstCase() {
        let style = 0
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Styled") { _ in
                switch style {
                case 0:
                    CocoAttribute.foregroundColor(.red)
                case 1:
                    CocoAttribute.foregroundColor(.blue)
                default:
                    CocoAttribute.foregroundColor(.black)
                }
            }
        }
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.red) ?? false)
    }

    func testAttributeBuilder_Switch_DefaultCase() {
        let style = 10
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Styled") { _ in
                switch style {
                case 0:
                    CocoAttribute.foregroundColor(.red)
                case 1:
                    CocoAttribute.foregroundColor(.blue)
                default:
                    CocoAttribute.foregroundColor(.black)
                }
            }
        }
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.black) ?? false)
    }

    // MARK: - CocoStringBuilder: for-in

    func testAttributeBuilder_ForIn_MultipleAttributes() {
        let colors: [UIColor] = [.red, .green, .blue]
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("RGB") { _ in
                for color in colors {
                    CocoAttribute.foregroundColor(color)
                }
            }
        }
        XCTAssertEqual(result.string, "RGB")
        // Last applied wins for full range
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertNotNil(color)
        XCTAssertTrue(color?.isEqual(UIColor.blue) ?? false)
    }

    func testAttributeBuilder_ForIn_WithConditional() {
        let shouldAddKern = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Kern") { _ in
                CocoAttribute.foregroundColor(.black)
                if shouldAddKern {
                    CocoAttribute.kern(2.0)
                }
            }
        }
        var range = NSRange(location: 0, length: 0)
        let kern = result.attribute(.kern, at: 0, effectiveRange: &range) as? CGFloat
        XCTAssertEqual(kern, 2.0)
    }

    // MARK: - Mixed: top-level control flow + attribute control flow

    func testBuilder_Mixed_IfAtTopLevel_AndIfInAttributes() {
        let showFirst = true
        let useRed = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if showFirst {
                CocoString("First") { _ in
                    if useRed {
                        CocoAttribute.foregroundColor(.red)
                    } else {
                        CocoAttribute.foregroundColor(.blue)
                    }
                }
            } else {
                CocoString("Second") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "First")
        var range = NSRange(location: 0, length: 0)
        let color = result.attribute(.foregroundColor, at: 0, effectiveRange: &range) as? UIColor
        XCTAssertTrue(color?.isEqual(UIColor.blue) ?? false)
    }

    func testBuilder_Mixed_ForInAtTop_WithSwitchInAttributes() {
        let items: [(String, Int)] = [("A", 0), ("B", 1), ("C", 2)]
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            for (text, code) in items {
                CocoString(text) { _ in
                    switch code {
                    case 0:
                        CocoAttribute.foregroundColor(.red)
                    case 1:
                        CocoAttribute.foregroundColor(.green)
                    default:
                        CocoAttribute.foregroundColor(.blue)
                    }
                }
            }
        }
        XCTAssertEqual(result.string, "ABC")
    }

    // MARK: - Empty / edge cases

    func testBuilder_OptionalOnly_Nil() {
        let condition = false
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if condition {
                CocoString("Never") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "")
    }

    func testBuilder_OptionalOnly_Some() {
        let condition = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            if condition {
                CocoString("Yes") { _ in noAttributes }
            }
        }
        XCTAssertEqual(result.string, "Yes")
    }

    // MARK: - Nested builders (ParagraphStyle, Shadow) with control flow

    func testAttributeBuilder_IfElse_WithParagraphStyle() {
        let useParagraphStyle = true
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Aligned") { _ in
                if useParagraphStyle {
                    ParagrapghStyle {
                        CocoParagraphStyle.textAlignment(.center)
                    }
                } else {
                    CocoAttribute.foregroundColor(.black)
                }
            }
        }
        XCTAssertEqual(result.string, "Aligned")
        var range = NSRange(location: 0, length: 0)
        let style = result.attribute(.paragraphStyle, at: 0, effectiveRange: &range) as? NSParagraphStyle
        XCTAssertNotNil(style)
        XCTAssertEqual(style?.alignment, .center)
    }

    func testAttributeBuilder_Switch_WithShadow() {
        let styleIndex = 1
        @CocoAttributedStringBuilder
        var result: NSAttributedString {
            CocoString("Shadow") { _ in
                switch styleIndex {
                case 0:
                    CocoAttribute.foregroundColor(.gray)
                case 1:
                    Shadow {
                        CocoShadow.shadowOffset(CGSize(width: 1, height: 1))
                        CocoShadow.shadowColor(.darkGray)
                    }
                default:
                    CocoAttribute.underlineStyle(.single)
                }
            }
        }
        XCTAssertEqual(result.string, "Shadow")
        var range = NSRange(location: 0, length: 0)
        let shadow = result.attribute(.shadow, at: 0, effectiveRange: &range) as? NSShadow
        XCTAssertNotNil(shadow)
    }
}
