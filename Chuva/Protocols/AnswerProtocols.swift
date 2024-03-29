protocol BaseAnswer: Deserializable {
    var baseValue: Any? { get set }
}

protocol TypedAnswer: BaseAnswer, Serializable {
    associatedtype Value: Hashable
    var value: Value? { get set }
    init(value: Value?)
}

extension TypedAnswer {
    var baseValue: Any? {
        set { value = newValue as? Value }
        get { return value }
    }

    init(value: Value?) {
        self.init(value: value)
        self.value = value
        self.baseValue = baseValue
    }
    
    func deserialize() -> [String : AnyObject?] {
        return ["value": value as AnyObject?]
    }
}
