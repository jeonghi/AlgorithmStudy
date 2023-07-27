//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var dp : [Int] = Array(repeating: 0, count: 3)
    for _ in 1...n {
        let cost: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
        var tmp: [Int] = Array(repeating: 0, count: 3)
        tmp[0] = min(dp[1],dp[2]) + cost[0]
        tmp[1] = min(dp[0],dp[2]) + cost[1]
        tmp[2] = min(dp[0],dp[1]) + cost[2]
        dp = tmp
    }
    return min(dp[0],dp[1],dp[2])
}

print(solution())
