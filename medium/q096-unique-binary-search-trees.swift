//  ****************************************************************************
//  File      :  q096-unique-binary-search-trees.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/unique-binary-search-trees/description/
//  Author    :  Joseph_Wu on 17/10/06.
//  ****************************************************************************
//  Given n, how many structurally unique BST's (binary search trees) that store values 1...n?
//  numTrees =   f(0)*f(n-1)    // root key = 1
//             + f(1)*f(n-2)    // root key = 2
//             + ...
//             + f(n-1)*f(0)    // root key = n
//
//  1      1         2          3       3
//   \      \       / \        /       /
//    3      2     1   3      2       1
//   /        \              /         \
//  2          3            1           2
//  ****************************************************************************

import Foundation

class Solution {

    func numTrees(_ n: Int) -> Int {
        
        // return 1 if n = 0 or n = 1
        guard n > 1 else {
            return 1
        }
        
        // this array should be in range from 0 ... n, size = n + 1
        var dp = Array(repeating: 0, count: n+1)
        
        dp[0] = 1   // nil node.
        dp[1] = 1   // root node only
        for i in 2 ... n {
            for j in 0 ..< i {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        
        return dp[n]
    }
}
