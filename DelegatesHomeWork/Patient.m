//
//  Patient.m
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Patient.h"

@implementation Patient

-(void) takePill{
    NSLog(@"%@ Take a pill\n ",self.name);
}
-(void) makeShot{
    NSLog(@"%@ Make a shot\n ",self.name);
}
-(void) goGastroenterologist{
    NSLog(@"With pain in the stomach %@ went to the gastroenterologist.\n ",self.name);
}
-(void) iFeelBad{
    [self.delegate patientFeelsBad:self];
}
-(BOOL) medicalCertificate{
    return arc4random() % 2;
}
-(BOOL) pain{
    if (self.cough){
        return YES;
    }
    if (self.stomachPain){
        return YES;
    }
    if (self.sneezing){
        return YES;
    }
    return NO;
}
@end