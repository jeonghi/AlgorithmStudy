//
//  main.swift
//  CodingTest
//
//  Created by JH Park on 2023/08/22.
//

import Foundation

func solution() -> Int64{
    
    let line = readLine()!.split(separator: " ").map({Int64($0)!})
    let k = line[0] // 이미 가지고 있는 랜선의 갯수
    let n = line[1] // 필요한 랜선의 갯수
    var arr: [Int64] = [] // 이미 가지고 있는 랜선 길이 배열
    for _ in 1...k {
        arr.append(Int64(readLine()!)!)
    }
    
    // 랜선 길이로 오름차순 정렬
    arr.sort(by: {$0 < $1})

    func cnt_cable_split(_ length: Int64) -> Int64 {
        arr.map({$0/length}).reduce(0,+)
    }
    
    var answer: Int64 = 0
    
    func parametric_search(_ hopeful_cnt: Int64, _ start: Int64, _ end: Int64) -> Void{
        if(start > end) {return}
        let curr_length = (start+end)/2
        let curr_cnt = cnt_cable_split(curr_length)
        // 희망하는 케이블 갯수보다 현재 케이블 갯수가 크거나 같다면,
        if(curr_cnt >= hopeful_cnt) {
            answer = curr_length
            return parametric_search(hopeful_cnt, curr_length+1, end)
        }else{
            return parametric_search(hopeful_cnt, start, curr_length-1)
        }
    }
    
    parametric_search(n, 1, arr.max()!)
    
    return answer
}


print(solution())

