import Foundation

public protocol MediaResourceId {
    var uniqueId: String { get }
    var hashValue: Int { get }
    func isEqual(to: MediaResourceId) -> Bool
}

public struct WrappedMediaResourceId: Hashable {
    public let id: MediaResourceId
    
    public init(_ id: MediaResourceId) {
        self.id = id
    }
    
    public static func ==(lhs: WrappedMediaResourceId, rhs: WrappedMediaResourceId) -> Bool {
        return lhs.id.isEqual(to: rhs.id)
    }
    
    public var hashValue: Int {
        return self.id.hashValue
    }
}

public protocol MediaResource {
    var id: MediaResourceId { get }
    var size: Int? { get }
    var streamable: Bool { get }
}

public extension MediaResource {
    var size: Int? {
        return nil
    }
    
    var streamable: Bool {
        return false
    }
}

public protocol CachedMediaResourceRepresentation {
    var uniqueId: String { get }
    func isEqual(to: CachedMediaResourceRepresentation) -> Bool
}
