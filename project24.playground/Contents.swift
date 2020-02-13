import UIKit

var str = "12345"
str.hasPrefix("123")
str.hasSuffix("456")
str.contains("1")

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    
    subscript(i: Int) -> String {
        if self.count > i {
            return String(self[index(startIndex, offsetBy: i)])
        }
        print("Index out of range")
        return ""
    }
}

str[3]
str = str.deletingPrefix("123")
str[2]


let string = "Hell"
let attributedString = NSMutableAttributedString(string: string)

attributedString.addAttribute(.underlineStyle, value: 4, range: NSRange(location: 0, length: 4))

attributedString

