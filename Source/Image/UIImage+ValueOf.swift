import UIKit

public extension UIImage {
    class func renderImageIn(size: CGSize, actions: @escaping (CGContext) -> Void) -> UIImage? {
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: size).image { (context) in
                actions(context.cgContext)
            }
        }
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return nil
        }
        actions(ctx)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    class func valueOf(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) -> UIImage? {
        return renderImageIn(size: size) { (ctx) in
            ctx.setFillColor(color.cgColor)
            ctx.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    class func valueOf(gradient: CGGradient, size: CGSize, startPoint: CGPoint, endPoint: CGPoint, options: CGGradientDrawingOptions = .drawsBeforeStartLocation) -> UIImage? {
        return renderImageIn(size: size) { (ctx) in
            ctx.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: options)
        }
    }
}
