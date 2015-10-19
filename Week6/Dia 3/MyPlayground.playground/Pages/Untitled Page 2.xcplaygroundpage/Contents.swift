import Foundation
import UIKit

var j: Float = 0.0

for i in 0...100 {
    j = (Float(i) * 6.0) * sin(Float(i))
}

j

let url: NSURL? = NSURL(string: "http://1.bp.blogspot.com/-_KJ_9QpqO-0/VbxGhieeWkI/AAAAAAAAvss/sNrELf6h5HE/s1600/Betty_Boop_Black_red.png")

let url1: NSURL? = NSURL (string: "http://www.telize.com/geoip/113.154.97.34")

let dataJSON = NSData(contentsOfURL: url1!)

do {
    let json = try NSJSONSerialization.JSONObjectWithData(dataJSON!, options: NSJSONReadingOptions.AllowFragments)
}
catch {
    error
}

let v: UIView = UIView(frame: CGRectMake(10, 10, 100, 100))
v.backgroundColor = UIColor.redColor()
v.layer.cornerRadius = 100.0
v

UIView.animateWithDuration(4.0) { () -> Void in
    v.backgroundColor = UIColor.brownColor()
}
v

extension UIColor {
    static func 🐤() -> UIColor {
        return UIColor.yellowColor()
    }
}

let subView = UIView(frame: CGRectMake(0, 0, 60, 60))
subView.backgroundColor = UIColor.🐤()
subView
v.addSubview(subView)
v

let redView = UIView(frame: CGRectMake(10, 10, 20, 20))
redView.backgroundColor = UIColor.redColor()

subView.addSubview(redView)

v