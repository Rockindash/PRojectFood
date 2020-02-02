import UIKit

final class RecipeCell: UITableViewCell {
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var subtitleLabel: UILabel!

  func configure(with recipe: Recipe) {
    titleLabel.text = recipe.label
  }
}
