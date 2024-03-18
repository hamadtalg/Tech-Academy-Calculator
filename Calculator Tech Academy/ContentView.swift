//
//  ContentView.swift
//  Calculator Tech Academy
//
//  Created by DVP on 17/03/2024.
//

import SwiftUI

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "X"
    case divide = "/"
    case equal = "="
    case clear = "c"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
}
    
enum Operation {
    case add, subtract, multiply, divide, none

}
struct ContentView: View {
    @State var value = "0"
    @State var runningNumber = 0
   @State var currentOperation: Operation = .none
    let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    var body: some View {
        ZStack {
            Color(UIColor(red: 117/255.0, green: 129/255.0, blue: 107/255.0, alpha:1)).edgesIgnoringSafeArea(.all)
            VStack{
                // Text display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size:72))
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        //Our buttons
        ForEach(buttons, id: \.self) {row in
            HStack(spacing: 12) {
                ForEach(row, id: \.self) {item in
                    Button(action: {
                        self.didtap(button: item)
                    }, label: {
                        Text(item.rawValue)
                            .font(.system(size:32))
                            .frame(width: 70, height: 70)
                            .background(Color(UIColor(red: 118/255.0, green: 118/255.0, blue: 118/255.0, alpha:1)))
                            .foregroundColor(.white)
                            .cornerRadius(35)
                    })
                }
                .padding(.bottom, 3)
            }
           } 
    }
    func didtap(button:CalculatorButton){
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber += Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber += Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber += Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber += Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                    case .add: self.value = "\(runningValue + currentValue)"
                    case .subtract: self.value = "\(runningValue - currentValue)"
                    case .multiply: self.value = "\(runningValue * currentValue)"
                    case .divide: self.value = "\(runningValue / currentValue)"
                }
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .zero{
            return((UIScreen.main.bounds.width - (4*12))/4)*2
        }
        return UIScreen.main.bounds.width - (5*12) / 4
    func buttonHeight(item: CalculatorButton) -> CGFloat{
        return UIScreen.main.bounds.height - (5*12) / 4
}
        
}
       
}
#Preview {
    ContentView()
}
