//  ****************************************************************************
//  File      :  q007-reverse-integer.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/reverse-integer/description/
//  Author    :  Joseph_Wu on 17/9/22.
//  ****************************************************************************
//  Reverse digits of an integer.
//  Example1: x = 123, return 321
//  Example2: x = -123, return -321
//  ****************************************************************************

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var reverseValue = 0
        while x != 0 {
            reverseValue = reverseValue * 10 + x % 10
            x /= 10
            
            if reverseValue > Int(Int32.max) || reverseValue < Int(Int32.min) {
                return 0
            }
        }
        return reverseValue
    }
}
