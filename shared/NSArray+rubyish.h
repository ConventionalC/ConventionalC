#import "ConventionalC_Shared.h"

// Methods based off of Ruby 2.0.
// See NSMutableArray+rubyish.h for mutation methods.
// When methods have a mutable and immutable method, 

@interface NSArray(rubyish)
  // `[](*args)`. Use Objective-C literal @[].

  // `new(size=0, obj=nil)`
  // `nil` replaced with `NSNull.null`, since size is expected.
  +(id)newWithSize:(int)size object:(id)o;
  // Defaults entries to `NSNull.null`.
  +(id)newWithSize:(int)size;

  // not implemented: `new(array)` Use NSArray's +arrayWithArray.

  // `new(size) {|index| block }`
  // `nil` replaced with `NSNull`, since size is expected.
  +(id)newWithSize:(int)size block:(IndexReturnBlock)block;

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

  // `at(index) → obj or nil`
  -(id)at:(NSUInteger)index;

  // not implemented: `bsearch {|x| block } → elem`
  // not implemented: `clear → ary`

  // `collect { |item| block } → new_ary`
  // `nil` is replaced with `NSNull.null`.
  -(NSArray*)collected:(ObjectReturnBlock)b;
  // not implemented: `collect → Enumerator`
  // not implemented: `collect! {|item| block } → ary`
  // not implemented: `collect! → Enumerator`

  // not implemented: `combination(n) { |c| block } → ary`
  // not implemented: `combination(n) → Enumerator`

  // `compact → new_ary`
  -(NSArray*)compacted;
  // not implemented: `compact! → ary or nil`

  // not implemented: `concat(other_ary) → ary`
  // `count → int` Use NSArray's -count.
  // not implemented: `count(obj) → int`
  // not implemented: `count { |item| block } → int`
  // not implemented: `cycle(n=nil) { |obj| block } → nil`
  // not implemented: `cycle(n=nil) → Enumerator`
  // not implemented: `delete(obj) → item or nil`
  // not implemented: `delete(obj) { block } → item or result of block`
  // not implemented: `delete_at(index) → obj or nil`
  // not implemented: `delete_if { |item| block } → ary`
  // not implemented: `delete_if → Enumerator`
  // not implemented: `drop(n) → new_ary`
  // not implemented: `drop_while { |arr| block } → new_ary`
  // not implemented: `drop_while → Enumerator`

  // `each {|item| block } → ary`
  -(void)each:(ObjectBlock)block;
  // not implemented: `each → an_enumerator`, since NSArray is an enumerator.


  // `each_index {|index| block } → ary`
  -(void)eachIndex:(IndexBlock)block;
  // not implemented: `each_index → an_enumerator`

  // Not from ruby.
  -(void)eachIndexAndObject:(IndexAndObjectBlock)block;

  // `empty? → true or false`
  -(BOOL)isEmpty;

  // `eql?(other) → true or false` Use -isEqual:

  // not implemented: `fetch(index) → obj`
  // not implemented: `fetch(index, default) → obj`
  // not implemented: `fetch(index) { |index| block } → obj`

  // not implemented: `fill(obj) → ary`
  // not implemented: `fill(obj, start [, length]) → ary`
  // not implemented: `fill(obj, range ) → ary`
  // not implemented: `fill { |index| block } → ary`
  // not implemented: `fill(start [, length] ) { |index| block } → ary`
  // not implemented: `fill(range) { |index| block } → ary`
  // `find_index(obj) → int or nil` Use indexOfObject:
  // `find_index { |item| block } → int or nil` Use indexOfObjectPassingTest:
  // not implemented: `find_index → Enumerator`

  // `first → obj or nil`
  -(id)first;

  // not implemented: `first(n) → new_ary`
  // not implemented: `flatten → new_ary`
  // not implemented: `flatten(level) → new_ary`
  // not implemented: `flatten! → ary or nil`
  // not implemented: `flatten!(level) → ary or nil`
  // not implemented: `frozen? → true or false`
  // not implemented: `hash → fixnum`
  // not implemented: `include?(object) → true or false`
  // not implemented: `index(obj) → int or nil`
  // not implemented: `index { |item| block } → int or nil`
  // not implemented: `index → Enumerator`
  // not implemented: `initialize_copy(other_ary) → ary`
  // not implemented: `insert(index, obj...) → ary`
  // not implemented: `inspect → string`
  // not implemented: `to_s → string`
  // not implemented: `join(separator=$,) → str`
  // not implemented: `keep_if { |item| block } → ary`
  // not implemented: `keep_if → Enumerator`
  // not implemented: `last → obj or nil`

  // `last(n) → new_ary`
  -(id)last;

  // `length → int`
  -(NSUInteger)length;

  // `map { |item| block } → new_ary`
  // `nil` is replaced with `NSNull.null`.
  -(NSArray*)mapped:(ObjectReturnBlock)b;
  // not implemented: `map → Enumerator`
  // not implemented: `map! {|item| block } → ary`
  // not implemented: `map! → Enumerator`

  // not implemented: `pack ( aTemplateString ) → aBinaryString`
  // not implemented: `permutation { |p| block } → ary`
  // not implemented: `permutation → Enumerator`
  // not implemented: `permutation(n) { |p| block } → ary`
  // not implemented: `permutation(n) → Enumerator`
  // not implemented: `pop → obj or nil`
  // not implemented: `pop(n) → new_ary`
  // not implemented: `product(other_ary, ...) → new_ary`
  // not implemented: `product(other_ary, ...) { |p| block } → ary`
  // not implemented: `push(obj, ... ) → ary`
  // not implemented: `rassoc(obj) → new_ary or nil`
  // not implemented: `reject {|item| block } → new_ary`
  // not implemented: `reject → Enumerator`
  // not implemented: `reject! { |item| block } → ary or nil`
  // not implemented: `reject! → Enumerator`
  // not implemented: `repeated_combination(n) { |c| block } → ary`
  // not implemented: `repeated_combination(n) → Enumerator`
  // not implemented: `repeated_permutation(n) { |p| block } → ary`
  // not implemented: `repeated_permutation(n) → Enumerator`
  // not implemented: `replace(other_ary) → ary`

  // `reverse → new_ary`
  -(NSArray*)reversed;
  // not implemented: `reverse! → ary`
  // not implemented: `reverse_each { |item| block } → ary`
  // not implemented: `reverse_each → Enumerator`

  // not implemented: `rindex(obj) → int or nil`
  // not implemented: `rindex { |item| block } → int or nil`
  // not implemented: `rindex → Enumerator`
  // not implemented: `rotate(count=1) → new_ary`
  // not implemented: `rotate!(count=1) → ary`

  // not implemented: `sample → obj`
  -(id)sample;
  // not implemented: `sample(random: rng) → obj`
  // not implemented: `sample(n) → new_ary`
  // not implemented: `sample(n, random: rng) → new_ary`

  // not implemented: `select { |item| block } → new_ary`
  -(NSArray*)selected:(ObjectReturnBoolBlock)selectionBlock;
  // not implemented: `select → Enumerator`
  // not implemented: `select! {|item| block } → ary or nil`
  // not implemented: `select! → Enumerator`

  // not implemented: `shift → obj or nil`
  // not implemented: `shift(n) → new_ary`
  // not implemented: `shuffle → new_ary`
  // not implemented: `shuffle(random: rng) → new_ary`
  // not implemented: `shuffle! → ary`
  // not implemented: `shuffle!(random: rng) → ary`

  // `size()`
  -(NSUInteger)size;

  // not implemented: `slice(index) → obj or nil`
  // not implemented: `slice(start, length) → new_ary or nil`
  // not implemented: `slice(range) → new_ary or nil`
  // not implemented: `slice!(index) → obj or nil`
  // not implemented: `slice!(start, length) → new_ary or nil`
  // not implemented: `slice!(range) → new_ary or nil`

  // `sort → new_ary`
  // Uses the compare: method of objects.
  -(NSArray*)sorted;
  // not implemented: `sort { |a, b| block } → new_ary` Use sortedArrayUsingComparator:.
  // not implemented: `sort! → ary`
  // not implemented: `sort! { |a, b| block } → ary`
  // not implemented: `sort_by! { |obj| block } → ary`
  // not implemented: `sort_by! → Enumerator`

  // not implemented: `take(n) → new_ary`
  // not implemented: `take_while { |arr| block } → new_ary`
  // not implemented: `take_while → Enumerator`
  // not implemented: `to_a → ary`
  // not implemented: `to_ary → ary`
  // not implemented: `to_s()`
  // not implemented: `transpose → new_ary`
  // not implemented: `uniq → new_ary`
  // not implemented: `uniq { |item| ... } → new_ary`
  // not implemented: `uniq! → ary or nil`
  // not implemented: `uniq! { |item| ... } → ary or nil`
  // not implemented: `unshift(obj, ...) → ary`
  // not implemented: `values_at(selector, ...) → new_ary`
  // not implemented: `zip(arg, ...) → new_ary`
  // not implemented: `zip(arg, ...) { |arr| block } → nil`
  // not implemented: `ary | other_ary → new_ary`

@end
