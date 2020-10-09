//
//  WidgetView.swift
//  SwiftUI Widget
//
//  Created by Ashish Tyagi on 09/10/20.
//

import SwiftUI
import WidgetKit

struct WidgetData{
    let weight: Measurement<UnitMass>
    let date: Date
}

extension WidgetData{
    static let previewData = WidgetData(weight: Measurement<UnitMass>(value: 66.99, unit: .kilograms), date: Date().advanced(by: (-60*30)))
}

struct WidgetView: View {
    let data: WidgetData
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
            HStack{
            VStack(alignment: .leading) {
                WeightView(data: data)
                Spacer()
                LastUpdatedView(data: data)
                
            }
            .padding(.all)
            .background(ContainerRelativeShape().fill(Color.black))
                
            if widgetFamily == .systemMedium {
                Image("weight")
                .resizable()
                .padding()
            }
        }
    }
}

struct WeightView: View {
    let data: WidgetData

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Weight")
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text(MeasurementFormatter().string(from: data.weight))
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(0.7)
            }
            Spacer()
        }
        .padding(.all, 8)
        .background(ContainerRelativeShape().fill(Color(.systemPink)))
    }
}


struct LastUpdatedView: View {
    let data: WidgetData
    var body: some View {
        VStack(alignment: .leading){
            Text("Last Updated")
                .font(.body)
                .bold()
                .foregroundColor(.white)
            Text("\(data.date, style: .relative) ago")
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}


struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetView(data: .previewData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemMedium))
            
//            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemLarge))
            
        }
    }
}
