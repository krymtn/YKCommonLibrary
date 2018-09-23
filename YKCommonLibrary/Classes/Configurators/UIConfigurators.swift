//
//  UIConfigurators.swift
//  YKCommonLibrary
//
//  Created by Koray Metin on 20.09.2018.
//

import Foundation

open class BaseUIConfigurator: Decodable {

    public var color: ColorConfigurator?
    public var shape: ShapeConfigurator?

    public init() {
        self.color = nil
        self.shape = nil
    }

    public enum CodingKeys: String, CodingKey {
        case color
        case shape
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        color = try container.decodeIfPresent(ColorConfigurator.self, forKey: .color)
        shape = try container.decodeIfPresent(ShapeConfigurator.self, forKey: .shape)
    }
}


extension BaseUIConfigurator: Colorable {
    public var backgroundColor: UIColor {
        get {
            guard let bgHex = color?.backgroundHex else { return .red }
            return bgHex.UIColor
        }
    }

    public var textColor: UIColor {
        get {
            guard let txtHex = color?.textHex else { return .white }
            return txtHex.UIColor
        }
    }

    public var borderColor: UIColor {
        guard let brdHex = color?.borderHex else { return .white }
        return brdHex.UIColor
    }
}

extension BaseUIConfigurator: Shapeable {
    public var font: UIFont {
        guard let fontname = shape?.fontValue, let customFont = UIFont.init(name: fontname, size: 14) else { return UIFont.systemFont(ofSize: 14) }
        return customFont
    }

    public var cornerRadius: CGFloat {
        guard let radius = shape?.cornerRadiusValue else { return CGFloat(0.0) }
        return CGFloat(radius)
    }

    public var borderWidth: CGFloat {
        guard let width = shape?.borderWidthValue else { return CGFloat(0.0) }
        return CGFloat(width)
    }
}

public struct ColorConfigurator: Decodable {

    public var backgroundHex: String?
    public var textHex: String?
    public var borderHex: String?
    public var shadowHex: String?

    public enum CodingKeys: String, CodingKey {
        case backgroundHex = "background"
        case textHex = "text"
        case borderHex = "border"
        case shadowHex = "shadow"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        backgroundHex = try container.decodeIfPresent(String.self, forKey: .backgroundHex)
        textHex = try container.decodeIfPresent(String.self, forKey: .textHex)
        borderHex = try container.decodeIfPresent(String.self, forKey: .borderHex)
        shadowHex = try container.decodeIfPresent(String.self, forKey: .shadowHex)
    }
}

public struct ShapeConfigurator: Decodable {

   public var borderWidthValue: Float?
   public var cornerRadiusValue: Float?
   public var fontValue: String?

    public enum CodingKeys: String, CodingKey {
        case borderWidthValue = "borderWidth"
        case cornerRadiusValue = "cornerRadius"
        case fontValue = "font"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        borderWidthValue = try container.decodeIfPresent(Float.self, forKey: .borderWidthValue)
        cornerRadiusValue = try container.decodeIfPresent(Float.self, forKey: .cornerRadiusValue)
        fontValue = try container.decodeIfPresent(String.self, forKey: .fontValue)
    }
}



