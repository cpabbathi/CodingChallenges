import Foundation

// https://www.hackerrank.com/challenges/ctci-fibonacci-numbers/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=recursion-backtracking

func fibonacci (n: Int) -> Int {
    if n <= 1 { return n }
    
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}

// read the integer n
let n = Int(readLine()!)!

// print the nth fibonacci number
print(fibonacci(n: n))
