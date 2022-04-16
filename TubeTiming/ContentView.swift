//
//  ContentView.swift
//  TubeTiming
//
//  Created by David Jin Li on 16/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State var trains: [Train] = []
    var body: some View {
        
        List(trains.sorted(by: { $0.timeToStation < $1.timeToStation })) {train in
            Text(
                """
                To: \(train.destinationName)
                \(train.platformName)
                ETA: \(train.timeToStation/60) minutes
                """
            )
        }
        .onAppear{
            Api().getData { trains in
                self.trains = trains
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
