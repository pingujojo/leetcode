//  ****************************************************************************
//  File      :  q162-find-peak-element.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/find-peak-element/description/
//  Author    :  Joseph_Wu on 17/10/05.
//  ****************************************************************************
//  A peak element is an element that is greater than its neighbors.
//  Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
//  ****************************************************************************

import Foundation

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        // implement binary search.
        while low < high {
            let mid1 = (low + high) / 2
            let mid2 = mid1 + 1
            
            if nums[mid1] < nums[mid2] {
                low = mid2
            } else {
                high = mid1
            }
        }
        
        return low
    }
}
