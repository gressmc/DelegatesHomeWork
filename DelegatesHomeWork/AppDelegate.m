//
//  AppDelegate.m
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h"
#import "Patient.h"
#import "BadDoctor.h"

@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Patient* patient1 = [Patient new];
    patient1.name = @"Vova";
    patient1.temperature = 36.6f;
    patient1.cough = NO;
    patient1.sneezing = NO;
    patient1.stomachPain = NO;
    
    Patient* patient2 = [Patient new];
    patient2.name = @"Petya";
    patient2.temperature = 37.6f;
    patient2.cough = YES;
    patient2.sneezing = YES;
    patient2.stomachPain = NO;
    patient2.head = YES;
    
    Patient* patient3 = [Patient new];
    patient3.name = @"Dima";
    patient3.temperature = 39.5f;
    patient3.cough = NO;
    patient3.sneezing = NO;
    patient3.stomachPain = YES;
    patient3.stomach = YES;
    
    Patient* patient4 = [Patient new];
    patient4.name = @"Anya";
    patient4.temperature = 37.f;
    patient4.cough = NO;
    patient4.sneezing = NO;
    patient4.stomachPain = NO;
    patient4.legs = YES;
    patient4.hands = YES;
    
    Patient* patient5 = [Patient new];
    patient5.name = @"Ira";
    patient5.temperature = 37.2f;
    patient5.cough = YES;
    patient5.sneezing = YES;
    patient5.stomachPain = NO;
    patient5.neck = YES;
    patient5.head = YES;
    
    Patient* patient6 = [Patient new];
    patient6.name = @"Alla";
    patient6.temperature = 38.f;
    patient6.cough = NO;
    patient6.sneezing = NO;
    patient6.stomachPain = YES;
    patient6.stomach = YES;
    patient6.head = YES;
    
    Patient* patient7 = [Patient new];
    patient7.name = @"Vova";
    patient7.temperature = 36.6f;
    patient7.cough = NO;
    patient7.sneezing = YES;
    patient7.stomachPain = NO;
    patient7.legs = YES;
    
    NSArray* array = @[patient1,patient2,patient3,patient4,patient5,patient6,patient7];
    
    Doctor* doctor1 = [Doctor new];
    Doctor* doctor2 = [Doctor new];
    BadDoctor* doctor3 = [BadDoctor new];
    
    doctor1.name = @"GoodDoc-1";
    doctor2.name = @"GoodDoc-2";
    doctor3.name = @"BadDoc-BadDoc";
    
    NSArray *clinic = @[doctor1,doctor2,doctor3];
    
    for (Patient* patient in array) {
        patient.delegate  = [clinic objectAtIndex: arc4random_uniform((unsigned)[clinic count])];
        
        if (patient.temperature >36.8 || [patient pain]) {
            [patient iFeelBad];
        }
    }
    
    NSDictionary* raport1 = [doctor1 raport];
    NSDictionary* raport2 = [doctor2 raport];
    
    for (NSString* key in [raport1 allKeys]){
        id obj = [raport1 objectForKey:key];
        for (id patient in obj) {
            NSLog(@"Рапорт 1-го доктора  Болит %@, У следующих: %@", key, patient);
        }
    }
    for (NSString* key in [raport2 allKeys]){
        id obj = [raport2 objectForKey:key];
        for (id patient in obj) {
             NSLog(@"Рапорт 2-го доктора  Болит %@, У следующих: %@", key, patient);
        }
    }
    
    for (Patient* patient in array) {
        patient.doctorSet = [NSMutableSet new];
        switch (patient.assess) {
            case BadDoc:
                [patient.doctorSet addObject:[NSString stringWithFormat:@"%@", patient.delegate]];
                for (Doctor* doc in clinic) {
                    if (![patient.doctorSet containsObject:[NSString stringWithFormat:@"%@", doc]]) {
                        patient.delegate = doc;
                    }
                }
                break;
            default:
                break;
        }
    }
    
    /*
     for (Patient* patient in array) {
     patient.doctorSet = [NSMutableDictionary new];
     switch (patient.assess) {
     case BadDoc:
     [patient.doctorSet setObject:@"BadDoc" forKey:[NSString stringWithFormat:@"%@", patient.delegate]];
     for (Doctor* doc in clinic) {
     if (![patient.doctorSet objectForKey:[NSString stringWithFormat:@"%@", doc]]) {
     patient.delegate = doc;
     }
     }
     break;
     default:
     break;
     }
     }
     */
    
    for (Patient* patient in array) {
        if (patient.temperature >36.8 || [patient pain]) {
            [patient iFeelBad];
        }
    }

    
    return YES;
}

@end
