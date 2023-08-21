//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/21.
//
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 1...n {
    arr.append(Int(readLine()!)!)
}
arr.sort(by: {$0 < $1})

var two: [Int] = []
// O(N^2)
for i in 0...n-1 {
    for j in i...n-1 {
        two.append(arr[i] + arr[j])
    }
}
two.sort(by: {$0 < $1})

// 배열에 원소가 있는지 유무 판단 이분탐색
func binary_search( _ element: Int, _ start: Int, _ end: Int) -> Bool {
    if(start > end) { return false }
    let mid = (start+end)/2
    let curr = two[mid]
    if(curr == element){return true}
    else if(curr > element){return binary_search(element, start, mid-1)}
    else{return binary_search(element, mid+1, end)}
}

// O(N^2) * O(logN)
for i in (1...n-1).reversed() {
    for j in 0..<i {
        if(binary_search(arr[i]-arr[j], 0, two.count-1)){
            print(arr[i]);
            exit(0)
        }
    }
}
