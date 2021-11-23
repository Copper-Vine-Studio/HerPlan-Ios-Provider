//
//  String+Date.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import UIKit

enum DateFormate: String {
    case yyyy_MM_dd_T_HH_MM_SS_Z = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case mm_dd_yyy_HH_MM = "MM/dd/yyyy HH:mm"
    case yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    case yyyy_MM_dd_HH_mm_ss_a = "yyyy-MM-dd HH:mm:ss a"
    case EEE_D_MMM_hh_mm_a = "EEE, d MMM hh:mm a"
    case d_m_yy = "d/M/yy"
    case hh_mm_a = "hh:mm a"
    case EEE_D_MMM = "EEE, d MMM"
    case MM_dd_yyyy = "MM/dd/yyyy"
    case dd_MM_yyyy = "dd/MM/yyyy"
    case yyyy_MM = "yyyy-MM"
}

extension String {
    //Convert timezone string to NSTimeZone
    func toDate(format: DateFormate = .yyyy_MM_dd_T_HH_MM_SS_Z, timZone: TimeZone? = TimeZone(abbreviation: "UTC")) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = timZone
        if format == .yyyy_MM_dd_T_HH_MM_SS_Z {
            if let formattedDate = dateFormatter.date(from: self) {
                return formattedDate
            } else {
                dateFormatter.dateFormat = DateFormate.yyyy_MM_dd_T_HH_MM_SS_Z.rawValue
                return dateFormatter.date(from: self)
            }
        }
        return dateFormatter.date(from: self)
    }
    
    
    
    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    func decimal() -> String
    {
        guard let largeNumber = Int(self) else { return self }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:largeNumber)) ?? ""
    }
    
}

extension Date {
    func toString(formateType type: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.string(from: self)
    }
    
    var codeTime: String {
        return self.toString(formateType: .mm_dd_yyy_HH_MM)
    }
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let date = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 2, to: date)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 8, to: sunday)
    }
    
    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.day! += 1
        return Calendar.current.date(from: components)!
    }
    
    func endOfMonth() -> Date {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self) as NSDateComponents
        components.month += 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    var timeStamp: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
    
    static func today() -> Date {
        return Date()
    }
    
    func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.next, weekday, considerToday: considerToday)
    }
    
    func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.previous, weekday, considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection, _ weekDay: Weekday, considerToday consider: Bool = false) -> Date {
        let dayName = weekDay.rawValue
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
        nextDateComponent.weekday = searchWeekdayIndex
        
        let date = calendar.nextDate(after: self, matching: nextDateComponent, matchingPolicy: .nextTime, direction: direction.calendarSearchDirection)
        return date!
    }
}

// MARK: Helper methods
extension Date {
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum SearchDirection {
        case next
        case previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .next:
                return .forward
            case .previous:
                return .backward
            }
        }
    }
}

extension String {
    func estimatedSize(forWidth width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingSize = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingSize
    }
}

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
