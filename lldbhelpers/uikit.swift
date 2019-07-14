import UIKit

extension UIViewController {
    static func hierarchy() {
        let root = UIApplication.shared.keyWindow!.rootViewController!
        print(root.hierarchy())
    }

    func hierarchy(indent: Int = 0) -> String {
        let indentString = String(repeating: " ", count: indent)
        var hierarchy = "\(indentString)\(String(describing: self))\n"
        for child in self.children {
            hierarchy += child.hierarchy(indent: indent + 4)
        }

        return hierarchy
    }
}

