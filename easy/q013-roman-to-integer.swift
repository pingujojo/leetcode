//  ****************************************************************************
//  File      :  q013-roman-to-integer.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/roman-to-integer/description/
//  Author    :  Joseph_Wu on 17/10/05.
//  ****************************************************************************
//  Given a roman numeral, convert it to an integer.
//  Input is guaranteed to be within the range from 1 to 3999.
//  Example:
//   input: let num = romanToInt("MCMXCVIII")
//  output: 1997
//  ****************************************************************************

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanNumeral = [
            "I" : 1,   "V" : 5,   "X" : 10, "L" : 50,
            "C" : 100, "D" : 500, "M" : 1000]
        var result = 0
        var maxValue = 0
        var inputArray = Array(s.uppercased().characters.reversed())
        // TODO: to check if input string is valid.
        
        for i in 0 ..< inputArray.count {
            let inputValue = romanNumeral[String(inputArray[i])]!
            
            if inputValue >= maxValue {
                maxValue = inputValue
                result += inputValue
            } else {
                result -= inputValue
            }
        }
        
        return result
    }
}
