//  ****************************************************************************
//  File      :  q006-zigzag-conversion.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/zigzag-conversion/description/
//  Author    :  Joseph_Wu on 17/9/29.
//  ****************************************************************************
//  The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows.given
//  Write the code that will take a string and make this conversion given a number of rows:
//  string convert(string text, int nRows);
//  convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
//  ****************************************************************************

import Foundation

class Solution {

    func convert(_ s: String, _ numRows: Int) -> String {
        var tempArray : [String] = Array(repeating: "", count: numRows)
        var row = 0
        var step = 1

        if numRows == 1 {
            return s
        }
    
        for char in s.characters {
            tempArray[row] += String(char)
            if 0 == row {
                step = 1    // upside down
            } else if (numRows - 1) == row {
                step = -1   // downside up
            }
            row += step
        }
    
        for i in 1 ..< numRows {
            tempArray[0] += tempArray[i]
        }
        return tempArray[0]
    }

}
