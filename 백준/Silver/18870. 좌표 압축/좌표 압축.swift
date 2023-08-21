//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/21.
//
import Foundation

let _ = Int(readLine()!)!
let arr: [Int] = readLine()!.split(separator: " ").map{Int($0)!} // 입력 배열
let sortedArr: [Int] = arr.sorted(by: {$0 < $1}) // 정렬된 배열
var uniqueArr: [Int] = []
for i in sortedArr {
    if( uniqueArr.isEmpty || i != uniqueArr.last! ){ uniqueArr.append(i) }
}

// 정렬된 위치 반환 -> 원소의 인덱스 == 원소보다 작은 원소들의 갯수
func binary_search( _ element: Int, _ start: Int, _ end: Int) -> Int {
    if(start > end) { return 0 }
    let mid = (start+end)/2
    let curr = uniqueArr[mid]
    if(curr == element){return mid}
    else if(curr > element){return binary_search(element, start, mid-1)}
    else{return binary_search(element, mid+1, end)}}

for query in arr {
    print(binary_search(query, 0, uniqueArr.count-1), terminator: " ")
}
