//
//  WeatherButtonLabel.swift
//  Weather
//
//  Created by Yinan Qiu on 4/3/21.
//

import SwiftUI

struct WeatherButtonLabel: View {
    var text: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.system(size: 24, weight: .bold))
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(backgroundColor)
            .cornerRadius(20)
            .padding(.bottom, 30)
            .padding(.leading, 30)
            .padding(.trailing, 30)
    }
}
