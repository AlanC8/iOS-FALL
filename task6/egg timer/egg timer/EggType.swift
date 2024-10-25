import Foundation

enum EggType: Int, CaseIterable {
    case soft = 0
    case medium
    case hard
    
    var cookingTime: TimeInterval {
        switch self {
        case .soft: return 10     // 10 seconds
        case .medium: return 20   // 20 seconds
        case .hard: return 120    // 120 seconds
        }
    }
    
    var title: String {
        switch self {
                case .soft: return "Soft-Boiled 🥚"
                case .medium: return "Medium-Boiled 🍳"
                case .hard: return "Hard-Boiled 🥚"
                }
    }
}
