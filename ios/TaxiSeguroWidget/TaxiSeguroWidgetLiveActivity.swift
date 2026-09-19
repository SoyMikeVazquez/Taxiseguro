import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState

    public struct ContentState: Codable, Hashable { }

    var id = UUID()
}

extension LiveActivitiesAppAttributes {
    func prefixedKey(_ key: String) -> String {
        return "\(id)_\(key)"
    }
}

let sharedDefault = UserDefaults(suiteName: "group.com.taxiseguro.app") ?? UserDefaults.standard

struct TaxiSeguroWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivitiesAppAttributes.self) { context in
            
            let title = sharedDefault.string(forKey: context.attributes.prefixedKey("title")) ?? "TaxiSeguro"
            let status = sharedDefault.string(forKey: context.attributes.prefixedKey("status")) ?? "Buscando..."
            
            // Pantalla de bloqueo / Banner
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                HStack(spacing: 16) {
                    Image(systemName: "car.fill")
                        .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255)) // Electric Yellow
                        .font(.system(size: 32, weight: .bold))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(status)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255))
                            .fontWeight(.medium)
                    }
                    Spacer()
                }
                .padding()
            }
            .cornerRadius(16)

        } dynamicIsland: { context in
            
            let title = sharedDefault.string(forKey: context.attributes.prefixedKey("title")) ?? "TaxiSeguro"
            let status = sharedDefault.string(forKey: context.attributes.prefixedKey("status")) ?? "Buscando..."
            
            return DynamicIsland {
                // Expanded UI
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "car.fill")
                        .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255))
                        .padding(.top, 8)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Activo")
                        .font(.caption2)
                        .padding(4)
                        .background(Color(red: 199/255, green: 255/255, blue: 46/255).opacity(0.2))
                        .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255))
                        .cornerRadius(4)
                        .padding(.top, 8)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(status)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 8)
                }
            } compactLeading: {
                Image(systemName: "car.fill")
                    .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255))
            } compactTrailing: {
                Image(systemName: "timer")
                    .foregroundColor(.white)
            } minimal: {
                Image(systemName: "car.fill")
                    .foregroundColor(Color(red: 199/255, green: 255/255, blue: 46/255))
            }
            .keylineTint(Color(red: 199/255, green: 255/255, blue: 46/255))
        }
    }
}
