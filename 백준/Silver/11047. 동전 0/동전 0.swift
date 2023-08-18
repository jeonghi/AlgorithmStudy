//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/29.
//
import Foundation

var a = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let n = a[0]; var k = a[1]

var tmp: [Int] = []

for _ in 1...n {
    tmp.append(Int(readLine()!)!)
}

tmp = tmp.filter{$0 <= k}

var idx = tmp.count-1
var cnt = 0

while(idx >= 0 && k > 0){
    if(k < tmp[idx]) {idx -= 1 ; continue;}
    k -= tmp[idx]
    cnt += 1
}

print(cnt)

