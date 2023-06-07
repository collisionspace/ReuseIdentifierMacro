/// A macro that produces a reuseIdentifier that's usually required
/// for UICollectionViewCells and UITableViewCells
///
///     @ReuseIdentifier
///     class CarouselCollectionViewCell: UICollectionViewCell {}
///
///     CarouselCollectionViewCell.reuseID
///
/// produces a static String,`CarouselCollectionViewCell`
@attached(member, names: named(reuseID))
public macro ReuseIdentifier() = #externalMacro(module: "ReuseIdentifierMacros", type: "ReuseIdentifierMacro")
