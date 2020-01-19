import UIKit

public extension UIDevice {
    /// Get the model of the device. Such as: iPhone12,5(iPhone11ProMax)
    var deviceModel: String {
        var systemInfo: utsname = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    
    /// 是有刘海
    var hasNotch: Bool {
        guard #available(iOS 11.0, *),
            let topInset = UIApplication.shared.keyWindow?.safeAreaInsets.top else {
            return false
        }
        
        return topInset > 20
    }
    
    /// 是否是全面屏 (iPhoneX 、iPhone XS 、iPhone 11 ...)
    var isFullScreenDisplay: Bool {
        guard #available(iOS 11.0, *),
            let bottomInset = UIApplication.shared.keyWindow?.safeAreaInsets.bottom else {
            return false
        }
        
        return bottomInset > 0
    }
}
