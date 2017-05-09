//
//  ViewController.m
//  13.4.3 自定义对象归档、解档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)writeToArchive:(id)sender {
    NSDictionary *dict = @{@"name":self.nameTextField.text,
                           @"age":self.ageTextField.text};
    
    Person *person = [Person personWithDict:dict];
    
    if([ArchiveService writeObjectToArchiveFile:person]){
        NSLog(@"归档成功");
    };
}

- (IBAction)readFromArchiive:(id)sender {
    Person *person = [ArchiveService readObjectFromArchiveFile];
    NSLog(@"person name: %@, person age:%@", person.name,person.age);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
