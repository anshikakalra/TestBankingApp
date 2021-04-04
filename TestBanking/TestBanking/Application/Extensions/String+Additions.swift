//
//  String+Additions.swift
//  TestBanking
//
//  Created by Anshika on 04/04/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
    
    func convertStringToFloat() -> Float? {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: self)
        let numberFloatValue = number?.floatValue
        return numberFloatValue
    }
    
    func serializeDateFromServer() -> String {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let oldDate = olDateFormatter.date(from: self)

        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "dd MMM YYYY"

        return convertDateFormatter.string(from: oldDate!)
    }
}
