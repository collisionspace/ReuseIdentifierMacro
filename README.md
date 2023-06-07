# ReuseIdentifierMacro
A Reuse Identifier Macro that is useful in generation of a reuse id for your UICollectionViewCells and UITableViewCells

To use within your projects, you'll need SPM and import this package in.

Example usage within your project
```
import ReuseIdentifier

@ReuseIdentifier
class CarouselCollectionViewCell: UICollectionViewCell {}

collectionView.register(
    CarouselCollectionViewCell.self,
    forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseIdentifier
)
```
