import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import ReuseIdentifierMacros

let testMacros: [String: Macro.Type] = [
    "ReuseIdentifier": ReuseIdentifierMacro.self,
]

final class ReuseIdentifierTests: XCTestCase {
    func testExpanded() {
        assertMacroExpansion(
            """
            @ReuseIdentifier
            class CarouselCollectionViewCell {
            }
            """,
            expandedSource: """

            class CarouselCollectionViewCell {
                static var reuseIdentifier: String {
                    "CarouselCollectionViewCell"
                }
            }
            """,
            macros: testMacros
        )
    }

    func testWrongType() {
        assertMacroExpansion(
            """
            @ReuseIdentifier
            enum CarouselCollectionViewCell {
            }
            """,
            expandedSource: """

            enum CarouselCollectionViewCell {
            }
            """,
            diagnostics: [
                DiagnosticSpec(message: "@ReuseIdentifier can only be applied to a class", line: 1, column: 1)
            ],
            macros: testMacros
        )
    }
}
