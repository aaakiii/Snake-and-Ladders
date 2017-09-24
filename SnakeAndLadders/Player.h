#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSInteger currentSquare;
@property NSDictionary *gameLogic;
@property BOOL over;
-(void) roll;
-(BOOL)gameOver;
@end
