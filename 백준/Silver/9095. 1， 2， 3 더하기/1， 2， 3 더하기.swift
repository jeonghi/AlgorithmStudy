//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var arr = [Int](repeating: 0, count: n+3)
    arr[1] = 1
    arr[2] = 2
    arr[3] = 4
    for i in 1...n {
        if(i>n){break}
        if(i<=3){continue}
        arr[i] = arr[i-1] + arr[i-2] + arr[i-3]
    }
    return arr[n]
}

var tc = Int(readLine()!)!
for t in 1...tc {
    print(solution())
}
