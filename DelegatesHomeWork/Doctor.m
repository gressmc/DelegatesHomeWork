//
//  Doctor.m
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Doctor.h"


@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stomachCount = [NSMutableArray new];
        self.headCount = [NSMutableArray new];
        self.headCount = [NSMutableArray new];
        self.handsCount = [NSMutableArray new];
        self.legsCount = [NSMutableArray new];
        self.neckCount = [NSMutableArray new];
    }
    return self;
}

#pragma mark - PatientDelegate -

- (void) patientFeelsBad:(Patient*)patient{
    
    NSLog(@"%@ say: Patient № %@ is bad",self.name, patient.name);
    
    if (patient.stomach){
        NSLog(@"The stomach is very sore...");
        [self.stomachCount addObject:patient.name];
    }
    if (patient.head) {
        NSLog(@"The head is very sore...");
        [self.headCount addObject:patient.name];
    }
    if (patient.hands) {
        NSLog(@"The hands is very sore...");
        [self.handsCount addObject:patient.name];
    }
    if (patient.legs) {
        NSLog(@"The legs is very sore...");
        [self.legsCount addObject:patient.name];
    }
    if (patient.neck) {
        NSLog(@"The neck is very sore...");
        [self.neckCount addObject:patient.name];
    }
    
    
    if (patient.temperature>=36.9f && patient.temperature<37.7f) {
        if (patient.sneezing || patient.cough) {
            if ([patient medicalCertificate]) {
                [patient takePill];
                patient.assess=GoodDoc;
            }else{
                NSLog(@"Sorry, you do not have health insurance.\n ");
                patient.assess=BadDoc;
            }
        }
        if (patient.stomachPain){
            [patient goGastroenterologist];
            patient.assess=GoodDoc;
        }
        if (!patient.stomachPain && !patient.sneezing && !patient.cough){
            NSLog(@"Don't worry it ORVI - it will soon pass\n ");
            patient.assess = BadDoc;
        }
        
    }else if (patient.temperature>=37.7) {
        if (patient.sneezing || patient.cough) {
            if ([patient medicalCertificate]) {
                [patient makeShot];
                patient.assess=GoodDoc;
            }else{
                NSLog(@"Sorry, you do not have health insurance.");
                patient.assess=BadDoc;
            }
        }
        if (patient.stomachPain){
            NSLog(@"We'll send you in the ambulance to the gastroenterologist.\n ");
            patient.assess=GoodDoc;
        }else{
            NSLog(@"I don't know what's wrong with you. I'll send you in the ambulance to the hospital.\n ");
            patient.assess=BadDoc;
        }
    } else {
        NSLog(@"Go home %@! You are healthy\n ",patient.name);
        patient.assess=BadDoc;
    }
    
    
}
- (void) patient:(Patient*)patient hasQuestion:(NSString*)question{
    NSLog(@"Patient %@ has a question %@",patient.name,question);
    
}

-(NSDictionary*)raport{
    NSDictionary* raport = @{@"stomach":self.stomachCount,
                             @"head":self.headCount,
                             @"hands":self.handsCount,
                             @"legs":self.legsCount,
                             @"neck":self.neckCount};
    return raport;
}

@end
