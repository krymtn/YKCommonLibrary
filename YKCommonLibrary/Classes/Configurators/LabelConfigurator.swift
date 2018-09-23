//
//  LabelConfigurator.swift
//  YKCommonLibrary
//
//  Created by Koray Metin on 21.09.2018.
//

import Foundation

open class LabelConfigurator: BaseUIConfigurator {}

public struct LabelConfigurators {

    public var thin: LabelConfigurator?
    public var regular: LabelConfigurator?
    public var bold: LabelConfigurator?
    public var block: LabelConfigurator?
}

extension LabelConfigurators: Decodable {

    public enum CodingKeys: String, CodingKey {
        case thin
        case regular
        case bold
        case block
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        thin = try container.decodeIfPresent(LabelConfigurator.self, forKey: .thin)
        regular = try container.decodeIfPresent(LabelConfigurator.self, forKey: .regular)
        bold = try container.decodeIfPresent(LabelConfigurator.self, forKey: .bold)
        block = try container.decodeIfPresent(LabelConfigurator.self, forKey: .block)
    }
}
