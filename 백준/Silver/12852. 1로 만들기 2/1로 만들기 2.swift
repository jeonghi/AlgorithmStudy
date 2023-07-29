//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/07/29.
//

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!
    let sz = Int(pow(10.0, 6))
    var arr = [Int](repeating: 0, count: sz+1)
    var trace = [Int](repeating: 0, count: sz+1)
    arr[1] = 0
    for i in 2...n+1 {
        if(i > n){break}
        
        arr[i] = arr[i-1] + 1
        trace[i] = i-1
        
        if(i%2 == 0){
            let tmp = min(arr[i/2]+1,arr[i])
            if(tmp < arr[i]) {trace[i] = i/2; arr[i] = tmp}
        }
        if(i%3 == 0){
            let tmp = min(arr[i/3]+1,arr[i])
            if(tmp < arr[i]) {trace[i] = i/3; arr[i] = tmp}
        }
    }
    
    print(arr[n])
    
    var idx = n; print(n, terminator: " ")
    while(idx > 1){
        print(trace[idx], terminator: " ")
        idx = trace[idx]
    }
}

solution()
