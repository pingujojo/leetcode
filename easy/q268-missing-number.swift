//  ****************************************************************************
//  File      :  q268-missing-number.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/missing-number/description/
//  Author    :  Joseph_Wu on 17/9/22.
//  ****************************************************************************
//  Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, 
//  find the one that is missing from the array.
//  For example,
//  Given nums = [0, 1, 3] return 2.
//  ****************************************************************************

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        var index = 0
        
        while index < nums.count {
            sum += (nums[index] - index)
            index += 1
        }
        return (nums.count - sum)
    }
}
