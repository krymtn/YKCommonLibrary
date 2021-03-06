//
//  UIConfigurators.swift
//  YKCommonLibrary
//
//  Created by Koray Metin on 20.09.2018.
//

import Foundation

public protocol UIConfigElements {
    var BUTTONCONFIG: BaseButtonConfigurator! { get set }
    var LABELCONFIG: LabelConfigurators! { get set }
    var TEXTFIELDCONFIG: TextFieldConfigurator! { get set }
}

open class BaseUIConfigurator: Decodable {

    public var color: ColorConfigurator?
    public var shape: ShapeConfigurator?

    public init() { }

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
            guard let bgHex = color?.backgroundHex else { return .clear }
            return bgHex.UIColor
        }
    }

    public var textColor: UIColor {
        get {
            guard let txtHex = color?.textHex else { return .black }
            return txtHex.UIColor
        }
    }

    public var borderColor: UIColor {
        guard let brdHex = color?.borderHex else { return .clear }
        return brdHex.UIColor
    }

    public var placeholderColor: UIColor {
        guard let _placeholderHex = color?.placeholderHex else { return .lightGray }
        return _placeholderHex.UIColor
    }
}

extension BaseUIConfigurator: Shapeable {
    public var font: String? {
        guard let fontname = shape?.fontName else { return nil }
        return fontname
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
    public var placeholderHex: String?

    public enum CodingKeys: String, CodingKey {
        case backgroundHex = "background"
        case textHex = "text"
        case borderHex = "border"
        case shadowHex = "shadow"
        case placeholderHex = "placeholder"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        backgroundHex = try container.decodeIfPresent(String.self, forKey: .backgroundHex)
        textHex = try container.decodeIfPresent(String.self, forKey: .textHex)
        borderHex = try container.decodeIfPresent(String.self, forKey: .borderHex)
        shadowHex = try container.decodeIfPresent(String.self, forKey: .shadowHex)
        placeholderHex = try container.decodeIfPresent(String.self, forKey: .placeholderHex)
    }
}

public struct ShapeConfigurator: Decodable {

   public var borderWidthValue: Float?
   public var cornerRadiusValue: Float?
   public var fontName: String?

    public enum CodingKeys: String, CodingKey {
        case borderWidthValue = "borderWidth"
        case cornerRadiusValue = "cornerRadius"
        case fontName = "font"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        borderWidthValue = try container.decodeIfPresent(Float.self, forKey: .borderWidthValue)
        cornerRadiusValue = try container.decodeIfPresent(Float.self, forKey: .cornerRadiusValue)
        fontName = try container.decodeIfPresent(String.self, forKey: .fontName)
    }
}



