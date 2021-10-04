//
//  File.swift
//  
//
//  Created by Andrew Marmion on 04/10/2021.
//

import Foundation
import CoreText

public enum Fonts {

    @discardableResult
    private static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }

    public static func registerFonts() {
        Fonts.registerFont(bundle: .module, fontName: "BeautifulPeople-Regular", fontExtension: "ttf")
        Fonts.registerFont(bundle: .module, fontName: "VeganStyle-Regular", fontExtension: "ttf")
    }
}
