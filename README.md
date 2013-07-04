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
Objective-C equivalents are provided for many ruby methods. Objective-C conventions are followed; For example, boolean returning methods start with verbs like 'is'. Methods with mutable versions like `collect!` will be named with a noun like `collected` for the immutable version and with a verb like `collect` for the mutable.

Examples:
 * Array.new(10, 'A') -> [NSArray newWithSize:10 object:@"A"]
 * Array.new[a, b, c] -> [NSArray new:a, b, c, nil]
 * array.empty? -> array.isEmpty

