In Objective-C, a rare but impactful bug can arise from the misuse of `retain` and `release` in manual memory management (MRC).  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (retain) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    [myString release];
    [super dealloc];
}

- (void)setString:(NSString *)newString {
    if (myString != newString) {
        [myString release]; // Potential double release if newString is nil
        myString = [newString retain];
    }
}
@end
```

If `setString:` is called with `nil`, `[myString release]` will be called even if `myString` is already `nil`. This leads to a double release and a crash.