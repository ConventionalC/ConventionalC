#import "ConventionalC_Shared.h"

// Methods based off of Ruby 2.0.
// See NSArray+rubyish.h for immutable methods.
// When methods have a mutable and immutable method, the mutable method will be named like 'map',
// and the immutable version will be 'mapped'.
// Alternative methods that return enumerators are ignored.
@interface NSMutableArray(rubyish)
  // not implemented: `clear → ary`

  // `collect! {|item| block } → ary`
  // `nil` is replaced with `NSNull.null`.
  -(NSMutableArray*)collect:(ObjectReturnBlock)b;

  // `compact! → ary or nil`
  -(NSMutableArray*)compact;

  // `concat(other_ary) → ary`
  -(NSMutableArray*)concat:(NSArray*)otherArray;

  // not implemented: `delete(obj) → item or nil`
  // not implemented: `delete(obj) { block } → item or result of block`
  // not implemented: `delete_at(index) → obj or nil`
  // not implemented: `delete_if { |item| block } → ary`
  // not implemented: `drop(n) → new_ary`
  // not implemented: `drop_while { |arr| block } → new_ary`

  // not implemented: `fill(obj) → ary`
  // not implemented: `fill(obj, start [, length]) → ary`
  // not implemented: `fill(obj, range ) → ary`
  // not implemented: `fill { |index| block } → ary`
  // not implemented: `fill(start [, length] ) { |index| block } → ary`
  // not implemented: `fill(range) { |index| block } → ary`

  // not implemented: `flatten! → ary or nil`
  // not implemented: `flatten!(level) → ary or nil`
  // not implemented: `insert(index, obj...) → ary`
  // not implemented: `keep_if { |item| block } → ary`

  // `map! {|item| block } → ary`
  // `nil` is replaced with `NSNull.null`.
  -(NSMutableArray*)map:(ObjectReturnBlock)b;

  -(id)pop; //`pop → obj or nil`
  // not implemented: `pop(n) → new_ary`
  -(NSMutableArray*)push:(id)object; // `push(obj, ... ) → ary` Not implemented – multiple
  // not implemented: `reject! { |item| block } → ary or nil`

  // `replace(other_ary) → ary`
  -(NSMutableArray*)replace:(NSArray*)otherArray;

  // `reverse! → ary`
  -(NSMutableArray*)reverse;

  // not implemented: `rotate!(count=1) → ary`

  // `select! {|item| block } → ary or nil`
  -(NSMutableArray*)select:(ObjectReturnBoolBlock)selectionBlock;

  // not implemented: `shift → obj or nil`
  // not implemented: `shift(n) → new_ary`

  // `shuffle! → ary`
  -(NSMutableArray*)shuffle;
  // not implemented: `shuffle!(random: rng) → ary`

  // not implemented: `slice!(index) → obj or nil`
  // not implemented: `slice!(start, length) → new_ary or nil`
  // not implemented: `slice!(range) → new_ary or nil`

  // `sort! → ary`
  // Uses the compare: method of objects.
  -(NSMutableArray*)sort;
  // not implemented: `sort! { |a, b| block } → ary`
  // not implemented: `sort_by! { |obj| block } → ary`

  // not implemented: `uniq! → ary or nil`
  // not implemented: `uniq! { |item| ... } → ary or nil`
@end
