//
//  TaxiSeguroWidgetBundle.swift
//  TaxiSeguroWidget
//
//  Created by Miguel Angel Vazquez on 13/09/26.
//

import WidgetKit
import SwiftUI

@main
struct TaxiSeguroWidgetBundle: WidgetBundle {
    var body: some Widget {
        TaxiSeguroWidget()
        TaxiSeguroWidgetControl()
        TaxiSeguroWidgetLiveActivity()
    }
}
