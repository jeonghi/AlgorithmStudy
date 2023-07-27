//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Void {
    
    let tc = readLine()!.split(separator: " ").map{Int($0)!}
    
    let n = tc[0] // 5
    let m = tc[1] // 3
    
    var dp : [Int] = Array(repeating: 0, count: n+1)
    let numList = readLine()!.split(separator: " ").map{Int($0)!} // 5개의 시퀀스
    
    
    (1...n).forEach {
        dp[$0] = dp[$0-1] + numList[$0-1]
    }
    
    for _ in 1 ... m {
        let section = readLine()!.split(separator: " ").map{Int($0)!}
        let from = section[0]
        let to = section[1]
        print(dp[to] - dp[from-1])
    }
}

solution()
