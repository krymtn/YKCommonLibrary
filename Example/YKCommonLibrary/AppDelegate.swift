//
//  AppDelegate.swift
//  YKCommonLibrary
//
//  Created by krymtn on 09/19/2018.
//  Copyright (c) 2018 krymtn. All rights reserved.
//

import UIKit
import XCGLogger

public let log: XCGLogger = {
    let log = XCGLogger.default
    let emojiLogFormatter = PrePostFixLogFormatter()
    emojiLogFormatter.apply(prefix: "🗯🗯🗯 ", postfix: " 🗯🗯🗯", to: .verbose)
    emojiLogFormatter.apply(prefix: "🔹🔹🔹 ", postfix: " 🔹🔹🔹", to: .debug)
    emojiLogFormatter.apply(prefix: "ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️", to: .info)
    emojiLogFormatter.apply(prefix: "⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️", to: .warning)
    emojiLogFormatter.apply(prefix: "‼️‼️‼️ ", postfix: " ‼️‼️‼️", to: .error)
    emojiLogFormatter.apply(prefix: "💣💣💣 ", postfix: " 💣💣💣", to: .severe)
    log.formatters = [emojiLogFormatter]
    return log
}()

extension Tag {
    static let sensitive = Tag("sensitive")
    static let ui = Tag("ui")
    static let data = Tag("data")
}

// Create custom developers for your logs
extension Dev {
    static let krymtn = Dev("krymtn")
    static let figa = Dev("figa")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: "YKCommonExample.txt", fileLevel: .verbose)
        log.verbose("A verbose message, usually useful when working on a specific problem")
        log.filters = [TagFilter(excludeFrom: [Tag.sensitive, Tag.ui])]
        log.info("sensitive message from krymtn", userInfo: Dev.krymtn | Tag.sensitive)
        log.info("info message from ui", userInfo: Dev.krymtn | Tag.ui)
        log.info("info message from data", userInfo: Dev.krymtn | Tag.data)
        do {
            try AppConfigurator().setApp()
        } catch ConfiguratorError.fileNotFound(let name) { print("\(name) filepath not found")
        } catch ConfiguratorError.invalidJSON { print("Plz check the JSON in jsonLint")
        } catch ConfiguratorError.decoderCodingKeyError { print("Check the keys - property")
        } catch {
        }
        print("time to launch")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

