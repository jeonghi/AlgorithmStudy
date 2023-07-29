//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/29.
//

import Foundation

var nList: [Int] = []

let tc = Int(readLine()!)!
for _ in 1...tc {
    let n = Int(readLine()!)!
    nList.append(n)
}

let sz: Int = nList.max()!
var dp = [[Int]](repeating: [Int](repeating: 0, count: sz+2), count:2)

dp[0][0] = 1
dp[1][1] = 1

for i in 0 ... sz {
    if(i<2) { continue }
    dp[0][i] = dp[0][i-1] + dp[0][i-2]
    dp[1][i] = dp[1][i-1] + dp[1][i-2]
}

nList.forEach { n in
    print("\(dp[0][n]) \(dp[1][n])")
}
