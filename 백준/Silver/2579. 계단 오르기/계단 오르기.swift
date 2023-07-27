//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: 2)
    for i in 1...n {
        let score = Int(readLine()!)!
        if(i == 1){
            dp[0][i] = score
            continue
        }
        dp[0][i] = max(dp[0][i-2], dp[1][i-2]) + score
        dp[1][i] = dp[0][i-1] + score
    }
    return max(dp[0][n],dp[1][n])
}

print(solution())
