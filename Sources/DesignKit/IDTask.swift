//
//  IDTask.swift
//  DesignKit
//
//  Created by linhey on 4/18/25.
//

import Foundation

public final class CancellableTaskCenter: @unchecked Sendable {
    
    var tasks = [Int: Task<Void, Error>]()
    
    public init() {}
    
}

public extension CancellableTaskCenter {
    
    func submit(id: any Hashable,
                discardable: Bool = false,
                priority: TaskPriority? = nil,
                operation: @Sendable @escaping () async throws -> Void) {
        let key = id.hashValue
        if discardable {
            if let task = tasks[key], task.isCancelled == false {
                return
            }
        }
        
        tasks[key]?.cancel()
        tasks[key] = nil
        let task = Task(priority: priority) {
            try await withTaskCancellationHandler(operation: operation, onCancel: { [weak self] in
                guard let self = self else { return }
                tasks[key] = nil
            })
        }
        tasks[key] = task
    }
    
    func task(id: any Hashable) -> Task<Void, Error>? {
        tasks[id.hashValue]
    }
    
    func cancel(id: any Hashable) {
        tasks[id.hashValue]?.cancel()
    }
    
}
