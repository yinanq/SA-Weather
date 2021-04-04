//
//  ContentView.swift
//  Weather
//
//  Created by Yinan Qiu on 4/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isMars = false
    
    var body: some View {
        ZStack {
            BackgroundView(isMars: $isMars)
            VStack {
                CityTextView(city: isMars ? "Mars" : "Vancouver, BC")
                Spacer()
                MainWeatherView(weatherIcon: isMars ? "sun.max.fill" : "cloud.rain.fill", temperature: isMars ? -42 : 9)
                Spacer()
                HStack {
                    WeatherDayView(dayOfWeek: "MON",
                                   weatherIcon: isMars ? "sun.max.fill" : "sun.max.fill",
                                   temperature: isMars ? -36 : 24)
                    Spacer()
                    WeatherDayView(dayOfWeek: "TUE",
                                   weatherIcon: isMars ? "sun.max.fill" : "cloud.drizzle.fill",
                                   temperature: isMars ? -63 : 12)
                    Spacer()
                    WeatherDayView(dayOfWeek: "WED",
                                   weatherIcon: isMars ? "sun.max.fill" : "cloud.rain.fill",
                                   temperature: isMars ? -17 : 6)
                    Spacer()
                    WeatherDayView(dayOfWeek: "THE",
                                   weatherIcon: isMars ? "sun.max.fill" : "cloud.sun.rain.fill",
                                   temperature: isMars ? -23 : 15)
                    Spacer()
                    WeatherDayView(dayOfWeek: "FRI",
                                   weatherIcon: isMars ? "sun.max.fill" : "cloud.rain.fill",
                                   temperature: isMars ? -27 : 9)
                }
                .padding(.leading, 40)
                .padding(.trailing, 40)
                Spacer()
                Button {
                    isMars.toggle()
                } label: {
                    WeatherButtonLabel(text: "Change Planet",
                                       textColor: isMars ? Color.orange : Color("main"),
                                       backgroundColor: Color.white)
                }
            }
        }
//        .onAppear {
//            print(1)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
//    var isMars: Bool
    @Binding var isMars: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isMars ? Color.red : Color("gradientTop"), isMars ? Color.orange : Color("gradientBottom")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var city: String
    var body: some View {
        Text(city)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
            .padding(.top, 10)
    }
}

struct MainWeatherView: View {
    var weatherIcon: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120, alignment: .bottom)
            Text("\(temperature)°")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.white)
        }
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
