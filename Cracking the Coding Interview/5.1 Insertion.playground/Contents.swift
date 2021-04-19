import Foundation

func insertMintoN(n: Int, m: Int, i: Int, j: Int) -> Int {
    var mask = -1
    
    mask <<= (j + 1)
    
    let rightMask = (1 << i) - 1
    mask |= rightMask
    
    let n = n & mask
    let m = m << i
    
    return m | n
}

String(insertMintoN(n: Int("10000000000", radix: 2)!, m: Int("10011", radix: 2)!, i: 2, j: 6), radix: 2)
String(insertMintoN(n: Int("11111111111", radix: 2)!, m: Int("10011", radix: 2)!, i: 2, j: 6), radix: 2)
