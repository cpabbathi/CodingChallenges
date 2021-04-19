import Foundation


// Convert a binary String into a decimal integer
let str = "0111"
let intFromBinary = Int(str, radix: 2)!

// convert a decimal integer to a binary string
let int = 12
let strFromInt = String(int, radix: 2)

let fromString = "10111"
let fromInt = Int(fromString, radix: 2)!
let toInt = fromInt >> 2
print(String(toInt, radix: 2))

String(5, radix: 2)
String(5 & 1 << 1, radix: 2)


// "10111" 2 3 -> 11
// >> 1
// << 1

let i = Int("10101", radix: 2)!
1 << 1
String(-1, radix: 2)
String(UInt.max, radix: 2)
String(repeating: "1", count: 64)
var a = 2
var b = 4
 
a = a ^ b
b = a ^ b
a = a ^ b

func stringOf1s(length: Int) -> String {
    return String((1 << length) - 1, radix: 2)
}
stringOf1s(length: 3) // Returns "111"

//static var bitWidth: Int
//The number of bits used for the underlying binary representation of values of this type.
//var bitWidth: Int
//The number of bits in the binary representation of this value.
//var nonzeroBitCount: Int
//The number of bits equal to 1 in this value’s binary representation.
//var leadingZeroBitCount: Int
//The number of leading zeros in this value’s binary representation.
//var trailingZeroBitCount: Int
//The number of trailing zeros in this value’s binary representation.
//var words: Int.Words
//A collection containing the words of this value’s binary representation, in order from the least significant to most significant.
//struct Int.Words
//A type that represents the words of this integer.

Int.bitWidth
var j = 4
j.bitWidth
j.nonzeroBitCount
j.leadingZeroBitCount
j.trailingZeroBitCount
print(j.words.count, j.words[0])

4.bitWidth - 4.leadingZeroBitCount

128 >> 1
128 << 1
