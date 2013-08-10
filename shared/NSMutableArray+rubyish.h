#import "ConventionalC_Shared.h"

// Methods based off of Ruby 2.0.
// See NSArray+rubyish.h for immutable methods.
// When methods have a mutable and immutable method, the mutable method will be named like 'map',
// and the immutable version will be 'mapped'.
// Alternative methods that return enumerators are ignored.
@interface NSMutableArray(rubyish)
  -(NSMutableArray*)clear;                         // `clear → ary`
  -(NSMutableArray*)collect:(ObjectReturnBlock)b;  // `collect! {|item| block } → ary`. `nil` is replaced with `NSNull.null`.
  -(NSMutableArray*)compact;                       // `compact! → ary or nil`
  -(NSMutableArray*)concat:(NSArray*)array;        // `concat(other_ary) → ary`
  -(id)delete:(id)object;                          // `delete(obj) → item or nil`
  -(id)deleteWithBlock:(ReturnBlock)block;         // `delete(obj) { block } → item or result of block`
  -(id)deleteAt:(NSUInteger)index;                 // `delete_at(index) → obj or nil`
  -(NSArray*)deleteIf:(ObjectReturnBoolBlock)block;// `delete_if { |item| block } → ary`

  // `fill(obj) → ary`
  // `fill(obj, start [, length]) → ary`
  // `fill(obj, range ) → ary`
  // `fill { |index| block } → ary`
  // `fill(start [, length] ) { |index| block } → ary`
  // `fill(start [, length] ) { |index| block } → ary`
  // `fill(range) { |index| block } → ary`
  -(NSMutableArray*)fill:(id)object;
  -(NSMutableArray*)fill:(id)object start:(NSUInteger)start;
  -(NSMutableArray*)fill:(id)object start:(NSUInteger)start length:(NSUInteger)length;
  -(NSMutableArray*)fill:(id)object range:(NSRange)range;
  -(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block;
  -(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block start:(NSUInteger)start;
  -(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block start:(NSUInteger)start length:(NSUInteger)length;
  -(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block range:(NSRange)range;

  -(NSMutableArray*)flatten;// `flatten! → ary or nil`
  -(NSMutableArray*)flattenToLevel:(NSUInteger)level;// `flatten!(level) → ary or nil`
  // not implemented: `insert(index, obj...) → ary`
  // not implemented: `keep_if { |item| block } → ary`

  -(NSMutableArray*)map:(ObjectReturnBlock)b; // `map! {|item| block } → ary`. // `nil` is replaced with `NSNull.null`.


  -(id)pop; //`pop → obj or nil`
  // not implemented: `pop(n) → new_ary`
  -(NSMutableArray*)push:(id)object; // `push(obj, ... ) → ary` Not implemented – multiple
  // not implemented: `reject! { |item| block } → ary or nil`

  -(NSMutableArray*)replace:(NSArray*)otherArray; // `replace(other_ary) → ary`
  -(NSMutableArray*)reverse; // `reverse! → ary`

  // not implemented: `rotate!(count=1) → ary`

  -(NSMutableArray*)select:(ObjectReturnBoolBlock)selectionBlock; // `select! {|item| block } → ary or nil`

  -(id)shift; // `shift → obj or nil`
  // not implemented: `shift(n) → new_ary`

  -(NSMutableArray*)shuffle; // `shuffle! → ary`
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

  -(NSMutableArray*)unshift:(id)object; // `unshift(obj, ...) → ary` Not implemented – multiple

@end
