//
//  profileVIew2.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 03/08/26.
//

import SwiftUI

struct ProfileView2: View {

    @State var count = 0

    var body: some View {

        VStack {

            ForEach(0..<1000) { i in

                VStack {

                    Text("User \(i)")
                        .font(.headline)

                    Text("Description")

                    Button("Tap") {
                        count += 1
                        print(count)
                    }
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
    }
}
