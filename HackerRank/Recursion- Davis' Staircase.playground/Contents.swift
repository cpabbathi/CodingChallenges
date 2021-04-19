import Foundation

// https://www.hackerrank.com/challenges/ctci-recursive-staircase/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=recursion-backtracking

// Complete the stepPerms function below.
func stepPerms(n: Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    } else if n == 3 {
        return 4
    } else {
        return (stepPerms(n: n - 1) + stepPerms(n: n - 2) + stepPerms(n: n - 3)) % 10000000007
    }
}

guard let s = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...s {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let res = stepPerms(n: n)

    print(res)
}
