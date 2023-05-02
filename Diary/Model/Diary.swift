//
//  Diary.swift
//  Diary
//
//  Created by rilla, songjun on 2023/04/24.
//

import Foundation

struct Diary: Hashable, Identifiable {
    let id: UUID
    let title: String
    let body: String
    let timeIntervalSince1970: Int
}
