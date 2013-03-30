#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

@interface NSDate(ConventionalC)

@property(nonatomic, readonly) NSInteger hour;
@property(nonatomic, readonly) NSInteger minute;
@property(nonatomic, readonly) NSInteger second;

@end
