#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"=====Welcome to Snake & Ladders.=====");
        Player *player = [Player new];
        
        while(TRUE){
            NSLog(@"Pls enter 'roll' to start the game.");
            char input[10];
            fgets (input, 10, stdin);
            NSString *inputString = [[NSString alloc] initWithUTF8String:input];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if([inputString isEqualToString:@"roll" ] || [inputString isEqualToString:@"r"]){
                [player roll];
                if([player gameOver]){
                    NSLog(@"Congrats!!!");
                    break;
                }
            }
        }
    }
    return 0;
}
