//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution(_ n: Int) -> Int {
    
    var dp : [Int] = Array(repeating: 1, count: 10); dp[0] = 0
    var tmp : [Int] = Array(repeating: 0, count: 10)
    
    let res: Int = Int(pow(10.0,9))
    
    if n == 1 { return dp.reduce(0, +)}
    
    for _ in 2 ... n {
        for idx in 0 ... 9 {
            switch idx {
            case 0:
                tmp[idx] = dp[idx+1]%res
            case 9:
                tmp[idx] = dp[idx-1]%res
            default:
                tmp[idx] = (dp[idx-1] + dp[idx+1])%res
            }
        }
        dp = tmp
    }
    
    return dp.reduce(0, +)%res
}

let n = Int(readLine()!)!

print(solution(n))
