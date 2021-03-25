import Foundation

// https://www.hackerrank.com/challenges/30-operators/problem?h_r=email&unlock_token=efaf603a0e8dacd9b585aeca1364d676b8fdbe09&utm_campaign=30_days_of_code_continuous&utm_medium=email&utm_source=daily_reminder

func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) -> Void {
    let percentage: Double = 1 + Double(tip_percent) / 100.0 + Double(tax_percent) / 100.0
    print(Int(round(percentage * meal_cost)))
}

solve(meal_cost: 12, tip_percent: 22, tax_percent: 8)
