//
//  DispatchSleep.swift
//  Useful
//
//  Created by Allen Humphreys on 8/30/18.
//

extension Collection {

    public var isNotEmpty: Bool {
        return !isEmpty
    }

    func isValidIndex(_ index: Index) -> Bool {
        return indices.contains(index)
    }

    func value(at index: Index) -> Element? {
        guard isValidIndex(index) else { return nil }

        return self[index]
    }
}
