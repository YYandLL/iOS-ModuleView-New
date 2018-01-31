//
//  TXBYKit.h
//  TXBYKit
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 tianxiabuyi. All rights reserved.
//

#import <UIKit/UIKit.h>

// 医院ID
NSString *TXBYHospital;
// app_type
NSString *TXBYApp_type;
// 医院分支
NSString *TXBYBranch;

// 导航栏高度
CGFloat const TXBYNavH = 44;
// tabbar高度
CGFloat const TXBYTabbarH = 49;
// cell之间的间距
CGFloat const TXBYCellMargin = 10;
// 接口调用成功
NSString *const TXBYSuccessCode = @"0";

// 刷新token网络标识
NSString *const TXBYRefreshTokenNetIdentifier = @"TXBYRefreshTokenNetIdentifier";
// 注销token网络标识
NSString *const TXBYRevokeTokenNetIdentifier = @"TXBYRevokeTokenNetIdentifier";
// 变更DeviceToken网络标识
NSString *const TXBYDeviceTokenNetIdentifier = @"TXBYDeviceTokenNetIdentifier";


#ifdef DEBUG

// 智能分诊症状列表
NSString *const TXBYTriageSymptomListAPI = @"http://192.168.2.11:18088/v2/smart_triage/symptom.jsp";
// 智能分诊疾病列表
NSString *const TXBYTriageIllListAPI = @"http://192.168.2.11:18088/v2/smart_triage/disease.jsp";


// 问题列表
NSString *const TXBYQuestListAPI = @"http://demoapi.eeesys.com:18088/v2/quest/quests";
// 问题详情
NSString *const TXBYQuestDetailAPI = @"http://demoapi.eeesys.com:18088/v2/quest/show";
// 提问
NSString *const TXBYQuestAddAPI = @"http://demoapi.eeesys.com:18088/v2/quest/create";
// 回复问题
NSString *const TXBYQuestReplyAPI = @"http://demoapi.eeesys.com:18088/v2/quest/reply";
// 我的问题
NSString *const TXBYMyQuestAPI = @"http://demoapi.eeesys.com:18088/v2/quest/my";


// 科室介绍列表
NSString *const TXBYDeptIntroduceListAPI = @"http://192.168.2.11:18088/v2/dept/depts";
// 科室介绍详情
NSString *const TXBYDeptIntroduceDetailAPI = @"http://192.168.2.11:18088/v2/dept/show";
// 服务价格
NSString *const TXBYServiceAPI = @"http://www.szyyjg.com/androidapi/jqm/ServiceTypeQuery.jsp";
// 服务条款
NSString *const TXBYAgreementAPI = @"http://demoapi.eeesys.com:18088/v2/agree/agreement";
// 药价公示
NSString *const TXBYDrugListAPI = @"http://www.szyyjg.com/androidapi/medic_prices.jsp";

#else

// 智能分诊症状列表
NSString *const TXBYTriageSymptomListAPI = @"http://api.eeesys.com:18088/v2/smart_triage/symptom.jsp";
// 智能分诊疾病列表
NSString *const TXBYTriageIllListAPI = @"http://api.eeesys.com:18088/v2/smart_triage/disease.jsp";


// 问题列表
NSString *const TXBYQuestListAPI = @"http://api.eeesys.com:18088/v2/quest/quests";
// 问题详情
NSString *const TXBYQuestDetailAPI = @"http://api.eeesys.com:18088/v2/quest/show";
// 提问
NSString *const TXBYQuestAddAPI = @"http://api.eeesys.com:18088/v2/quest/create";
// 回复问题
NSString *const TXBYQuestReplyAPI = @"http://api.eeesys.com:18088/v2/quest/reply";
// 我的问题
NSString *const TXBYMyQuestAPI = @"http://api.eeesys.com:18088/v2/quest/my";

// 科室介绍列表
NSString *const TXBYDeptIntroduceListAPI = @"http://api.eeesys.com:18088/v2/dept/depts";
// 科室介绍详情
NSString *const TXBYDeptIntroduceDetailAPI = @"http://api.eeesys.com:18088/v2/dept/show";
// 服务价格
NSString *const TXBYServiceAPI = @"http://www.szyyjg.com/androidapi/jqm/ServiceTypeQuery.jsp";
// 服务条款
NSString *const TXBYAgreementAPI = @"http://api.eeesys.com:18088/v2/agree/agreement";
// 药价公示
NSString *const TXBYDrugListAPI = @"http://www.szyyjg.com/androidapi/medic_prices.jsp";

#endif