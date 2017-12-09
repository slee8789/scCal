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
    var twoOperator:String = ""
    
    func allClearModel() -> String {
        print("allClearModel")
        result = 0
        preResult = 0
        numberCache = ""
        twoOperator = ""
        return checkPossibleInteger(calculatedStrValue: String(result))
    }
    
    func changeSignModel() -> String  {
        print("changeSignModel")
        result *= -1
        numberCache = String(result)
        return checkPossibleInteger(calculatedStrValue: numberCache)
    }
    
    func setNumberModel(numberStr: String) -> String {
        numberCache.append(numberStr)
        result = Double(numberCache)!
        return checkPossibleInteger(calculatedStrValue: numberCache)
    }
    
    func addPointModel() -> String {
        if(!numberCache.contains(".")) {
            numberCache.append(".")
        }
        return checkPossibleInteger(calculatedStrValue: numberCache)
    }
    
    func setOneOperatorModel(operatorStr: String) -> String {
        switch operatorStr {
        case "AC":
            return allClearModel()
        case "+/-":
            return changeSignModel()
        case ".":
            return addPointModel()
        case "%":
            preResult = preResult == 0 ? result * 0.01 : preResult * 0.01
            return checkPossibleInteger(calculatedStrValue: String(preResult))
        case "=":
            switch twoOperator {
            case "÷":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult / result
            case "×":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult * result
            case "+":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult + result
            case "-":preResult = result == 0 ? preResult : preResult == 0 ? result : preResult - result
            default:preResult = result
            }
            result = 0;
            numberCache = ""
            return checkPossibleInteger(calculatedStrValue: String(preResult))
        default: return ""
        }
    }
    
    func setTwoOperatorModel(operatorStr: String) -> String {
        if twoOperator == "" {twoOperator = operatorStr}
        let returnValue = setOneOperatorModel(operatorStr:"=")
        twoOperator = operatorStr
        return checkPossibleInteger(calculatedStrValue: returnValue)
    }
    
    func checkPossibleInteger(calculatedStrValue: String) -> String {
        var fixedValue = calculatedStrValue
        if fixedValue.hasSuffix(".0") {
            fixedValue.removeSubrange(fixedValue.index(fixedValue.endIndex, offsetBy: -2)..<fixedValue.endIndex)
        }
        return fixedValue
    }
    
}

