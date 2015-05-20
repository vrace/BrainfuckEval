//
//  BrainfuckVM.swift
//  BrainfuckEval
//
//  Created by Liu Yang on 5/8/15.
//  Copyright (c) 2015 Liu Yang. All rights reserved.
//

import Foundation

class BrainfuckVM
{
    var io: BrainfuckIO
    var instructions: [BrainfuckInstruction]?
    
    init(io: BrainfuckIO)
    {
        self.io = io
    }
    
    func load(source: String) -> Bool
    {
        self.instructions = loadSource(source)
        return self.instructions != nil
    }
    
    private func loadSource(source: String) -> [BrainfuckInstruction]?
    {
        var ins = Array(source).map(instructionFromCharacter).filter({(i) -> Bool in
            switch i
            {
            case .Comment:
                return false
            default:
                return true
            }
        })
        
        func findEndLoop(searchAt: Int) -> Int?
        {
            var counter = 0
            for var i = searchAt; i < ins.count; i++
            {
                switch ins[i]
                {
                case .LoopBegin(let _):
                    counter++
                case .LoopEnd(let _):
                    counter--
                    if counter == 0
                    {
                        return i + 1
                    }
                default: ()
                }
            }
            return nil;
        }
        
        for var i = 0; i < ins.count; i++
        {
            switch ins[i]
            {
            case .LoopBegin(let _):
                if let endLoop = findEndLoop(i)
                {
                    ins[i] = .LoopBegin(endLoop)
                }
                else
                {
                    return nil
                }
            default: ()
            }
        }
        
        return ins
    }
    
    func run() -> Bool
    {
        if let ins = instructions
        {
            BrainfuckRuntime(io: io, instructions: ins).run()
        }
        else
        {
            return false
        }
        
        return true
    }
}