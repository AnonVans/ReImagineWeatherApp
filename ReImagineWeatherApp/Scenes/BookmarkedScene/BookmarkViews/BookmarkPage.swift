//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit

struct BookmarkPage: View {
    @State var date = DatePickerViewModel().resetDate(date: Date.now)
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Weather")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.bottom)
                
                ZStack {
                    CalendarSelectionView(selectedDay: $date)
                        .padding(.top)
                }
                .frame(width: 361)
                .background(
                    Color.grayQuaternary2
                )
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.2), radius: 9, x: 0, y: 5)
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
                    .foregroundColor(.primary)
                    
                    VStack (spacing: 20) {
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
