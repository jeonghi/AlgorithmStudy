//
//  main.swift
//  CodingTest
//2
//  Created by JH Park on 2023/07/29.
//
import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n+1)
var dp = Array(repeating: 0, count: n+1)

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

arr.sort(by: {$0 < $1})

for i in 1...n {
    dp[i] = arr[i] * (n - i + 1)
}

print(dp.max()!)
