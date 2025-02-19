# SimpleFileLogger
Same interface as OS.Log but it logs to a file. Good for PoCs, Prototypes, toy apps.

## 1. Add to your project

Add to xcode project via url: `https://github.com/nacho4d/SimpleFileLogger.git`

## 2. Usage

### 2.1 Basic usage

```swift
import SimpleFileLogger

let logger = FileLogger.default
loggger.debug("This is a debug log")
loggger.error("This is an error log")
```

Above code will create a file with the pattern name "Log-yyyyMMdd-HHmmss.txt" in Documents folder.

Each log line will be appended to the same file.

`default` instance will use JST (Japan standard time) 

### 2.2 Create other logger

A FileLogger instance write to its own file so you can create another file:

```swift
import SimpleFileLogger

let logger = FileLogger(TimeZone(identifier: "Canada/Central"))
loggger.debug("This is another debug log")
loggger.info("This is an info log")
```

### 2.3 Find the logger file

You can get the log file url and use it as you need.

```swift
let fileUrl = logger.url
```
