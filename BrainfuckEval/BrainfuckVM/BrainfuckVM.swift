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
    
    init(io: BrainfuckIO, source: String)
    {
        self.io = io
        self.instructions = BrainfuckVM.loadSource(source)
    }
    
    class func loadSource(source: String) -> [BrainfuckInstruction]?
    {
        func removeComment(i: BrainfuckInstruction) -> Bool
        {
            switch i
            {
            case .Comment:
                return false
            default:
                return true
            }
        }
        
        func findEndLoop(ins: [BrainfuckInstruction], searchAt: Int) -> Int?
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
                        return i
                    }
                default: ()
                }
            }
            return nil;
        }
        
        var ins = Array(source).map(instructionFromCharacter).filter(removeComment)
        
        for var i = 0; i < ins.count; i++
        {
            switch ins[i]
            {
            case .LoopBegin(let _):
                if let endLoop = findEndLoop(ins, i)
                {
                    ins[i] = .LoopBegin(endLoop + 1)
                    ins[endLoop] = .LoopEnd(i)
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
            var mem = Array(count: 30000, repeatedValue: 0)
            var mp = 0
            var ip = 0
            
            while ip < ins.count
            {
                switch ins[ip]
                {
                case .PointerInc:
                    mp++
                    ip++
                case .PointerDec:
                    mp--
                    ip++
                case .DataInc:
                    mem[mp]++
                    ip++
                case .DataDec:
                    mem[mp]--
                    ip++
                case .Write:
                    io.write(Character(UnicodeScalar(mem[mp])))
                    ip++
                case .LoopBegin(let loopEnd):
                    if mem[mp] == 0
                    {
                        ip = loopEnd
                    }
                    else
                    {
                        ip++
                    }
                case .LoopEnd(let loopBegin):
                    ip = loopBegin
                default:()
                }
            }
        }
        else
        {
            return false
        }
        
        return true
    }
}