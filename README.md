conventional-c
==============

Cocoapod and static library to provide defaults and convenience methods for terser Objective-C.
 * Rubyish categories approximate methods of Ruby objects.
 * Conventions are added for initializers and other methods to reduce obvious and nil arguments.
 * Terse alternatives are provided.


Rubyish Categories
------------------
Objective c equivalents are provided for many ruby methods.

Examples:
 * Array.new(10, 'A') -> [NSArray newWithSize:10 object:@"A"]
 * Array.new[a, b, c] -> [NSArray new:a, b, c, nil]
 * array.empty? -> array.isEmpty

