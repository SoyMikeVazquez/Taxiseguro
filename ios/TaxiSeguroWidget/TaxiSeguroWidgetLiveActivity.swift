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
    private let brandGreen = Color(red: 199/255, green: 255/255, blue: 46/255)
    private let alertRed = Color(red: 220/255, green: 38/255, blue: 38/255)
    private let darkBg = Color(red: 18/255, green: 18/255, blue: 20/255)
    private let cardBg = Color(red: 28/255, green: 28/255, blue: 30/255)

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivitiesAppAttributes.self) { context in
            let title = sharedDefault.string(forKey: context.attributes.prefixedKey("title")) ?? "TaxiSeguro"
            let status = sharedDefault.string(forKey: context.attributes.prefixedKey("status")) ?? "Viaje activo"
            let driverName = sharedDefault.string(forKey: context.attributes.prefixedKey("driverName"))
            let vehicleInfo = sharedDefault.string(forKey: context.attributes.prefixedKey("vehicleInfo"))
            let plateNumber = sharedDefault.string(forKey: context.attributes.prefixedKey("plateNumber"))
            let pinCode = sharedDefault.string(forKey: context.attributes.prefixedKey("pinCode"))
            let destination = sharedDefault.string(forKey: context.attributes.prefixedKey("destination"))
            let fare = sharedDefault.string(forKey: context.attributes.prefixedKey("fare"))

            let isCancelled = status.lowercased().contains("cancel") || title.lowercased().contains("cancel")
            let themeColor = isCancelled ? alertRed : brandGreen

            // Pantalla de bloqueo / StandBy
            VStack(spacing: 12) {
                // Fila superior: Logo TaxiSeguro y Estado
                HStack(alignment: .center) {
                    HStack(spacing: 6) {
                        Image(systemName: isCancelled ? "xmark.circle.fill" : "car.fill")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.black)
                        Text("TAXISEGURO")
                            .font(.system(size: 12, weight: .black))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(themeColor)
                    .cornerRadius(8)

                    Spacer()

                    Text(isCancelled ? "VIAJE CANCELADO" : status.uppercased())
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(themeColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(themeColor.opacity(0.18))
                        .cornerRadius(6)
                }

                // Fila central: Datos de Conductor / Vehiculo y PIN
                HStack(alignment: .center, spacing: 14) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(driverName ?? title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)

                        if let vehicle = vehicleInfo, !vehicle.isEmpty {
                            Text("\(vehicle)\(plateNumber != nil && !plateNumber!.isEmpty ? " - \(plateNumber!)" : "")")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        } else {
                            Text(status)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(isCancelled ? alertRed : .gray)
                                .lineLimit(1)
                        }
                    }

                    Spacer()

                    // PIN de abordaje seguro (o Tarifa / Alerta de cancelacion)
                    if isCancelled {
                        VStack(spacing: 2) {
                            Text("AVISO")
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(.gray)
                            Text("CANCELADO")
                                .font(.system(size: 13, weight: .black))
                                .foregroundColor(alertRed)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(cardBg)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(alertRed.opacity(0.5), lineWidth: 1)
                        )
                        .cornerRadius(10)
                    } else if let pin = pinCode, !pin.isEmpty {
                        VStack(spacing: 2) {
                            Text("PIN SEGURO")
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(.gray)
                            Text(pin)
                                .font(.system(size: 18, weight: .black, design: .monospaced))
                                .foregroundColor(brandGreen)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(cardBg)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(brandGreen.opacity(0.4), lineWidth: 1)
                        )
                        .cornerRadius(10)
                    } else if let f = fare, !f.isEmpty {
                        Text(f)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(brandGreen)
                    }
                }

                // Fila inferior: Destino
                if let dest = destination, !dest.isEmpty {
                    HStack(spacing: 6) {
                        Image(systemName: isCancelled ? "exclamationmark.circle.fill" : "mappin.circle.fill")
                            .font(.system(size: 12))
                            .foregroundColor(themeColor)
                        Text(dest)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white.opacity(0.85))
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top, 2)
                }
            }
            .padding(16)
            .background(darkBg)
            .activityBackgroundTint(darkBg)
            .activitySystemActionForegroundColor(themeColor)

        } dynamicIsland: { context in
            let title = sharedDefault.string(forKey: context.attributes.prefixedKey("title")) ?? "TaxiSeguro"
            let status = sharedDefault.string(forKey: context.attributes.prefixedKey("status")) ?? "En viaje"
            let driverName = sharedDefault.string(forKey: context.attributes.prefixedKey("driverName"))
            let vehicleInfo = sharedDefault.string(forKey: context.attributes.prefixedKey("vehicleInfo"))
            let plateNumber = sharedDefault.string(forKey: context.attributes.prefixedKey("plateNumber"))
            let pinCode = sharedDefault.string(forKey: context.attributes.prefixedKey("pinCode"))
            let destination = sharedDefault.string(forKey: context.attributes.prefixedKey("destination"))

            let isCancelled = status.lowercased().contains("cancel") || title.lowercased().contains("cancel")
            let themeColor = isCancelled ? alertRed : brandGreen

            return DynamicIsland {
                // Vista expandida
                DynamicIslandExpandedRegion(.leading) {
                    HStack(spacing: 6) {
                        Image(systemName: isCancelled ? "xmark.circle.fill" : "car.fill")
                            .foregroundColor(themeColor)
                            .font(.system(size: 18))
                        VStack(alignment: .leading, spacing: 2) {
                            Text(driverName ?? title)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                            if let vehicle = vehicleInfo, !vehicle.isEmpty {
                                Text("\(vehicle)\(plateNumber != nil ? " - \(plateNumber!)" : "")")
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .padding(.leading, 4)
                }

                DynamicIslandExpandedRegion(.trailing) {
                    if isCancelled {
                        VStack(alignment: .trailing, spacing: 1) {
                            Text("ESTADO")
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(.gray)
                            Text("CANCELADO")
                                .font(.system(size: 13, weight: .black))
                                .foregroundColor(alertRed)
                        }
                        .padding(.trailing, 4)
                    } else if let pin = pinCode, !pin.isEmpty {
                        VStack(alignment: .trailing, spacing: 1) {
                            Text("PIN")
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(.gray)
                            Text(pin)
                                .font(.system(size: 16, weight: .black, design: .monospaced))
                                .foregroundColor(brandGreen)
                        }
                        .padding(.trailing, 4)
                    } else {
                        Text(status)
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(brandGreen)
                            .padding(.trailing, 4)
                    }
                }

                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        if let dest = destination, !dest.isEmpty {
                            Image(systemName: isCancelled ? "exclamationmark.circle.fill" : "mappin.circle.fill")
                                .font(.system(size: 12))
                                .foregroundColor(themeColor)
                            Text(dest)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white.opacity(0.9))
                                .lineLimit(1)
                        } else {
                            Text(status)
                                .font(.system(size: 12))
                                .foregroundColor(isCancelled ? alertRed : .gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 4)
                    .padding(.top, 4)
                }
            } compactLeading: {
                Image(systemName: isCancelled ? "xmark.circle.fill" : "car.fill")
                    .foregroundColor(themeColor)
            } compactTrailing: {
                if isCancelled {
                    Text("CANCELADO")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(alertRed)
                } else if status.lowercased().contains("lleg") || status.lowercased().contains("afuera") {
                    HStack(spacing: 3) {
                        Circle()
                            .fill(brandGreen)
                            .frame(width: 5, height: 5)
                        Text("LLEGÓ")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(brandGreen)
                    }
                } else if status.lowercased().contains("camino") || status.lowercased().contains("curso") || status.lowercased().contains("activo") || status.lowercased().contains("aceptado") {
                    HStack(spacing: 3) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 8))
                            .foregroundColor(brandGreen)
                        Text("EN RUTA")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(brandGreen)
                    }
                } else if let plate = plateNumber, !plate.isEmpty {
                    Text(plate)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(brandGreen)
                } else {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(brandGreen)
                }
            } minimal: {
                Image(systemName: isCancelled ? "xmark.circle.fill" : "car.fill")
                    .foregroundColor(themeColor)
            }
            .keylineTint(themeColor)
        }
    }
}
