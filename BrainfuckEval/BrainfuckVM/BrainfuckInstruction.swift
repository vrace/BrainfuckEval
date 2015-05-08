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
    case CmpBegin(Int)
    case CmpEnd
}