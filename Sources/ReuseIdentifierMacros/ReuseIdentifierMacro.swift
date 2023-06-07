import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum ReuseIdentifierError: CustomStringConvertible, Error {
    case onlyApplicableToClass
    
    var description: String {
        switch self {
        case .onlyApplicableToClass: return "@ReuseIdentifier can only be applied to a class"
        }
    }
}

public struct ReuseIdentifierMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        guard let classDecl = declaration.as(ClassDeclSyntax.self) else {
            throw ReuseIdentifierError.onlyApplicableToClass
        }

        let reuseID = try VariableDeclSyntax("static var reuseID: String") {
            StringLiteralExprSyntax(content: classDecl.identifier.text)
        }

        return [
            DeclSyntax(reuseID)
        ]
    }
}

@main
struct ReuseIdentifierPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ReuseIdentifierMacro.self,
    ]
}
