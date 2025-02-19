//
//  Logger.swift
//  SimpleFileLogger
//
//  Created by  Guillermo Ignacio Enriquez Gutierrez on 2025/02/19.
//  Copyright © 2025 Nacho. All rights reserved.
//

import Foundation

public final class FileLogger: Sendable {

    public static let `default`: FileLogger = .init(timeZone: TimeZone(identifier: "Asia/Tokyo")!)

    private let logFileURL: URL
    private let dateFormatter: DateFormatter
    private let fileHandle: FileHandle?

    var url: URL {
        return logFileURL
    }

    public init(timeZone: TimeZone) {
        let fileManager = FileManager.default
        let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd-HHmmss"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = timeZone
        self.dateFormatter = dateFormatter

        let fileName = "Log-\(dateFormatter.string(from: Date())).txt"
        logFileURL = docsURL.appendingPathComponent(fileName)

        if !fileManager.fileExists(atPath: logFileURL.path) {
            fileManager.createFile(atPath: logFileURL.path, contents: nil, attributes: nil)
        }

        fileHandle = try? FileHandle(forWritingTo: logFileURL)
        fileHandle?.seekToEndOfFile()
        info("Start logging at \(dateFormatter.string(from: Date()))")
        NSLog("File was created at: \(logFileURL.path)")
    }

    deinit {
        do {
            try fileHandle?.close()
        } catch {
            NSLog("Could not close file handle: \(error)")
        }
    }

    private func writeLog(_ message: String) {
        let timestamp = dateFormatter.string(from: Date())
        let logMessage = "\(timestamp) \(message)\n"
        if let data = logMessage.data(using: .utf8) {
            fileHandle?.write(data)
        }
    }

    public func log(_ message: String) { writeLog(message) }
    public func log(level: StaticString, _ message: String) { writeLog("[\(level)] \(message)") }
    public func trace(_ message: String) { log(level: "TRACE", message) }
    public func debug(_ message: String) { log(level: "DEBUG", message) }
    public func info(_ message: String) { log(level: "INFO", message) }
    public func notice(_ message: String) { log(level: "NOTICE", message) }
    public func warning(_ message: String) { log(level: "WARN", message) }
    public func error(_ message: String) { log(level: "ERROR", message) }
    public func critical(_ message: String) { log(level: "CRITICAL", message) }
    public func fault(_ message: String) { log(level: "FAULT", message) }
}
