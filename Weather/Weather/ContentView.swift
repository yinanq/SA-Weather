//
//  ContentView.swift
//  Weather
//
//  Created by Yinan Qiu on 4/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("gradientTop"), Color("gradientBottom")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Vancouver, BC")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                Spacer()
                VStack(spacing: 5) {
                    Image(systemName: "cloud.sun.rain.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180, alignment: .bottom)
                    Text("16°")
                        .font(.system(size: 100, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack {
                    WeatherDayView(dayOfWeek: "MON",
                                   weatherIcon: "sun.max.fill",
                                   temperature: 24)
                    Spacer()
                    WeatherDayView(dayOfWeek: "TUE",
                                   weatherIcon: "cloud.drizzle.fill",
                                   temperature: 12)
                    Spacer()
                    WeatherDayView(dayOfWeek: "WED",
                                   weatherIcon: "cloud.rain.fill",
                                   temperature: 6)
                    Spacer()
                    WeatherDayView(dayOfWeek: "THE",
                                   weatherIcon: "cloud.sun.rain.fill",
                                   temperature: 15)
                    Spacer()
                    WeatherDayView(dayOfWeek: "FRI",
                                   weatherIcon: "cloud.rain.fill",
                                   temperature: 9)
                }
                .padding(.leading, 40)
                .padding(.trailing, 40)
                Spacer()
                Button {
                    print("button tapped")
                } label: {
                    Text("Change Day Time")
                        .foregroundColor(Color("main"))
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.bottom, 30)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherIcon: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
