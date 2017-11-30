//  ****************************************************************************
//  File      :  q612-task-scheduler.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/task-scheduler/description/
//  Author    :  Joseph_Wu on 17/11/30.
//  ****************************************************************************
//  Input      : tasks = ["A","A","A","B","B","B"], n = 2
//  Output     : 8
//  Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
//  ****************************************************************************

import Foundation

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        /* TODO: Some hardcode settings, may have better way to alternative. */
        let maxTaskLetter = 26  /* to represent 26 letters */
        let asciiA: Unicode.Scalar = "A"    /* to get "A"'s ascii to calculate the index */
        let stringTasks = String(tasks)
        
        /* declare the array to store each amount of task letters, space complexity is O(26) */
        var taskAmount = Array(repeating: 0, count: maxTaskLetter)
        for v in stringTasks.unicodeScalars {
            let index = Int(v.value - asciiA.value)
            taskAmount[index] += 1
        }
        taskAmount = taskAmount.sorted(by: >)
        
        /* get the key frame size if there are multiple letters have the same max amount. */
        var frameSize = 1
        while frameSize < maxTaskLetter && taskAmount[frameSize] == taskAmount[0] {
            frameSize += 1
        }
        
        /* k(chunks) * n+1 (different options) + (key pattern size) */
        return max(tasks.count, (taskAmount[0] - 1) * (n + 1) + frameSize)
    }
}
