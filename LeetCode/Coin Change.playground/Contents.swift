import Foundation

/*
 https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3668/
 
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.
 
 */

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        let coins: [Int] = coins.sorted().reversed()
        var numberOfCoins = [Int: Int]()
        var remainingAmount = amount
        
        coins.forEach {
            numberOfCoins[$0] = 0
        }
        var coinIndex = 0
        
//        print(coins, remainingAmount)
        while coinIndex < coins.count {
//            print("Looping for: ", coinIndex)
            let coinAmount = coins[coinIndex]
            if coinAmount < remainingAmount {
                numberOfCoins[coinAmount] = remainingAmount / coinAmount
                remainingAmount = remainingAmount % coinAmount
                
                print(numberOfCoins, remainingAmount)
                
                if remainingAmount == 0 {
                    return numberOfCoins.reduce(0) {
                        $0 + $1.value
                    }
                }
            }
            
            coinIndex += 1
//            print("CoinIndex", coinIndex)
            if coinIndex == coins.count {
//                print("Reached the end")
                remainingAmount += numberOfCoins[coinAmount]! * coinAmount
                numberOfCoins[coinAmount] = 0
                
                var prevIndex = coinIndex - 2
                while prevIndex >= 0 && numberOfCoins[coins[prevIndex]] == 0 {
//                    print("PrevIndex = ", prevIndex)
                    prevIndex -= 1
                    
                    if prevIndex == -1 {
                        return -1
                    }
                }
                
                numberOfCoins[coins[prevIndex]]! -= 1
                coinIndex = prevIndex + 1
                remainingAmount += coins[prevIndex]
            }
        }
        
        return -1
    }
}

let solution = Solution()
//solution.coinChange([1,2,5], 11) == 3
//solution.coinChange([2], 3) == -1
//solution.coinChange([1], 0) == 0
//solution.coinChange([1], 1) == 1
//solution.coinChange([1], 2) == 2
//solution.coinChange([], 2) == -1
//solution.coinChange([2], 1) == -1
solution.coinChange([186,419,83,408], 6249)
