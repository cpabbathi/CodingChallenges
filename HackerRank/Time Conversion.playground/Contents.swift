import Foundation

// https://www.hackerrank.com/challenges/time-conversion/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

func timeConversion(s: String) -> String {
    let ampm = s[s.range(of: "[AP]M$", options: .regularExpression)!]
    let hour = Int(s[s.range(of: "^[0-9]+", options: .regularExpression)!])!
    let remaining = s[s.range(of: ":[0-9]+:[0-9]+", options: .regularExpression)!]
    
    
    if ampm == "AM" && hour == 12 {
        return "00" + remaining
    }
    
    if ampm == "PM" && hour >= 1 && hour < 12 {
        return "\(hour + 12)" + remaining
    }
    
    return String(s[s.range(of: "[0-9]+:[0-9]+:[0-9]+", options: .regularExpression)!])
}

timeConversion(s: "12:11:01AM")
timeConversion(s: "1:11:01AM")
timeConversion(s: "12:11:01PM")
timeConversion(s: "1:11:01PM")
timeConversion(s: "11:59:59PM")
