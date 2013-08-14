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
  -(NSMutableArray*)flatten:(NSUInteger)level;// `flatten!(level) → ary or nil`
  -(NSMutableArray*)insertArray:(NSArray*)objects at:(NSUInteger)index;// `insert(index, obj...) → ary`
  -(NSMutableArray*)keepIf:(ObjectReturnBoolBlock)block;// `keep_if { |item| block } → ary`
  -(NSMutableArray*)map:(ObjectReturnBlock)b; // `map! {|item| block } → ary`. // `nil` is replaced with `NSNull.null`.
  -(id)pop;//`pop → obj or nil`
  -(NSArray*)pop:(NSUInteger)n;// `pop(n) → new_ary`
  -(NSMutableArray*)push:(id)object;// `push(obj, ... ) → ary` Not implemented – multiple
  -(NSMutableArray*)reject:(ObjectReturnBoolBlock)block;// `reject! { |item| block } → ary or nil`
  -(NSMutableArray*)replace:(NSArray*)otherArray;// `replace(other_ary) → ary`
  -(NSMutableArray*)reverse;// `reverse! → ary`
  -(NSMutableArray*)rotate;// `rotate! → ary`
  -(NSMutableArray*)rotate:(int)count;// `rotate!(count=1) → ary`

  -(NSMutableArray*)select:(ObjectReturnBoolBlock)selectionBlock;// `select! {|item| block } → ary or nil`

  -(id)shift;// `shift → obj or nil`
  -(NSArray*)shift:(NSUInteger)n;// `shift(n) → new_ary`

  -(NSMutableArray*)shuffle;// `shuffle! → ary`
  // not implemented: `shuffle!(random: rng) → ary`, arc4random_uniform is used

  -(id)slice:(NSUInteger)index;// `slice!(index) → obj or nil`
  // not implemented: `slice!(negative index) → obj or nil`
  -(NSArray*)slice:(NSUInteger)start length:(NSUInteger)length;// `slice!(start, length) → new_ary or nil`
  -(NSArray*)sliceRange:(NSRange)range;// `slice!(range) → new_ary or nil`

  -(NSMutableArray*)sort;// `sort! → ary`. Uses the compare: method of objects.
  -(NSMutableArray*)sort:(NSComparator)block;// `sort! { |a, b| block } → ary`
  -(NSMutableArray*)sortBy:(ObjectReturnBlock)block;// `sort_by! { |obj| block } → ary`

  // not implemented: `uniq! → ary or nil`
  // not implemented: `uniq! { |item| ... } → ary or nil`

  -(NSMutableArray*)unshift:(id)object;// `unshift(obj, ...) → ary` Not implemented – multiple

@end
