//
//  main.m
//  Day09
//
//  Created by Li, Chenxi on 3/30/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str = @"Hello, Lexi.";
    NSError *err1;
    [str writeToFile:@"/Users/chenxli/Desktop/hello.txt" atomically:NO encoding:NSUTF8StringEncoding error:&err1];
    if (err1 != nil)
    {
        NSLog(@"%@", err1.localizedDescription);
    }
    else
    {
        NSLog(@"Success Write.");
    }
    
    NSError *err2;
    NSString *readStr = [NSString stringWithContentsOfFile:@"/Users/chenxli/Desktop/hello.txt" encoding:NSUTF8StringEncoding error:&err2];
    if (err2 != nil)
    {
        NSLog(@"%@", err2.localizedDescription);
    }
    else
    {
        NSLog(@"Success Read: %@.", readStr);
    }
    
    NSURL *u1 = [NSURL URLWithString:@"http://www.itcast.cn"];
    NSString *html = [NSString stringWithContentsOfURL:u1 encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"%@", html);
    
    NSURL *u2 = [NSURL URLWithString:@"file:///Users/chenxli/Desktop/hello.txt"];
    NSString *writeToURL = @"write to url";
    BOOL res = [writeToURL writeToURL:u2 atomically:NO encoding:NSUTF8StringEncoding error:nil];
    
    NSString *str1 = @"Lexi";
    NSString *str2 = @"Jack";
    NSComparisonResult compareRes = [str1 compare:str2];
    switch (compareRes) {
        case NSOrderedAscending:
            NSLog(@"%@ is smaller than %@", str1, str2);
            break;
        case NSOrderedSame:
            NSLog(@"%@ is same as %@", str1, str2);
        case NSOrderedDescending:
            NSLog(@"%@ is larger than %@", str1, str2);
        default:
            break;
    }
    
    NSString *str3 = @"I love you.";
    NSRange range = [str3 rangeOfString:@"love"];
    NSLog(@"Length: %lu", range.length);
    NSLog(@"Location: %lu", range.location);
    
    
    
    return 0;
}
