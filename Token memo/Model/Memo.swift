//
//  Memo.swift
//  Token memo
//
//  Created by hyunho lee on 2023/05/15.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()

// Clipboard History Model
struct ClipboardHistory: Identifiable, Codable {
    var id = UUID()
    var content: String
    var copiedAt: Date = Date()
    var isTemporary: Bool = true // 자동으로 7일 후 삭제

    init(id: UUID = UUID(), content: String, copiedAt: Date = Date(), isTemporary: Bool = true) {
        self.id = id
        self.content = content
        self.copiedAt = copiedAt
        self.isTemporary = isTemporary
    }
}

struct OldMemo: Identifiable, Codable {
    var id = UUID()
    let title: String
    let value: String
    var isChecked: Bool = false
}

// 플레이스홀더 값 모델 - 어느 템플릿에서 추가되었는지 추적
struct PlaceholderValue: Identifiable, Codable {
    var id = UUID()
    var value: String
    var sourceMemoId: UUID  // 이 값을 추가한 메모의 ID
    var sourceMemoTitle: String  // 이 값을 추가한 메모의 제목
    var addedAt: Date = Date()

    init(id: UUID = UUID(), value: String, sourceMemoId: UUID, sourceMemoTitle: String, addedAt: Date = Date()) {
        self.id = id
        self.value = value
        self.sourceMemoId = sourceMemoId
        self.sourceMemoTitle = sourceMemoTitle
        self.addedAt = addedAt
    }
}

struct Memo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var value: String
    var isChecked: Bool = false
    var lastEdited: Date = Date()
    var isFavorite: Bool = false
    var clipCount: Int = 0

    // New features
    var category: String = "기본"
    var isSecure: Bool = false
    var isTemplate: Bool = false
    var templateVariables: [String] = []
    var shortcut: String?

    // 템플릿의 플레이스홀더 값들 저장 (예: {이름}: [유미, 주디, 리이오])
    var placeholderValues: [String: [String]] = [:]

    init(id: UUID = UUID(), title: String, value: String, isChecked: Bool = false, lastEdited: Date = Date(), isFavorite: Bool = false, category: String = "기본", isSecure: Bool = false, isTemplate: Bool = false, templateVariables: [String] = [], shortcut: String? = nil, placeholderValues: [String: [String]] = [:]) {
        self.id = id
        self.title = title
        self.value = value
        self.isChecked = isChecked
        self.lastEdited = lastEdited
        self.isFavorite = isFavorite
        self.category = category
        self.isSecure = isSecure
        self.isTemplate = isTemplate
        self.templateVariables = templateVariables
        self.shortcut = shortcut
        self.placeholderValues = placeholderValues
    }
    
    init(from oldMemo: OldMemo) {
        self.id = oldMemo.id
        self.title = oldMemo.title
        self.value = oldMemo.value
        self.isChecked = oldMemo.isChecked
        self.lastEdited = Date() // 새로운 버전에서 추가된 속성 초기화
        self.isFavorite = false
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case value
        case isChecked
        case lastEdited = "lastEdited"
        case isFavorite = "isFavorite"
        case clipCount
        case category
        case isSecure
        case isTemplate
        case templateVariables
        case shortcut
        case placeholderValues
    }
    
    static var dummyData: [Memo] = [
        Memo(title: "계좌번호",
             value: "123412341234123412341234123412341234123412341234",
             lastEdited: dateFormatter.date(from: "2023-08-31 10:00:00")!),
        Memo(title: "부모님 댁 주소",
             value: "거기 어딘가",
             lastEdited: dateFormatter.date(from: "2023-08-31 10:00:00")!),
        Memo(title: "통관번호",
             value: "p12341234",
             lastEdited: dateFormatter.date(from: "2023-08-31 10:00:00")!)
    ]
}
