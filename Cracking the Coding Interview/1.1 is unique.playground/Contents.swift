import Foundation

func isUniqueWithBitVector(string: String) -> Bool {
    let string = string.lowercased()
    var alphabetChecker = 0
    let aAscii = Character("a").asciiValue!
    
    for char in string {
        let charIndex = 1 << (char.asciiValue! - aAscii)
         
        if alphabetChecker & charIndex > 0 {
            return false
        } else {
            alphabetChecker |= charIndex
        }
    }
    return true
}

let function = isUniqueWithBitVector(string:)
function("a") == true
function("") == true
function("aba") == false
function("ab")
function("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz") == false
function("aSA") == false

for char in ("AZaz019") {
    print(char, char.asciiValue)
}

print(Character("a").asciiValue)

