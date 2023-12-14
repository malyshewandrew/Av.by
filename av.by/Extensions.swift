import Foundation
import UIKit

// MARK: - VIEW ADD SUBVIEWS:
extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

// MARK: - STACKVIEW ADD SUBVIEWS:
extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
