import Foundation

// Complete the lonelyinteger function below.
func lonelyinteger(a: [Int]) -> Int {
    return a.reduce(0) { partial, next in
        partial ^ next
    }
}

lonelyinteger(a: [1]) == 1
lonelyinteger(a: [1,1,2]) == 2
lonelyinteger(a: [0,0,1,2,1]) == 2

var a = Array(0 ... 100)
a += Array(0 ... 100)
a.remove(at: Int.random(in: 0 ... 100))
lonelyinteger(a: a)
