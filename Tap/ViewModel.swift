//
//  ViewModel.swift
//  Tap
//
//  Created by Vova on 18/09/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var morseText: String = ""
    @Published var text: String = ""
    private var date = Date()
    private var timePress: Float = 0
    @Published private(set) var isPressed: Bool = false
    
    func pressBegin() {
        date = Date()
        withAnimation(.easeInOut(duration: 0.15)) {
            isPressed = true
        }
    }
    
    func pressEnded() {
        withAnimation(.easeInOut(duration: 0.15)) {
            isPressed = false
        }
        timePress = Float(-date.timeIntervalSinceNow)
        if timePress >= 0.15 {
            morseText = "\(morseText)-"
        } else {
            morseText = "\(morseText)."
        }
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            if -self.date.timeIntervalSinceNow >= 3, !self.isPressed {
                self.text = "\(self.text) \(MorseCode.decode(text: self.morseText))"
                self.morseText = ""
            }
        }
    }
}

struct MorseCode {
    static let morseCode: [String: String] = [
        ".-":"A",
        "-...":"B",
        "-.-.":"C",
        "-..":"D",
        ".":"E",
        "..-.":"F",
        "--.":"G",
        "....":"H",
        "..":"I",
        ".---":"J",
        "-.-":"K",
        ".-..":"L",
        "--":"M",
        "-.":"N",
        "---":"O",
        ".--.":"P",
        "--.-":"Q",
        ".-.":"R",
        "...":"S",
        "-":"T",
        "..-":"U",
        "...-":"V",
        ".--":"W",
        "-..-":"X",
        "-.--":"Y",
        "--..":"Z",
    ]
    static func decode(text: String) -> String {
        morseCode[text] ?? ""
    }
}

