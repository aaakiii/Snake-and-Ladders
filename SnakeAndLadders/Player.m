#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _over = NO;
    }
    
    _gameLogic = @{[NSNumber numberWithInteger:4]: [NSNumber numberWithInteger:14],
                   [NSNumber numberWithInteger:9]: [NSNumber numberWithInteger:31],
                   [NSNumber numberWithInteger:20]: [NSNumber numberWithInteger:38],
                   [NSNumber numberWithInteger:28]: [NSNumber numberWithInteger:84],
                   [NSNumber numberWithInteger:40]: [NSNumber numberWithInteger:59],
                   [NSNumber numberWithInteger:51]: [NSNumber numberWithInteger:67],
                   [NSNumber numberWithInteger:63]: [NSNumber numberWithInteger:81],
                   [NSNumber numberWithInteger:17]: [NSNumber numberWithInteger:7],
                   [NSNumber numberWithInteger:64]: [NSNumber numberWithInteger:60],
                   [NSNumber numberWithInteger:89]: [NSNumber numberWithInteger:26],
                   [NSNumber numberWithInteger:95]: [NSNumber numberWithInteger:75],
                   [NSNumber numberWithInteger:99]: [NSNumber numberWithInteger:78]};
    return self;
}

-(void) roll
{
    NSInteger random = arc4random_uniform(6) + 1;
    _currentSquare += random;
    NSNumber *randomNum = [NSNumber numberWithInteger:_currentSquare];
    
    NSLog(@"You rolled a %ld",(long)random);
    if([_gameLogic objectForKey:randomNum] != NULL){
        NSInteger value = [_gameLogic[randomNum] integerValue];
        if(_currentSquare > value){
            _currentSquare = value;
            NSLog(@"Oops!! You landed on snake's  head. Now you landed on %ld", (long)_currentSquare);
        }else{
            _currentSquare = value;
            NSLog(@"Stairway to heaven!! You jumped from %ld to %ld",[_gameLogic[randomNum] integerValue], (long)_currentSquare);
        }
    }else{
        NSLog(@"You landed on %ld",(long)_currentSquare);
    }
}

-(BOOL)gameOver
{
    if(_currentSquare >= 100){
        _over = YES;
    }else{
        _over = NO;
    }
    return _over;
}
@end
