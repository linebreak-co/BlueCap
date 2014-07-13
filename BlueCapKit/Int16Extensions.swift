//
//  Int16Extensions.swift
//  BlueCap
//
//  Created by Troy Stribling on 7/8/14.
//  Copyright (c) 2014 gnos.us. All rights reserved.
//

import Foundation

extension Int16 : Deserialized {
    
    static func fromString(data:String) -> Deserialized? {
        if let intVal = data.toInt() {
            if intVal > 32767 {
                return Int16(32767)
            } else if intVal < -32768 {
                return Int16(-32768)
            } else {
                return Int16(intVal)
            }
        } else {
            return nil
        }
    }

    static func deserialize(data:NSData) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, length:sizeof(Int16))
        return value
    }
    
    static func deserialize(data:NSData, start:Int) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, range: NSMakeRange(start, sizeof(Int16)))
        return value
    }
    
    static func deserializeFromLittleEndian(data:NSData) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, length:sizeof(Int16))
        return littleEndianToHost(value)
    }
    
    static func deserializeFromLittleEndian(data:NSData) -> [Deserialized] {
        let count = data.length / sizeof(Int16)
        return [Int](0..<count).map{(i) in self.deserializeFromLittleEndian(data, start:i)}
    }
    
    static func deserializeFromLittleEndian(data:NSData, start:Int) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, range:NSMakeRange(start, sizeof(Int16)))
        return littleEndianToHost(value)
    }
    
    static func deserializeFromBigEndian(data:NSData) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, length:sizeof(Int16))
        return bigEndianToHost(value)
    }
    
    static func deserializeFromBigEndian(data:NSData) -> [Deserialized] {
        let count = data.length / sizeof(Int16)
        return [Int](0..<count).map{(i) in self.deserializeFromBigEndian(data, start:i)}
    }
    
    static func deserializeFromBigEndian(data:NSData, start:Int) -> Deserialized {
        var value : Int16 = 0
        data.getBytes(&value, range:NSMakeRange(start, sizeof(Int16)))
        return bigEndianToHost(value)
    }

}