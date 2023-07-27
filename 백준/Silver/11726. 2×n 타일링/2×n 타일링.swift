//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var dp : [Int] = Array(repeating: 0, count: n+1)
    
    for i in 1...n {
        if(i<=2){dp[i] = i;continue;}
        dp[i] = (dp[i-2] + dp[i-1])%10007
    }
    
    return dp[n]
}

print(solution())
