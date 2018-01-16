//
//  TimeIntervalTest.swift
//  TimeLineTests
//
//  Created by 배지영 on 2018. 1. 3..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import XCTest

class TimeIntervalTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLastTime() {
        let beforeTime = TimeInterval().now().minusHour(hourAmount: 1).getAllTimeInfo()
        let nowTime = TimeInterval().now().getAllTimeInfo()
        print("beforeTime : \(beforeTime), nowTime : \(nowTime)")
        
        let now = TimeInterval().now()
        let saveTime1 = TimeInterval().minusHour(point: now, hourAmount: 2)
        let saveTime2 = TimeInterval().minusMinute(point: now, minuteAmount: 10)
        print(TimeInterval().getTwitterTime(saveTime: saveTime1))
        print(TimeInterval().getTwitterTime(saveTime: saveTime2))
    }
    
    func testTwitterTime() {
        let now = TimeInterval().now()
        let before = TimeInterval().minusMinute(point: now, minuteAmount: 1)
        let before2 = TimeInterval().minusSecond(point: now, secondAmount: 2)
        print(getTwitterTime(saveTime: before))
        print(getTwitterTime(saveTime: before2))
    }
    
    func getTwitterTime(saveTime:TimeInterval) -> String {
        if TimeInterval().minusHour(point: TimeInterval().now(), hourAmount: 1) < saveTime {
            let agoSecond = Int(TimeInterval().now() - saveTime)
            if 59 < agoSecond {
                return "\(agoSecond / 60) minute ago"
            }
            return "\(agoSecond) second ago"
        }
        return TimeInterval().formatString(time: saveTime, format: "yyyy.MM.dd a h:mm")
    }
    
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}


extension TimeInterval {
    
    func now() -> TimeInterval {
        return NSDate().timeIntervalSince1970
    }
    
    func getYYMMDD() -> String {
        return formatString(format: "yyyy-mm-dd")
    }
    
    func getAllTimeInfo() -> String {
        return formatString(format: "yyyy.MM.dd a h:mm")
    }
    
    func getTwitterTime(saveTime:TimeInterval) -> String {
        if minusHour(point: now(), hourAmount: 1) < saveTime {
            let agoMinute = Int((TimeInterval().now() - saveTime) / 60)
            if agoMinute < 1 {
                return "\(agoMinute * 60) second ago"
            }
        }
        return formatString(time: saveTime, format: "yyyy.MM.dd a h:mm")
    }
    
    func minusHour(hourAmount:Int) -> TimeInterval {
        let minusSecondsAmount = TimeInterval(60 * 60 * hourAmount)
        return self - minusSecondsAmount
    }
    
    func minusMinute(point:TimeInterval, minuteAmount:Int) -> TimeInterval {
        let minusSecondsAmount = TimeInterval(60 * minuteAmount)
        return point - minusSecondsAmount
    }
    
    
    func minusHour(point: TimeInterval, hourAmount:Int) -> TimeInterval {
        let minusSecondsAmount = TimeInterval(60 * 60 * hourAmount)
        return point - minusSecondsAmount
    }
    
    func formatString(format:String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = .current
        return dateFormatter.string(from: date)
    }
    
    func formatString(time:TimeInterval, format:String) -> String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = .current
        return dateFormatter.string(from: date)
    }
}
