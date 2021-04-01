import Foundation

/*
 https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3668/
 
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.
 
 */

class Solution {
    var minCoinCountArray = [Int]()
    var coins = [Int]()
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount != 0 else { return 0 }
        
        self.coins = coins
        self.minCoinCountArray = Array(repeating: 0, count: amount)
        
        let returnVal = coinChangeTree(amount: amount)
        return returnVal
    }
    
    private func coinChangeTree(amount: Int) -> Int {
        guard amount != 0 else { return 0 }
        guard amount > 0 else { return -1 }
        if minCoinCountArray[amount - 1] != 0 { return minCoinCountArray[amount - 1] }
        
        var minCoins = Int.max
        for coin in coins {
            let minCoinCountForSubTree = coinChangeTree(amount: amount - coin)
            if minCoinCountForSubTree >= 0 && minCoinCountForSubTree < minCoins {
                minCoins = minCoinCountForSubTree + 1
            }
        }

        if minCoins != Int.max {
            minCoinCountArray[amount - 1] = minCoins
            return minCoins
        } else {
            minCoinCountArray[amount - 1] = -1
            return -1
        }
    }
}

//let solution = Solution()
//solution.coinChange([1,2,5], 11) == 3
//solution.coinChange([2,5], 5) == 1
//solution.coinChange([2,5], 4) == 2
//solution.coinChange([2], 3) == -1
//solution.coinChange([1], 0) == 0
//solution.coinChange([1], 1) == 1
//solution.coinChange([1], 2) == 2
//solution.coinChange([], 2) == -1
//solution.coinChange([2], 1) == -1
//solution.coinChange([186,419,83,408], 6249) == 20


public class Solution2 {
    public func coinChange(coins: [Int], amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        
        dp[0] = 0
        print(coins, dp)
        for i in 1 ... amount {
            for j in 0 ..< coins.count {
                if coins[j] <= i {
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                    print("i =", i, " j =", j, "dp[prev] = ",  dp[i - coins[j]], "dp[",i,"] =", dp[i], "dp =", dp)
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

let solution2 = Solution2()
solution2.coinChange(coins: [1,2,5], amount: 11) == 3
//solution2.coinChange(coins: [2,5], amount: 5) == 1
//solution2.coinChange(coins: [2,5], amount: 4) == 2
//solution2.coinChange(coins: [2], amount: 3) == -1
//solution2.coinChange(coins: [1], amount: 0) == 0
//solution2.coinChange(coins: [1], amount: 1) == 1
//solution2.coinChange(coins: [1], amount: 2) == 2
//solution2.coinChange(coins: [], amount: 2) == -1
//solution2.coinChange(coins: [2], amount: 1) == -1
//solution2.coinChange(coins: [186,419,83,408], amount: 6249) == 20
