import UIKit

protocol StoryboardBased {}

extension StoryboardBased where Self: UIViewController {
    static func instanceFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: className, bundle: nil)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("InitialViewController was not found in storyboard named \(className).")
        }
        guard let instance = initialViewController as? Self else {
            fatalError("InitialViewController was not an instance of \(className)")
        }
        return instance
    }
}

extension UIViewController: StoryboardBased {}

protocol NibBased {}

extension NibBased where Self: UIView {
    static func instanceFromNib(named nibName: String) -> Self {
        guard let firstView = UINib(nibName: nibName, bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as? UIView else {
            fatalError("No view found in \(nibName)")
        }
        guard let view = firstView as? Self else {
            fatalError("First view is not an instance of " + nibName + ", " + className + " Actual class: " + firstView.className)
        }
        return view
    }
}

extension UIView: NibBased {}
