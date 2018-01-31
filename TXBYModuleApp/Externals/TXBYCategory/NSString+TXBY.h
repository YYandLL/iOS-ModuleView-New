//
//  NSString+TXBY.h
//  TXBYCategory
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 tianxiabuyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TXBY)

#pragma mark - Hash
/**
 *  返回一个md5 hash的NSString
 */
- (NSString *)md5String;

#pragma mark - Encode and Decode
/**
 *  返回一个base64编码的NSString
 */
- (NSString *)base64EncodedString;

/**
 *  返回一个使用base64解码的NSString
 *  @param base64EncodedString 要解码的NSString
 */
+ (NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 *  返回编码后的URL
 */
- (NSString *)stringByURLEncode;

/**
 *  返回解码后的URL
 */
- (NSString *)stringByURLDecode;
/**
 *  unicode码转字符串
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

/**
 *  返回转义后的HTML内容
 *  如：<br>  &lt;br&gt;
 */
- (NSString *)stringByEscapingHTML;

#pragma mark - Encrypt and Decrypt
/**
 *  返回使用默认的key加密后的NSString
 */
- (NSString *)encrypt;

/**
 *  返回使用指定的key加密后的NSString
 *  @param key 指定的key
 */
- (NSString *)encryptWithKey:(NSString *)key;

/**
 *  返回使用默认的key解密后的NSString
 */
- (NSString *)decrypt;

/**
 *  返回使用指定的key解密后的NSString
 *  @param key 指定的key
 */
- (NSString *)decryptWithKey:(NSString *)key;

#pragma mark - Others
/**
 *  返回一个使用UTF-8编码的NSData
 */
- (NSData *)dataValue;

/**
 *  返回去除空格后的NSString
 */
- (NSString *)trim;

/**
 *  判断改字符串中是否包含传入的string
 *  iOS8已经实现此方法
 */
- (BOOL)containsString:(NSString *)string;

/**
 *  根据文字字体和最大尺寸计算文字宽高
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)size;
/**
 *  根据文字字体和最大尺寸计算文字宽高
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 *  根据文字字体计算文字宽高
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *  多少分钟前
 */
- (NSString *)minutesAgo;

#pragma mark - 验证与判断

/**
 *  用户名验证
 */
- (NSString *)validateUserName;

/**
 *  判断字符串中是否有中文
 */
- (BOOL)hasChinese;

/**
 *  判断字符串是否为中文
 */
- (BOOL)isChineseString;

/**
 *  判断字符串是否为中文
 */
- (BOOL)validateEnglish;

/**
 *  手机号码验证
 */
- (BOOL)validateMobile;
/**
 *  年龄验证
 */
- (BOOL)validateAge;
/**
 *  护照验证
 */
- (BOOL)validatePassport;

/**
 *  身份证号验证
 */
- (BOOL)validateIdentityCard;

/**
 *  是否纯数字
 */
- (BOOL)validateNumber;

/**
 *  根据身份证号判断男女，男为@“0” 女为@“1”
 */
- (NSString *)sexAccordingToIdCard;

/**
 *  根据身份证号返回出生年月日
 */
- (NSString *)birthdayAccordingToIdCard;

#pragma mark - 城市名称区号
/**
 *  根据区号返回城市名称
 */
- (NSString *)cityName;

/**
 *  根据省份和城市(如@“江苏 苏州”)返回区号
 */
- (NSString *)cityCode;

#pragma mark - path
/**
 *  plist文件在mainBundle中的路径
 */
+ (NSString *)pathForResource:(NSString *)resource;
/**
 *  根据bundle名称获取路径,如果为nil返回mainBundle
 */
+ (NSString *)bundlePathWithName:(NSString *)name;

/**
 *  mainBundle名路径,
 */
+ (NSString *)mainBundlePath;
/**
 *  字符串转字典
 */
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

/**
 *    @brief    截取指定小数位的值
 *
 *    @param     price     目标数据
 *    @param     position     有效小数位
 *
 *    @return    截取后数据
 */
+ (NSString *)notRounding:(float)number afterPoint:(NSInteger)position;

@end