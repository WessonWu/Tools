import UIKit

public extension UIColor {
    static let MASK_ALPHA: UInt32 = 0xFF000000
    static let MASK_RED  : UInt32 = 0x00FF0000
    static let MASK_GREEN: UInt32 = 0x0000FF00
    static let MASK_BLUE : UInt32 = 0x000000FF
    
    /// argb example: 0xFF494949
    class func valueOf(argb: UInt32) -> UIColor {
        let alpha = (argb >> 24) & 0xFF
        let red = (argb >> 16) & 0xFF
        let green = (argb >> 8) & 0xFF
        let blue = argb & 0xFF
        
        return UIColor(red: CGFloat(red) / 255,
                       green: CGFloat(green) / 255,
                       blue: CGFloat(blue) / 255,
                       alpha: CGFloat(alpha) / 255)
    }
    
    /// rgb example: 0x494949   (实际上被转为0xFF494949)
    @inlinable
    class func valueOf(rgb: UInt32) -> UIColor {
        return valueOf(argb: (rgb | MASK_ALPHA))
    }
    
    @inlinable
    class func valueOf(rgb: UInt32, alpha: CGFloat) -> UIColor {
        return valueOf(rgb: rgb).withAlphaComponent(alpha)
    }
}

public extension UIColor {
    typealias ARGBValue = (alpha: CGFloat, red: CGFloat, green: CGFloat, blue: CGFloat)
    
    var argbValue: ARGBValue {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (alpha, red, green, blue)
    }
}
