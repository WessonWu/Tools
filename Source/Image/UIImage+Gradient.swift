import UIKit

public extension UIImage {
    class func simpleGradientImage(size: CGSize, startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) -> UIImage? {
        guard let startColorComponents = startColor.cgColor.components,
            let endColorComponents = endColor.cgColor.components else {
            return nil
        }
        let colorComponents: [CGFloat]
            = [startColorComponents, endColorComponents].flatMap { $0 }
        let locations: [CGFloat] = [0, 1]
        
        if let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                        colorComponents: colorComponents,
                                        locations: locations,
                                        count: 2) {
            return valueOf(gradient: gradient, size: size, startPoint: startPoint, endPoint: endPoint)
        }
        return nil
    }
}
