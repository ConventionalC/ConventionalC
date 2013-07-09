conventional-c
==============

Cocoapod and static library to provide defaults and convenience methods for terser Objective-C.

 * Rubyish categories approximate methods of Ruby objects.
 * Conventions are added for initializers and other methods to reduce obvious and nil arguments.
 * Terse alternatives are provided.

**master** [![Build Status](https://travis-ci.org/ConventionalC/ConventionalC.png?branch=master)](https://travis-ci.org/ConventionalC/ConventionalC)

**develop** [![Build Status](https://travis-ci.org/ConventionalC/ConventionalC.png?branch=develop)](https://travis-ci.org/ConventionalC/ConventionalC)

Rubyish Categories
------------------
Objective-C equivalents are provided for many ruby methods. Methods are based off of Ruby 2.0. Objective-C conventions are followed; For example, boolean returning methods start with verbs like 'is'. Methods with mutable versions like `collect!` are named with a noun like `collected` for the immutable version and with a verb like `collect` for the mutable. Where typing is important, multiple methods may be provided where only one is needed for Ruby.

Examples:
 * Array.new(10, 'A') -> [NSArray newWithSize:10 object:@"A"]
 * Array.new[a, b, c] -> [NSArray new:a, b, c, nil]
 * array.empty? -> array.isEmpty
 * array.map(...) -> [array mapped:...]
 * array.map!(...) -> [mutableArray map:...]
 * string.start_with('prefix') -> [string startsWith:@"prefix"]
 * string.start_with('prefix1', 'prefix2') -> [string startsWithAny:@[@"prefix1", @"prefix2"]]

