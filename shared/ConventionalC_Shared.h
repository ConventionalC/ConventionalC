#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

typedef void(^EmptyBlock)();
typedef id(^ReturnBlock)();
typedef id(^ObjectReturnBlock)(id object);
typedef id(^IndexReturnBlock)(NSUInteger index);
typedef void(^IndexBlock)(NSUInteger index);
typedef void(^ObjectBlock)(id object);
typedef void(^IndexAndObjectBlock)(NSUInteger index, id object);

#import "NSArray+ConventionalC.h"
#import "NSArray+rubyish.h"
#import "NSBundle+ConventionalC.h"
#import "NSDate+ConventionalC.h"
#import "NSObject+ConventionalC.h"
#import "NSSet+rubyish.h"

@interface ConventionalC_Shared : NSObject

@end
