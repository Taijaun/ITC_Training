//
//  ViewController.m
//  Obj_demo
//
//  Created by Taijaun Pitt on 16/05/2023.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelScreenName;

@property (weak, nonatomic) IBOutlet UIButton *buttonNavigation;

@property (weak, nonatomic) NSString* buttonName;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textEntry = [self saySomething:@"Hello there" name: @"Tai"];
    _buttonName = @"Navigate";
    [_buttonNavigation setTitle:_buttonName forState:UIControlStateNormal];
    _labelScreenName.text = _textEntry;
    
}

- (NSString*)saySomething:(NSString*)text name:(NSString*)name{
    NSString* entry = [NSString stringWithFormat:@"%@ %@", text, name];
    return entry;
}


- (IBAction)navigateButtonTapped:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TestViewController* testVC = [storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
    testVC.screenTitle = _textEntry;
    [self presentViewController:testVC animated:true completion:nil];
}




@end
