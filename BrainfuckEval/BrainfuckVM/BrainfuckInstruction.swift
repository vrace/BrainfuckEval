//
//  BrainfuckInstruction.swift
//  BrainfuckEval
//
//  Created by Liu Yang on 5/8/15.
//  Copyright (c) 2015 Liu Yang. All rights reserved.
//

import Foundation

enum BrainfuckInstruction
{
    case Comment
    case PointerInc
    case PointerDec
    case DataInc
    case DataDec
    case Write
    case LoopBegin(Int)
    case LoopEnd(Int)
}

func instructionFromCharacter(ch: Character) -> BrainfuckInstruction
{
    switch ch
    {
    case ">":
        return .PointerInc
    case "<":
        return .PointerDec
    case "+":
        return .DataInc
    case "-":
        return .DataDec
    case ".":
        return .Write
    case "[":
        return .LoopBegin(0)
    case "]":
        return .LoopEnd(0)
    default:
        return .Comment
    }
}