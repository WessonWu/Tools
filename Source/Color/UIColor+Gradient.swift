import UIKit

public extension UIColor {
    func gradientTo(_ color: UIColor, progress: CGFloat) -> UIColor {
        if progress <= 0 {
            return self
        }
        if progress >= 1 {
            return color
        }
        let argb1 = self.argbValue
        let argb2 = color.argbValue
        let red = argb1.red + (argb2.red - argb1.red) * progress
        let green = argb1.green + (argb2.green - argb1.green) * progress
        let blue = argb1.blue + (argb2.blue - argb1.blue) * progress
        let alpha = argb1.alpha + (argb2.alpha - argb1.alpha) * progress
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
