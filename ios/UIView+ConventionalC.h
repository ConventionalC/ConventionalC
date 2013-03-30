#import <UIKit/UIKit.h>

@interface UIView(ConventionalC)

-(void)updateFrame:(CGRect(^)(CGRect))update;
@property(assign) CGPoint origin;
@property(assign) CGFloat x;
@property(assign) CGFloat y;
@property(assign) CGSize  size;
@property(assign) CGFloat width;
@property(assign) CGFloat height;

@end
