extension Collection {
    @inline(__always)
    public var isNotEmpty: Bool { !isEmpty }

    @inline(__always)
    func isValidIndex(_ index: Index) -> Bool { indices.contains(index) }

    @inline(__always)
    func value(at index: Index) -> Element? {
        guard isValidIndex(index) else { return nil }

        return self[index]
    }
}

extension Collection where Index == Int {
    @inline(__always)
    func chunked(size: Int) -> [Self.SubSequence] {
        return stride(from: 0, to: endIndex, by: size).map {
            self[$0 ..< Swift.min($0 + size, endIndex)]
        }
    }
}

extension Sequence {
    @inline(__always)
    func group<Key>(by keySelector: (Element) -> Key) -> Dictionary<Key, [Element]> { Dictionary(grouping: self, by: keySelector) }
}
