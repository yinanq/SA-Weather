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
            BackgroundView()
            VStack {
                CityTextView(city: "Vancouver, BC")
                Spacer()
                MainWeatherView(weatherIcon: "cloud.rain.fill", temperature: 9)
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
                    WeatherButtonLabel(text: "Change City",
                                       textColor: Color("main"),
                                       backgroundColor: Color.white)
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

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("gradientTop"), Color("gradientBottom")]),
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
