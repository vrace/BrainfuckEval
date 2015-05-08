//
//  BrainfuckRuntime.swift
//  BrainfuckEval
//
//  Created by Liu Yang on 5/8/15.
//  Copyright (c) 2015 Liu Yang. All rights reserved.
//

import Foundation

class BrainfuckRuntime
{
    var mem = Array(count: 30000, repeatedValue: 0)
    var mp = 0
    var ip = 0
    
    var io: BrainfuckIO
    var ins: [BrainfuckInstruction]
    
    init(io: BrainfuckIO, instructions: [BrainfuckInstruction])
    {
        self.io = io
        self.ins = instructions;
    }
    
    func run()
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
}
