import Foundation

class Function {
    private var d:Double
    private var dimension: Int
    private var coefficient: [Double]
    init(dimension: Int, coefficient: [Double], d: Double) {
        self.d = d
        self.dimension = dimension
        self.coefficient = coefficient
    }
    func function(argument: [Double]) -> Double {
        var f = 0.0
        for (i,(c,a)) in zip(coefficient,argument).reversed().enumerated(){
            f+=a*pow(c,Double(i+1))
        }
        return f
    }
    
    func gradient(argument:[Double]) -> [Double] {
        var sub = argument
        var grad = [Double](repeating: 0.0, count: argument.count)
        for i in 0..<argument.count{
            let tmp = sub[i]
            sub[i] = tmp + self.d
            let y1 = function(argument: sub)
            sub[i] = tmp - self.d
            let y2 = function(argument: sub)
            grad[i] = (y1 - y2) / (2 * self.d)
            sub[i] = tmp
        }
        return grad
    }
}
