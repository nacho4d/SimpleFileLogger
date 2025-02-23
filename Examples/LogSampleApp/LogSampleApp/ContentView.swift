//
//  ContentView.swift
//  LogSampleApp
//
//  Created by  Guillermo Ignacio Enriquez Gutierrez on 2025/02/20.
//

import SwiftUI
import SimpleFileLogger

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                FileLogger.default.debug("example")
            } label: {
                Text("Log something.")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
