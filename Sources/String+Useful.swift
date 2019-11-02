extension String {
    @inline(__always)
    public var isBlank: Bool { allSatisfy { $0.isWhitespace } }
    @inline(__always)
    public var isNotBlank: Bool { allSatisfy { !$0.isWhitespace } }
}

extension Optional where Wrapped == String {
    @inline(__always)
    public var isBlank: Bool { self?.isBlank ?? true }
    @inline(__always)
    public var isNotBlank: Bool { self?.isNotBlank ?? false }
}
