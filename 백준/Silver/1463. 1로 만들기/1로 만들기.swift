//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/27.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var arr = [Int](repeating: 0, count: 1000001)
    arr[1] = 0
    for i in 2...n+1 {
        if(i > n){break}
        
        arr[i] = arr[i-1] + 1
        
        if(i%2 == 0){arr[i] = min(arr[i/2]+1,arr[i])}
        if(i%3 == 0){arr[i] = min(arr[i/3]+1,arr[i])}
        
    }
    return arr[n]
}

print(solution())
