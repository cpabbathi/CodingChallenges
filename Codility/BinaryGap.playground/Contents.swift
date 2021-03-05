import Foundation

public func solution(_ N : Int) -> Int {
    let binaryString = String(N, radix: 2)
    var matchingSubstringRange: Range<String.Index>?
    var startIndex: String.Index
    var maxLength = 0
    
    startIndex = binaryString.startIndex
    checkingloop: repeat {
        
        matchingSubstringRange = binaryString.range(of: "10+1", options: .regularExpression, range: startIndex ..< binaryString.endIndex)
        if let matchingSubstringRange = matchingSubstringRange {
            if String(binaryString[matchingSubstringRange]).count - 2 > maxLength {
                maxLength = String(binaryString[matchingSubstringRange]).count - 2
            }
            
            startIndex = binaryString.index(before: matchingSubstringRange.upperBound)
        } else {
            break checkingloop
        }
    } while startIndex < binaryString.endIndex
    
    return maxLength
}

//print(Int(String(0b10000101, radix: 10)))

precondition(solution(66) == 4, "PASS")
precondition(solution(9) == 2, "PASS")
precondition(solution(529) == 4, "PASS")
assert(solution(20) == 1, "Answer should be 1")
solution(529) // 4
solution(20) // 1
solution(15) // 0
solution(32) // 0
solution(1041) // 5
solution(145) // 3
solution(133) // 4
print(String(145, radix: 2))
