//
//  Date+Ext.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI

extension Date{
    var eighteenYearsAgo: Date {

        Calendar.current.date(byAdding: .year, value: -18, to: Date())!

    }
    
    var oneHundredTenYearsAgo: Date {
          Calendar.current.date(byAdding: .year, value: -110, to: Date())!
      }
    
}
