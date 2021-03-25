import Foundation

// https://www.hackerrank.com/challenges/hamming-distance/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

class Solution {
    var string: String
    
    init(string: String) {
        self.string = string
    }
    
    func process(query: String) {
        let queryParts = query.components(separatedBy: " ")
        
        switch queryParts[0] {
        case "C":
            CQuery(l: Int(queryParts[1])! - 1, r: Int(queryParts[2])! - 1, ch: queryParts[3])
        case "S":
            SQuery(from1: Int(queryParts[1])! - 1, to1: Int(queryParts[2])! - 1, from2: Int(queryParts[3])! - 1, to2: Int(queryParts[4])! - 1)
        case "R":
            RQuery(l: Int(queryParts[1])! - 1, r: Int(queryParts[2])! - 1)
        case "W":
            WQuery(l: Int(queryParts[1])! - 1, r: Int(queryParts[2])! - 1)
        case "H":
            HQuery(l1: Int(queryParts[1])! - 1, l2: Int(queryParts[2])! - 1, len: Int(queryParts[3])!)
        default:
            break
        }
    }
    
    internal func getIndex(of position: Int) -> String.Index {
        return string.index(string.startIndex, offsetBy: position)
    }
    
    // C: all the symbols in the string, starting at the lth, ending at the rth become equal to ch;
    internal func CQuery(l: Int, r: Int, ch: String) {
        let lIndex = getIndex(of: l)
        let rIndex = getIndex(of: r)
        string.replaceSubrange(lIndex ... rIndex, with: String(repeating: ch, count: r - l + 1))
    }
    
    // S: swap two consecutive fragments of the string, where the first is denoted by a substring starting from l1 ending at r1 and the second is denoted by a substring starting at l2 ending at r2;
    internal func SQuery(from1: Int, to1: Int, from2: Int, to2: Int) {
        let from1Index = getIndex(of: from1)
        let to1Index = getIndex(of: to1)
        let from2Index = getIndex(of: from2)
        let to2Index = getIndex(of: to2)
        
        let firstPart = "\(string[..<from1Index])"
        let secondPart = "\(string[from1Index ... to1Index])"
        let thirdPart = "\(string[string.index(after: to1Index) ..< from2Index])"
        let fourthPart = "\(string[from2Index ... to2Index])"
        let fifthPart = "\(string[string.index(after: to2Index) ..< string.endIndex])"
        
        string = firstPart + fourthPart + thirdPart + secondPart + fifthPart
    
    }
    
    // R: reverse the fragment of the string that starts at the lth symbol and ends at the rth one;
    internal func RQuery(l: Int, r: Int) {
        let lIndex = getIndex(of: l)
        let rIndex = getIndex(of: r)
        
        let reversedSubString = String(string[lIndex ... rIndex].reversed())
        
        string.replaceSubrange(lIndex ... rIndex, with: reversedSubString)
    }
    
    // W: output the substring of the string that starts at the lth symbol and ends at the rth one;
    internal func WQuery(l: Int, r: Int) {
        print(string[getIndex(of: l) ... getIndex(of: r)])
    }
    
    // H: output the Hamming distance between the consecutive substrings that starts at l1 and l2 respectively and have the length of len.
    internal func HQuery(l1: Int, l2: Int, len: Int) {
        var firstIndex = getIndex(of: l1)
        var secondIndex = getIndex(of: l2)
        
        var hammingDistance = 0
        for _ in 1 ... len {
            if string[firstIndex] != string[secondIndex] {
                hammingDistance += 1
            }
            
            firstIndex = string.index(after: firstIndex)
            secondIndex = string.index(after: secondIndex)
        }
        
        print(hammingDistance)
    }
}

//let lengthOfString = Int(readLine()!)!
//let string = readLine()!
//let numberOfQueries = Int(readLine()!)!
//
//let s = Solution(string: string)
//
//var queries = [String]()
//for _ in 1 ... numberOfQueries {
//    queries.append(readLine()!)
//}

let lengthOfString = 1000
let string: String = String((String(repeating: "a", count: 500) + String(repeating: "b", count: 500)).shuffled())
let numberOfQueries = 6

let s = Solution(string: string)

let queries = ["R 105 512",
               "W 300 348",
               "C 500 508 a",
               "H 200 100 9",
               "S 5 90 100 150",
               "H 105 210 9"]

for query in queries {
    s.process(query: query)
}
