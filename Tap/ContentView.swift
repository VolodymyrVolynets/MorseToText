//
//  ContentView.swift
//  Tap
//
//  Created by Vova on 18/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            Text(vm.text)
                .font(.largeTitle)
                .frame(height: 100)
            Text(vm.morseText)
                .font(.largeTitle)
                .frame(height: 100)
           Circle()
                .frame(width: 100, height: 100)
                .opacity(vm.isPressed ? 0.8 : 1)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            vm.pressBegin()
                        })
                        .onEnded({ _ in
                            vm.pressEnded()
                        })
                )

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
