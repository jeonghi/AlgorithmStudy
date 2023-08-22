//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/22.
//

import Foundation

// 휴게소가 없는 구간의 최댓값을 최소로 한다? 최대한 구간 간격을 짧게 배치하려고 한다.
// 구간 간격을 최소화하여 배치하는 방법?

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]; // 이미 존재하는 휴게소의 갯수
let M = line[1]; // 새로 배치하려는 휴게소의 갯수
let L = line[2]; // 고속도로의 길이 (Length)
var pos: [Int] = []
if(N > 0){
    pos = readLine()!.split(separator: " ").map{Int($0)!} // 휴게소의 위치
}

// 고속도로 양끝에 위치 표시
pos.append(0)
pos.append(L)
pos.sort(by: {$0 < $1}) // 휴게소 위치 오름차수 정렬

func solve(_ m: Int) -> Bool {
    var cnt = 0
    for i in 1...pos.count-1 {
        let distance = pos[i]-pos[i-1]
        cnt += (distance/m)
        if((distance%m) == 0){cnt -= 1}
    }
    if( cnt > M ) { return true }
    else { return false }
}

var left: Int = 1
var right: Int = L-1

while(left<=right){
    var mid: Int = (left+right)/2
    if(solve(mid)){
        left = mid + 1
    }else{
        right = mid - 1
    }
}

print(left)
