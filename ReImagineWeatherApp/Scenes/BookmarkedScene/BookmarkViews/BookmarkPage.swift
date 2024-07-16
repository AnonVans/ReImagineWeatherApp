//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit

struct BookmarkPage: View {
    var body: some View {
        VStack {
            VStack (spacing: 15){
                HStack {
                    Text("Weather")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.bottom)
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 22)
                                .foregroundColor(.grayTertiary)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(width: 361, height: 59)
                .padding(.bottom)
                
                ScrollView {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                Text("Add Place")
                                    .font(.subheadline)
                                    .padding(.leading, -5)
                            }
                            .padding(9)
                            .background(
                                Color.grayTertiary
                            )
                            .cornerRadius(40)
                            .frame(width: 107, height: 28)
                        })
                    }
                    .padding(.top, 10)
                    .padding(.bottom)
                    .foregroundColor(.black)
                    
                    
                    VStack (spacing: 20){
                        ForEach(0..<8) { _ in
                            Rectangle()
                                .frame(width: 361, height: 115)
                                .cornerRadius(20)
                        }
                    }
                    .foregroundColor(.arsenic)
                }
            }
            .ignoresSafeArea()
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

#Preview {
    BookmarkPage()
}
