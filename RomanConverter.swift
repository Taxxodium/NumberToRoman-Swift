class RomanConverter {
    // I, IV, V, IX, X, XL, L, XC, C, CD, D, CM
    
    func convert(input: Int) -> String? {
        if input < 0 || input > 4999 {
            print("Input \(input) is out range!")
            return nil
        }
        
        let inputString = "\(input)"
        let inputStringLength = inputString.distance(from: inputString.startIndex, to: inputString.endIndex)
        
        var result = ""
        var currentLength = inputStringLength
        
        repeat {
            let pos = currentLength
            let startIndex = inputString.index(inputString.startIndex, offsetBy: inputStringLength-currentLength)
            let endIndex = inputString.index(inputString.startIndex, offsetBy: inputStringLength-currentLength+1)
            let range = startIndex..<endIndex
            let numString = inputString.substring(with: range)
            
            if let num = Int(numString) {
                var romanChar = ""
                var middle = ""
                var next = ""
                
                switch pos {
                case let x where x >= 4:
                    romanChar = "M"
                    middle = ""
                    next = ""
                case 3:
                    romanChar = "C"
                    middle = "D"
                    next = "M"
                case 2:
                    romanChar = "X"
                    middle = "L"
                    next = "C"
                case 1:
                    romanChar = "I"
                    middle = "V"
                    next = "X"
                default:
                    break
                }
                
                
                if num > 5 {
                    if num == 9 {
                        result += "\(romanChar)\(next)"
                    } else {
                        result += append("\(romanChar)", times: num-5, prefix: "\(middle)")
                    }
                } else {
                    if num == 5 && !middle.isEmpty {
                        result += "\(middle)"
                    } else if num == 4 && !middle.isEmpty {
                        result += "\(romanChar)\(middle)"
                    } else {
                        result += append("\(romanChar)", times: num)
                    }
                }
            }
            
            currentLength -= 1
        } while currentLength > 0
        
        return result.isEmpty ? nil : result
    }
    
    fileprivate func append(_ character: String, times: Int, prefix: String = "") -> String {
        var result = prefix
        
        for _ in 0..<times {
            result += character
        }
        
        return result
    }
}
