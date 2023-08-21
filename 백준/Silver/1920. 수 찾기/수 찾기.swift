//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/20.
//
import Foundation

let _ = Int(readLine()!)
var a: [Int] = readLine()!.split(separator: " ").map{Int($0)!}

a.sort(by: {$0 < $1}) // 입력 값을 오름차순 정렬

func isExisting(_ element: Int, _ start: Int, _ end: Int) -> Bool {
    if(start > end){ return false }
    let mid: Int = (start+end)/2
    let curr = a[mid]
    
    if(curr == element){
        return true
    }else if(curr > element){
        return isExisting(element, start, mid-1)
    }else{
        return isExisting(element, mid+1, end)
    }
}

let _ = Int(readLine()!)!
var query: [Int] = readLine()!.split(separator: " ").map{Int($0)!} // 질의 리스트

// 차례대로 질의
for q in query {
    print((isExisting(q, 0, a.count-1) ? 1 : 0))
}
