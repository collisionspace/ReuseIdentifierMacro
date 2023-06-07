/// A macro that produces a reuseIdentifier that's usually required
/// for UICollectionViewCells and UITableViewCells
///
///     @ReuseIdentifier
///     class CarouselCollectionViewCell: UICollectionViewCell {}
///
///     CarouselCollectionViewCell.reuseIdentifier
///
/// produces a static String,`CarouselCollectionViewCell`
@attached(member, names: named(reuseIdentifier))
public macro ReuseIdentifier() = #externalMacro(module: "ReuseIdentifierMacros", type: "ReuseIdentifierMacro")
