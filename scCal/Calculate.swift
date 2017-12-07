//
//  Calculate.swift
//  scCal
//
//  Created by 이승철 on 2017. 11. 28..
//  Copyright © 2017년 이승철. All rights reserved.
//

import UIKit

class Calculate {
    
    var result:Double = 0
    var preResult:Double = 0
    var numberCache:String = ""
    var oneOperator:String = ""
    var twoOperator:String = ""
    var isPointNumber:Bool = false
    
    func allClearModel() -> String {
        print("allClearModel")
        result = 0
        preResult = 0
        numberCache = ""
        twoOperator = ""
        return String(result)
    }
    
    func changeSignModel() -> String  {
        print("changeSignModel")
        result *= -1
        numberCache = String(result)
        return numberCache
    }
    
    func setNumberModel(numberStr: String) -> String {
        numberCache.append(numberStr)
        result = Double(numberCache)!
        return numberCache
    }
    
    func setOneOperatorModel(operatorStr: String) -> String {
        oneOperator = operatorStr
        switch oneOperator {
        case "AC":
            return allClearModel()
        case "+/r-":
            return allClearModel()
        case "%":
            preResult = preResult == 0 ? result * 0.01 : preResult * 0.01
            return String(preResult)
        case "=":
            switch twoOperator {
            case "÷":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult / result
            case "×":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult * result
            case "+":preResult += result
            case "-":preResult -= result
            default:preResult = result
            }
            result = 0;
            numberCache = ""
            print("equal preResult \(preResult), result \(result), twoOperator \(twoOperator)" )
            return String(preResult)
        default: return ""
        }
    }
    
    func setTwoOperatorModel(operatorStr: String) -> String {
        if twoOperator == "" {twoOperator = operatorStr}
        let returnValue = setOneOperatorModel(operatorStr:"=")
        twoOperator = operatorStr
        print("twoOper preResult \(preResult), result \(result), twoOperator \(twoOperator)" )
        return returnValue
    }
    
}

