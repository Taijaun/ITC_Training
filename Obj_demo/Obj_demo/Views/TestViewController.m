//
//  TestViewController.m
//  Obj_demo
//
//  Created by Taijaun Pitt on 16/05/2023.
//

#import "TestViewController.h"
#import "ViewController.h"
#import "ArrayProtocol.h"


@interface TestViewController ()  <ArrayProtocol>

@property (weak, nonatomic) IBOutlet UILabel *labelSecondScreen;
@property (strong, nonatomic) NSArray* list;

@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _labelSecondScreen.text = _screenTitle;
    _list = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday"];
    [self printArray: _list];
    
//    for (NSString* name in _list){
//        NSLog(@"%@", name);
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)printArray:(nonnull NSArray *)list {
    for (NSString* name in self.list){
        NSLog(@"%@", name);
    }
}



@end
