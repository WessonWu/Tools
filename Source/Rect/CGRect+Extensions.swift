import CoreGraphics

public extension CGRect {
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
    var topCenter: CGPoint { return CGPoint(x: midX, y: minY) }
    var bottomCenter: CGPoint { return CGPoint(x: midX, y: maxY) }
    var leftTop: CGPoint { return CGPoint(x: minX, y: minY) }
    var rightTop: CGPoint { return CGPoint(x: maxX, y: minY) }
    var leftBottom: CGPoint { return CGPoint(x: minX, y: maxY) }
    var rightBottom: CGPoint { return CGPoint(x: maxX, y: maxY) }
    var leftCenter: CGPoint { return CGPoint(x: minX, y: midY) }
    var rightCenter: CGPoint { return CGPoint(x: maxX, y: midY) }
}

public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: CGPoint(x: originX, y: originY), size: size)
    }
    
    func edgeBy(insets: UIEdgeInsets) -> CGRect {
        var frame = self
        frame.origin.x += insets.left
        frame.size.width -= (insets.left + insets.right)
        frame.origin.y += insets.top
        frame.size.height -= (insets.top + insets.bottom)
        return frame
    }
}
