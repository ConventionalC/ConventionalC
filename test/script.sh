set -e

xctool -project ConventionalC.xcodeproj -scheme ConventionalC-Shared -sdk iphonesimulator clean build test
xctool -project ConventionalC.xcodeproj -scheme ConventionalC-iOS -sdk iphonesimulator clean build test
xctool -project ConventionalC.xcodeproj -scheme ConventionalC-Mac clean build test

pod spec lint ConventionalC.podspec
