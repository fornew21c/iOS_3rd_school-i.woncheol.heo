//
//  RealmData.h
//  RealmTest
//
//  Created by Woncheol on 2017. 4. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Realm/Realm.h>

@interface RealmData : RLMObject

@property NSString *name;
@property int age;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RealmData *><RealmData>
RLM_ARRAY_TYPE(RealmData)
