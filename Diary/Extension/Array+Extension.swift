//
//  Array+Extension.swift
//  Diary
//
//  Created by rilla, songjun on 2023/04/25.
//

extension Array {
    subscript(index index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
