//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/29.
//
import Foundation

let n = Int(readLine()!)!

var a = readLine()!.split(separator: " ").map{Int($0)!}
var b = readLine()!.split(separator: " ").map{Int($0)!}

a.sort(by: {$0 < $1})
b.sort(by: {$0 > $1})

var sum = 0
for i in 0...n-1 {
    sum += (a[i] * b[i])
}
print(sum)
