import Foundation

typealias DebouncedFunction<T> = (T) -> Void

func debounce<T, R>(function: @escaping (T) -> R) -> DebouncedFunction<T> {
    return makeDebouncedFunction(action: function)
}

func makeDebouncedFunction<T, R>(threshold: DispatchTimeInterval = .milliseconds(500), queue: DispatchQueue = .main, action: @escaping (T) -> R) -> DebouncedFunction<T> {

    // Debounced function's state, initial value doesn't matter
    // By declaring it outside of the returned function, it becomes state that persists across
    // calls to the returned function
    var mostRecentCallTime: DispatchTime = .distantFuture

    return { param in

        mostRecentCallTime = .now()
        let scheduledDeadline = mostRecentCallTime + threshold

        queue.asyncAfter(deadline: scheduledDeadline) {
            let mostRecentlyScheduledDeadline = mostRecentCallTime + threshold

            // If there have been no other calls, these will be equal
            guard scheduledDeadline == mostRecentlyScheduledDeadline else { return }

            _ = action(param)
        }
    }
}
