//  ****************************************************************************
//  File      :  q289-game-of-life.swift
//  Method    :  leetcode-swift
//  Source    :  https://leetcode.com/problems/game-of-life/description/
//  Author    :  Joseph_Wu on 17/9/26.
//  ****************************************************************************
//  Given a board with m by n cells, each cell has an initial state live (1) or dead (0).
//  Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using 
//  the following four rules (taken from the above Wikipedia article):

//  Rule:
//  1. Any live cell with fewer than two live neighbors dies, as if caused by under-population.
//  2. Any live cell with two or three live neighbors lives on to the next generation.
//  3. Any live cell with more than three live neighbors dies, as if by over-population..
//  4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
//  ****************************************************************************

import Foundation

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {

        // 2. iterate each item in board
        // 2-1. check the next state in current item
        // 2-2. check all items in board
        // 2-3. fill them to board
        
        // rules:
        // 1. cell is live but liveneighbors < 2 -> die
        // 2. cell is live but liveneighbors = 2 or 3 -> live
        // 3. cell is live but liveneighbors > 3 -> die
        // 4. cell is dead but liveneighbors = 3 -> live
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                let lives = liveneighbors(board, i, j)
                
                // 00: [next, current] = [dead, dead]
                // 01: [next, current] = [dead, live]
                // 10: [next, current] = [live, dead]
                // 11: [next, current] = [live, live]
                if (board[i][j] == 0) {
                    board[i][j] = lives == 3 ? 2 : 0 // state: 10
                } else {
                    board[i][j] = (lives >= 2 && lives <= 3) ? 3 : 1 // state: 11
                }
            }
        }
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                board[i][j] >>= 1
                print(board[i][j])
            }
        }
    }
    
    func liveneighbors(_ board: [[Int]], _ x :Int, _ y :Int) -> Int {
        var lives = 0
        var counter = 0
        
        for i in max(x - 1, 0) ... min(x + 1, board.count - 1) {
            for j in max(y - 1, 0) ... min(y + 1, board[x].count - 1) {
                lives += board[i][j] & 1
                counter += 1
            }
        }
        lives -= board[x][y] & 1
        return lives
    }
    
}
