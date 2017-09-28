//  ****************************************************************************
//  File      :  q001-two-sum.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/two-sum/description/
//  Author    :  Joseph_Wu on 17/9/21.
//  ****************************************************************************
//  Given nums = [2, 7, 11, 15], target = 9,
//  Because nums[0] + nums[1] = 2 + 7 = 9,
//  return [0, 1].
//  ****************************************************************************

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hash: [Int : Int] = [:]
        var resArray : [Int] = [];
        
        for (i, j) in nums.enumerated() {
            if let index = hash[target - j]{
                resArray.append(index)
                resArray.append(i)
                return resArray
            }
            hash[j] = i
            
        }
        return resArray;
    }
}
