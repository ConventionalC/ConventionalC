#import "ConventionalC_Shared.h"

// Methods based off of Ruby 1.9.3.
// '...' comment inserted where methods listed by Ruby documentation are skipped.

@interface NSArray(rubyish)
  // not implemented: `[](*args)`

  // `new(size=0, obj=nil)` 
  // defaults not implemented.
  // `nil` replaced with `NSNull`, since size is expected.
  +(id)newWithSize:(int)size object:(id)o;

  // not implemented: `new(array)`

  // `new(size) {|index| block }`
  // `nil` replaced with `NSNull`, since size is expected.
  +(id)newWithSize:(int)size block:(IndexReturnBlock)block;

  // ...

  // `each {|item| block } → ary`
  -(void)each:(ObjectBlock)block;
  // not implemented: `each → an_enumerator`, since NSArray is an enumerator.


  // `each_index {|index| block } → ary`
  -(void)eachIndex:(IndexBlock)block;
  // not implemented: `each_index → an_enumerator`

  // Not from ruby.
  -(void)eachIndexAndObject:(IndexAndObjectBlock)block;

  // ...

  // `empty? → true or false`
  -(BOOL)isEmpty;

  // ...

@end
