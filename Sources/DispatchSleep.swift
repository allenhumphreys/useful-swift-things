//
//  DispatchSleep.swift
//  Useful
//
//  Created by Allen Humphreys on 8/30/18.
//

import Foundation

func sleep(_ dispatchTimeInterval: DispatchTimeInterval) {
    switch dispatchTimeInterval {
    case .seconds(let seconds):
        Foundation.sleep(UInt32(seconds))
    case .milliseconds(let milliseconds):
        usleep(useconds_t(milliseconds * 1000))
    case .microseconds(let microseconds):
        usleep(useconds_t(microseconds))
    case .nanoseconds(let nanoseconds):
        let (sec, nsec) = nanoseconds.quotientAndRemainder(dividingBy: 1_000_000_000)
        var timeSpec = timespec(tv_sec: sec, tv_nsec: nsec)
        withUnsafePointer(to: &timeSpec) {
            _ = nanosleep($0, nil)
        }
    case .never:
        return
    }
}
