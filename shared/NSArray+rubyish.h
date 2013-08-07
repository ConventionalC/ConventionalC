#import "ConventionalC_Shared.h"

// Methods based off of Ruby 2.0.
// See NSMutableArray+rubyish.h for mutation methods.
// When methods have a mutable and immutable method, the mutable method is named like 'map', and the
// immutable version is 'mapped'.
// Alternative empty argument methods that return enumerators are not implemented.
@interface NSArray(rubyish)
  // `[](*args)`. Use Objective-C literal @[].
  +(id)newWithSize:(int)size object:(id)o; // `new(size=0, obj=nil)`. `nil` replaced with `NSNull.null`, since size is expected.
  +(id)newWithSize:(int)size; // Defaults entries to `NSNull.null`.

  // not implemented: `new(array)` Use NSArray's +arrayWithArray.

  +(id)newWithSize:(int)size block:(IndexReturnBlock)block; // `new(size) {|index| block }`. `nil` replaced with `NSNull`, since size is expected.

  // not implemented: `try_convert(obj) → array or nil`
  // not implemented: `ary & other_ary → new_ary`
  // not implemented: `ary * int → new_ary`
  // not implemented: `ary * str → new_string`
  // not implemented: `ary + other_ary → new_ary`
  // not implemented: `ary - other_ary → new_ary`
  // not implemented: `ary <=> other_ary → -1, 0, +1 or nil`
  // not implemented: `ary == other_ary → bool`
  // `ary[index] → obj or nil` Use Objective-C subscript like `ary[index]`.
  // not implemented: `ary[start, length] → new_ary or nil`
  // not implemented: `ary[range] → new_ary or nil`
  // not implemented: `slice(index) → obj or nil`
  // not implemented: `slice(start, length) → new_ary or nil`
  // not implemented: `slice(range) → new_ary or nil`
  // `ary[index] = obj → obj` Use Objective-C subscript like `ary[index] = obj`.
  // not implemented: `ary[start, length] = obj or other_ary or nil → obj or other_ary or nil`
  // not implemented: `ary[range] = obj or other_ary or nil → obj or other_ary or nil`
  // not implemented: `assoc(obj) → new_ary or nil`

  -(id)at:(NSUInteger)index; // `at(index) → obj or nil`

  // not implemented: `bsearch {|x| block } → elem`

  -(NSArray*)collected:(ObjectReturnBlock)b; // `collect { |item| block } → new_ary`. `nil` is replaced with `NSNull.null`.

  // not implemented: `combination(n) { |c| block } → ary`

  -(NSArray*)compacted; // `compact → new_ary`

  // `count → int` Use NSArray's -count.
  // not implemented: `count(obj) → int`
  // not implemented: `count { |item| block } → int`
  // not implemented: `cycle(n=nil) { |obj| block } → nil`
  // not implemented: `drop(n) → new_ary`
  // not implemented: `drop_while { |arr| block } → new_ary`

  -(void)each:(ObjectBlock)block; // `each {|item| block } → ary`
  -(void)eachIndex:(IndexBlock)block; // `each_index {|index| block } → ary`
  // not implemented: `each_index → an_enumerator`

  -(void)eachIndexAndObject:(IndexAndObjectBlock)block; // Not from ruby.
  -(BOOL)isEmpty; // `empty? → true or false`

  // `eql?(other) → true or false` Use -isEqual:

  // not implemented: `fetch(index) → obj`
  // not implemented: `fetch(index, default) → obj`
  // not implemented: `fetch(index) { |index| block } → obj`

  // not implemented: `find_index(obj) → int or nil` Use indexOfObject:
  // not implemented: `find_index { |item| block } → int or nil` Use indexOfObjectPassingTest:

  -(id)first; // `first → obj or nil`

  // not implemented: `first(n) → new_ary`
  // not implemented: `flatten → new_ary`
  // not implemented: `flatten(level) → new_ary`
  // not implemented: `frozen? → true or false`
  // not implemented: `hash → fixnum`
  // not implemented: `include?(object) → true or false`
  // not implemented: `index(obj) → int or nil`
  // not implemented: `index { |item| block } → int or nil`
  // not implemented: `initialize_copy(other_ary) → ary`
  // not implemented: `inspect → string`
  // not implemented: `to_s → string`
  // not implemented: `join(separator=$,) → str`
  // not implemented: `last → obj or nil`

  -(id)last; // `last(n) → new_ary`
  -(NSUInteger)length; // `length → int`
  -(NSArray*)mapped:(ObjectReturnBlock)b; // `map { |item| block } → new_ary`. `nil` is replaced with `NSNull.null`.

  // not implemented: `pack ( aTemplateString ) → aBinaryString`
  // not implemented: `permutation { |p| block } → ary`
  // not implemented: `permutation(n) { |p| block } → ary`
  // not implemented: `product(other_ary, ...) → new_ary`
  // not implemented: `product(other_ary, ...) { |p| block } → ary`
  // not implemented: `rassoc(obj) → new_ary or nil`
  // not implemented: `reject {|item| block } → new_ary`
  // not implemented: `repeated_combination(n) { |c| block } → ary`
  // not implemented: `repeated_permutation(n) { |p| block } → ary`
  // not implemented: `replace(other_ary) → ary`

  -(NSArray*)reversed; // `reverse → new_ary`
  // not implemented: `reverse_each { |item| block } → ary`

  // not implemented: `rindex(obj) → int or nil`
  // not implemented: `rindex { |item| block } → int or nil`
  // not implemented: `rotate(count=1) → new_ary`

  -(id)sample; // `sample → obj`
  // not implemented: `sample(random: rng) → obj`
  // not implemented: `sample(n) → new_ary`
  // not implemented: `sample(n, random: rng) → new_ary`

  -(NSArray*)selected:(ObjectReturnBoolBlock)selectionBlock; // `select { |item| block } → new_ary`
  // not implemented: `select! {|item| block } → ary or nil`

  -(NSArray*)shuffled; // `shuffle → new_ary`
  // not implemented: `shuffle(random: rng) → new_ary`

  -(NSUInteger)size; // `size()`

  // not implemented: `slice(index) → obj or nil`
  // not implemented: `slice(start, length) → new_ary or nil`
  // not implemented: `slice(range) → new_ary or nil`

  -(NSArray*)sorted; // `sort → new_ary`. Uses the compare: method of objects.
  // not implemented: `sort { |a, b| block } → new_ary` Use sortedArrayUsingComparator:.

  // not implemented: `take(n) → new_ary`
  // not implemented: `take_while { |arr| block } → new_ary`
  // not implemented: `to_a → ary`
  // not implemented: `to_ary → ary`
  // not implemented: `to_s()`
  // not implemented: `transpose → new_ary`
  // not implemented: `uniq → new_ary`
  // not implemented: `uniq { |item| ... } → new_ary`
  // not implemented: `values_at(selector, ...) → new_ary`
  // not implemented: `zip(arg, ...) → new_ary`
  // not implemented: `zip(arg, ...) { |arr| block } → nil`
  // not implemented: `ary | other_ary → new_ary`

@end
