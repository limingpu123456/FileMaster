# 登录接口

## 生成验证码

URL

```json
GET /captcha
```

参数

```json
无
```

返回

```json
{
    "msg": "操作成功",
    "code": 200,
    "data": {
      "uuid": "b71fafb1a91b4961afb27372bd3af77c",
      "captcha": "data:image/png;base64,iVBORw0KGgoAAAA",
      "code": "nrew"
    }
}
```

## 登录

URL

```json
POST /login
```

参数

```json
{
    "captcha": "nrew",
    "password": "123456",
    "username": "admin",
    "uuid": "b71fafb1a91b4961afb27372bd3af77c"
}
```

返回

```json
{
    "msg": "登录成功",
    "code": 200,
    "data": {
      "token":   "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNjg5NjYxODUwLCJleHAiOjE2OTA5NTc4NTB9.Bq0pExJcSgaQD94qAYVSx4W__K8FWGeY7iUJKMyTIYFofZoqa2VfEvl8Na96kt2wYbjFImHmQntkdce6cHQ8_A",
      "expire": 1296000
  }
}
```

## Token校验

URL

```json
GET /checkToken
```

参数

```json
HttpServletRequest request
```

返回

```json
{
    "msg": "操作成功",
    "code": 200,
    "status": "ok"
}

{
    "msg": "操作成功",
    "code": 200,
    "status": "error"
}
```

## 修改密码

URL

```json
PUT /sys/user/updatePassword
```

参数

```json
{
    "password": "111",
    "newPassword": "111234",
    "confirmPassword": "111234"
}
```

返回

```json
{
    "msg": "操作成功",
    "code": 200,
    "status": "success"
}

{
    "msg": "操作成功",
    "code": 200,
    "status": "passwordError"
}
```

## 退出

URL

```json
POST /logout
```

参数

```json
无
```

返回

```json
{
    "msg": "操作成功",
    "code": 200
}
```

# 动态路由

URL

```1
GET /sys/user/getRouters
```

参数

```
无
```

返回

```json
{
    "msg": "操作成功",
    "code": 200,
    "data": {
		"userId": 1,
        "username": "admin", 
        "password": "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92",
        "userType": 1, 
        "realName": "管理员", 
        "contact": "", 
        "mobile": "15679711120", 
        "status": 1, 
        "roleIdList": null
	},
    "roles": "超级管理员",
    "routers": [
        {
            "name": "系统管理",
            "path": "/sys",
            "hidden": "false",
            "redirect": "noRedirect",
            "component": "Layout",
            "alwaysShow": true,
            "meta": {
                "title": "系统管理",
                "icon": "system"
            },
            "children": [
                {
                    "name": "管理员管理",
                    "path": "/user",
                    "hidden": "false",
                    "component": "sys/user/index",
                    "meta": {
                        "title": "管理员管理",
                        "icon": "user"
                    }
                }
            ]
        }
    ]
}
```

# 首页

## 数据统计柱状图

URL

```
GET /sys/inOut/chart
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "names": [
            "栖海澐颂",
            "宸悦国际",
            "流星花园二区",
            "农学院家属院",
            "金达园",
            "建发城建·文源府",
            "北清云际"
        ],
        "nums": [
            5,
            3,
            1,
            2,
            4,
            2,
            1
        ]
    }
}
```

# 物业管理

## 小区管理

### 查询小区

URL

```
GET /sys/community/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "communityId": "",
    "communityName": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 8,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "communityId": 19,
                "communityName": "北清云际",
                "termCount": 33,
                "seq": 190,
                "creater": "admin",
                "createTime": "2023-07-18 00:41:20",
                "lng": 116.298904,
                "lat": 40.091644,
                "personCnt": 1
            },
            {
                "communityId": 17,
                "communityName": "天龙苑",
                "termCount": 10,
                "seq": 170,
                "creater": "admin",
                "createTime": "2023-07-18 00:38:06",
                "lng": 116.36206,
                "lat": 40.088108,
                "personCnt": 0
            }
        ]
    }
}
```

### 搜索小区

URL

```
GET /sys/community/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "communityId": "",
    "communityName": "北清云际"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 1,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "communityId": 19,
                "communityName": "北清云际",
                "termCount": 33,
                "seq": 190,
                "creater": "admin",
                "createTime": "2023-07-18 00:41:20",
                "lng": 116.298904,
                "lat": 40.091644,
                "personCnt": 1,
                "sex": ""
            }
        ]
    }
}
```

### 添加小区

URL

```
POST /sys/community/add
```

参数

```
{
    "communityName": "test"
    "lat": "1"
    "lng": "1"
    "seq": 1
    "termCount": "1"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询小区

URL

```
GET /sys/community/info
```

参数

```
1
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityId": 19,
        "communityName": "北清云际",
        "termCount": 33,
        "seq": 190,
        "lng": 116.298904,
        "lat": 40.091644
     }
}
```

### 修改小区

URL

```
PUT /sys/community/edit
```

参数

```
{
    "communityId": 21,
    "communityName": "1",
    "termCount": "12",
    "lng": "12",
    "lat": "12",
    "seq": 210
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除小区

URL

```
DELETE /sys/community/del
```

参数

```
[
    21,
    20
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 查询摄像头

URL

```
GET /sys/camera/list
```

参数

```
19
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "cameraInfoId": 13,
            "communityId": 19,
            "cameraName": "1",
            "macID": "1",
            "direction": 1,
            "state": 1,
            "seq": 1,
            "creater": "admin",
            "createTime": "2023-07-18 15:23:33",
            "remark": "1",
            "communityName": "北清云际"
        }
    ]
}
```

### 添加摄像头

URL

```
POST /sys/camera/add
```

参数

```
{
    "cameraInfoId": 0,
    "communityId": "19",
    "cameraName": "1号摄像头",
    "macID": "127.0.0.1",
    "direction": 2,
    "seq": "2",
    "state": 1,
    "remark": "高清摄像头"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询摄像头

URL

```
GET /sys/camera/info
```

参数

```
1
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "cameraInfoId": 14,
        "communityId": 19,
        "cameraName": "1号摄像头",
        "macID": "127.0.0.1",
        "direction": 1,
        "seq": 2,
        "state": 1,
        "remark": "高清摄像头"
    }
}
```

### 修改摄像头

URL

```
PUT /sys/camera/edit
```

参数

```
{
    "cameraInfoId": 14,
    "communityId": 19,
    "cameraName": "1号摄像头",
    "macID": "127.0.0.1",
    "direction": 1,
    "seq": 2,
    "state": 1,
    "remark": "高清摄像头"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除摄像头

URL

```
DELETE /sys/camera/del
```

参数

```
[
    13,
    14
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

## 居民管理

### 查询居民

URL

```
GET /sys/person/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "userName": "",
    "communityId": "",
    "mobile": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ],
        "pageList": {
            "totalCount": 18,
            "pageSize": 10,
            "totalPage": 2,
            "currPage": 1,
            "list": [
                {
                    "personId": 91,
                    "communityId": 2,
                    "termName": "2栋",
                    "houseNo": "808",
                    "userName": "王丽",
                    "sex": "男",
                    "mobile": "15374363882",
                    "faceUrl": "http://localhost:8181/villegePic/face/0171449468.png",
                    "personType": "常住居民",
                    "state": 2,
                    "creater": "admin",
                    "createTime": "2022-04-02 15:24:25",
                    "remark": "",
                    "communityName": "栖海澐颂"
                }
            ]
        }
    }
}
```

### 搜索居民

URL

```
GET /sys/person/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "userName": "王丽",
    "communityId": 2,
    "mobile": "15374363882"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ],
        "pageList": {
            "totalCount": 18,
            "pageSize": 10,
            "totalPage": 2,
            "currPage": 1,
            "list": [
                {
                    "personId": 91,
                    "communityId": 2,
                    "termName": "2栋",
                    "houseNo": "808",
                    "userName": "王丽",
                    "sex": "男",
                    "mobile": "15374363882",
                    "faceUrl": "http://localhost:8181/villegePic/face/0171449468.png",
                    "personType": "常住居民",
                    "state": 2,
                    "creater": "admin",
                    "createTime": "2022-04-02 15:24:25",
                    "remark": "",
                    "communityName": "栖海澐颂"
                }
            ]
        }
    }
}
```

### 查询小区列表

URL

```
GET /sys/person/info
```

固定参数

```
0
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ]
    }
}
```

### 添加居民

URL

```
POST /sys/person/add
```

参数

```
{
    "personId": 0,
    "communityId": 2,
    "termName": "1",
    "houseNo": "1",
    "userName": "1",
    "mobile": "1",
    "sex": "男",
    "personType": "常住居民",
    "faceUrl": "",
    "state": 1,
    "remark": "1"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询居民

URL

```
GET /sys/person/info
```

参数

```
1
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "person": {
            "personId": 91,
            "communityId": 2,
            "termName": "2栋",
            "houseNo": "808",
            "userName": "王丽",
            "sex": "男",
            "mobile": "15374363882",
            "faceUrl": "http://localhost:8181/villegePic/face/0171449468.png",
            "personType": "常住居民",
            "state": 2,
            "creater": "admin",
            "createTime": "2022-04-02 15:24:25",
            "remark": "",
            "faceBase": "iVBORw0KGgoAAAANSUhEUgAAAJsAAAC4CAYAAAD0WZ4UAAAAAXNSR0IArs4c"
        },
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ]
    }
}
```

### 修改居民

URL

```
PUT /sys/person/edit
```

参数

```
{
    "personId": 198,
    "communityId": 2,
    "termName": "12",
    "houseNo": "12",
    "userName": "12",
    "mobile": "12",
    "sex": "男",
    "personType": "常住居民",
    "faceUrl": "",
    "state": 1,
    "remark": "1"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 人脸采集

URL

```
POST /sys/person/addPerson
```

参数

```
{
    "personId": 98,
    "extName": "png",
    "fileBase64": "iVBORw0KGgoAAAANSUhEUgAAAJsAAAC4CAYAAAD0WZ4UAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJ8pt02jBn6wUmcy/39/xgi2nSFeQGzAAAAAElFTkSuQmCC"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除居民

URL

```
DELETE /sys/person/del
```

参数

```
[
    197,
    198
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### Excel导出

URL

```ASN.1
GET /sys/person/exportExcel
```

参数

```
{
    "page": 1,
    "limit": 10,
    "userName": "",
    "communityId": "",
    "mobile": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": "20230719185659.xls"
}
```

### Excel上传

URL

```
POST /sys/person/excelUpload
```

参数

```
MultipartFile对象
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": "16a7743e-0964-40b6-8595-f4f9d5667dde.xls"
}
```

### 数据导入

URL

```
POST /sys/person/parsefile
```

参数

```
"16a7743e-0964-40b6-8595-f4f9d5667dde.xls"
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": "数据导入成功！",
    "status": "success"
}

{
    "msg": "操作成功",
    "code": 200,
    "data": "第3行小区名称不存在！",
    "status": "fail"
}
```

## 小区地图

### 地图数据

URL

```
GET /sys/community/getCommunityMap
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "communityId": 2,
            "communityName": "栖海澐颂",
            "termCount": 0,
            "seq": 0,
            "creater": "",
            "createTime": "",
            "lng": 116.2524,
            "lat": 40.0961,
        }
    ]
}
```

# 门禁管理

## 人脸识别

### 加载小区数据

URL

```
GET /sys/inOut/communityList
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "communityId": 2,
            "communityName": "栖海澐颂",
            "termCount": 200,
            "seq": 20,
            "creater": "admin",
            "createrTime": "2021-01-19 11:00:02",
            "lng": 116.2524,
            "lat": 40.0961,
        }
    ]
}
```

### 图像识别

URL

```
POST /sys/inOut/add
```

参数

```
{
    "communityId": 2,
    "extName": "png",
    "fileBase64": "iVBORw0KGgoAAAANSUhEUgAAAoAAAAHgCAYAAAA10dzkAAAAAXNSR0IArs4c6QAAIABJREFUeF7sXe2OHblu3BljTX1lQUgyxEvv9HMQ5yIZq239/8B8gtdpbgl/6cAAAAASUVORK5CYII="
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": "张三进入小区",
    "status": "success"
}

{
    "msg": "操作成功",
    "code": 200,
    "data": "人员信息不存在",
    "status": "fail"
}
```

## 出入记录

### 出入记录查询

URL

```
GET /sys/inOut/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "userName": "",
    "startDate": "",
    "endDate": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "pageList": {
            "totalCount": 1,
            "pageSize": 10,
            "totalPage": 1,
            "currPage": 1,
            "list": [
                {
                    "inOutRecordId": 44,
                    "inTime": "2023-07-19 16:51:55",
                    "outTime": "2023-07-19 16:52:07",
                    "inPic": "http://localhost:8181/villegePic/face/47b49187-a5e9-486a-b8ac-4409710b3323.png",
                    "outPic": "http://localhost:8181/villegePic/face/4cbfb2b9-a691-4d0a-a4d4-4bf602cb33ac.png",
                    "communityName": "栖海澐颂",
                    "termName": "8栋",
                    "houseNo": "802",
                    "userName": "丽丽"
                }
            ]
        }
    }
}
```

### 出入记录搜索

URL

```
GET /sys/inOut/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "userName": "张三",
    "startDate": "2023-07-20 12:59:54",
    "endDate": "2023-07-20 23:00:00"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "pageList": {
            "totalCount": 1,
            "pageSize": 10,
            "totalPage": 1,
            "currPage": 1,
            "list": [
                {
                    "inOutRecordId": 44,
                    "inTime": "2023-07-19 16:51:55",
                    "outTime": "2023-07-19 16:52:07",
                    "inPic": "http://localhost:8181/villegePic/face/47b49187-a5e9-486a-b8ac-4409710b3323.png",
                    "outPic": "http://localhost:8181/villegePic/face/4cbfb2b9-a691-4d0a-a4d4-4bf602cb33ac.png",
                    "communityName": "栖海澐颂",
                    "termName": "8栋",
                    "houseNo": "802",
                    "userName": "丽丽"
                }
            ]
        }
    }
}
```

## 访客登记

### 访客记录查询

URL

```
GET /sys/manual/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "communityId": "",
    "mobile": "",
    "visitor": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createrTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ],
        "pageList": {
            "totalCount": 3,
            "pageSize": 10,
            "totalPage": 1,
            "currPage": 1,
            "list": [
                {
                    "manualRecordId": 4,
                    "visitor": "王大宝",
                    "mobile": "13978654321",
                    "cardNo": "",
                    "termName": "",
                    "houseNo": "",
                    "interviewee": "丽丽",
                    "remark": "",
                    "inTime": "2022-04-12 09:50:57",
                    "outTime": "",
                    "userName": "lgr",
                    "signTime": "2022-04-12 09:51:07",
                    "communityName": "栖海澐颂"
                }
            ]
        }
    }
}
```

### 访客记录搜索

URL

```
GET /sys/manual/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "communityId": 1,
    "mobile": "13978654321",
    "visitor": "王大宝"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createrTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ],
        "pageList": {
            "totalCount": 1,
            "pageSize": 10,
            "totalPage": 1,
            "currPage": 1,
            "list": [
                {
                    "manualRecordId": 4,
                    "visitor": "王大宝",
                    "mobile": "13978654321",
                    "cardNo": "",
                    "termName": "",
                    "houseNo": "",
                    "interviewee": "丽丽",
                    "remark": "",
                    "inTime": "2022-04-12 09:50:57",
                    "outTime": "",
                    "userName": "lgr",
                    "signTime": "2022-04-12 09:51:07",
                    "communityName": "栖海澐颂"
                }
            ]
        }
    }
}
```

### 查询小区列表

URL

```
GET /sys/manual/info
```

固定参数

```
0
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ]
    }
}
```

### 添加访客记录

URL

```
POST /sys/manual/add
```

参数

```
{
    "manualRecordId": "",
    "communityId": 2,
    "visitor": "张三",
    "cardNo": "301123456789",
    "mobile": "13312345678",
    "termName": "11",
    "houseNo": "123",
    "interviewee": "李四",
    "inTime": "2023-07-20 13:45:01",
    "outTime": "2023-07-20 13:45:14",
    "userName": "",
    "signTime": "",
    "remark": "访友"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询访客记录

URL

```
GET /sys/manual/info
```

参数

```
1
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "communityList": [
            {
                "communityId": 2,
                "communityName": "栖海澐颂",
                "termCount": 200,
                "seq": 20,
                "creater": "admin",
                "createrTime": "2021-01-19 11:00:02",
                "lng": 116.2524,
                "lat": 40.0961
            }
        ],
        "manualInfo": {
            "manualRecordId": 7,
            "communityId": 2,
            "visitor": "张三",
            "mobile": "13312345678",
            "cardNo": "301123456789",
            "termName": "11",
            "houseNo": "123",
            "interviewee": "李四",
            "remark": "访友",
            "inTime": "2023-07-20 13:45:01",
            "outTime": "2023-07-20 13:45:14",
            "userName": "admin",
            "signTime": "2023-07-20 13:45:23"
        }
    }
}
```

### 修改访客记录

URL

```
PUT /sys/manual/edit
```

参数

```
{
    "manualRecordId": 7,
    "communityId": 2,
    "visitor": "张三",
    "cardNo": "301123456789",
    "mobile": "13312345678",
    "termName": "11",
    "houseNo": "222",
    "interviewee": "李四",
    "inTime": "2023-07-20 13:45:01",
    "outTime": "2023-07-20 13:45:14",
    "userName": "admin",
    "signTime": "2023-07-20 13:45:23",
    "remark": "访友"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除访客记录

URL

```
DELETE /sys/manual/del
```

参数

```
[
    197,
    198
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

# 系统管理

## 用户管理

### 用户查询

URL

```
GET /sys/user/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "username": "",
    "realName": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 3,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "userId": 24,
                "username": "test",
                "realName": "张三",
                "contact": "",
                "mobile": "",
                "status": 1,
                "roleName": '超级管理员'
            }
        ]
    }
}
```

### 用户搜索

URL

```
GET /sys/user/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "username": "te",
    "realName": "三"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 1,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "userId": 24,
                "username": "test",
                "realName": "张三",
                "contact": "",
                "mobile": "",
                "status": 1,
                "roleName": '超级管理员'
            }
        ]
    }
}
```

### 查询角色列表

URL

```
GET /sys/role/getRoleList
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "roleId": 1,
            "roleName": "超级管理员",
            "type": 1,
            "remark": "具有所有权限的操作",
            "createTime": "2017-11-21 11:42:11"
        }
    ]
}
```

### 添加用户

URL

```
POST /sys/manual/add
```

参数

```
{
	"userId": "",
    "username": "111",
    "password": "111",
    "realName": "111",
    "mobile": "11",
    "status": 1,
    "roleId": 1,
    "contact": "11"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询用户

URL

```
GET /sys/user/info
```

参数

```
25
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "userId": 25,
        "username": "111",
        "password": "f6e0a1e2ac41945a9aa7ff8a8aaa0cebc12a3bcc981a929ad5cf810a090e11ae",
        "realName": "111",
        "contact": "11",
        "mobile": "11",
        "status": 1,
        "roleId": 1
    }
}
```

### 修改用户

URL

```
PUT /sys/user/edit
```

参数

```
{
    "userId": 25,
    "username": "111",
    "password": "11",
    "realName": "111",
    "mobile": "11",
    "status": 1,
    "roleId": 1,
    "contact": "11"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除用户

URL

```
DELETE /sys/user/del
```

参数

```
[
    24,
    25
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

## 角色管理

### 角色查询

URL

```
GET /sys/role/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "roleName": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 2,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "roleId": 7,
                "roleName": "普通角色",
                "type": 2,
                "remark": "普通角色",
                "createTime": "2020-12-01 19:15:29"
            }
        ]
    }
}
```

### 角色搜索

URL

```
GET /sys/role/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "roleName": "普通"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 2,
        "pageSize": 10,
        "totalPage": 1,
        "currPage": 1,
        "list": [
            {
                "roleId": 7,
                "roleName": "普通角色",
                "type": 2,
                "remark": "普通角色",
                "createTime": "2020-12-01 19:15:29"
            }
        ]
    }
}
```

### 查询菜单列表

URL

```
GET /sys/menu/list
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "id": 1094,
            "parentId": 0,
            "children": [
                {
                    "id": 1037,
                    "parentId": 1094,
                    "children": "",
                    "name": "小区管理",
                    "path": "community",
                    "menuType": 2,
                    "status": 0,
                    "icon": "table",
                    "sort": 1,
                    "hidden": "false"
                }
            ],
            "name": "物业管理",
            "path": "community",
            "menuType": 1,
            "status": 0,
            "icon": "tab",
            "sort": 4,
            "hidden": "false"
        }
    ]
}
```

### 添加角色

URL

```
POST /sys/role/add
```

参数

```
{
    "roleName": "33",
    "type": 1,
    "remark": "33",
    "menuIdList": [
        1121
    ]
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询角色

URL

```
GET /sys/role/info
```

参数

```
25
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "roleId": 11,
        "roleName": "33",
        "type": 1,
        "remark": "33",
        "createTime": "2023-07-20 19:24:21",
        "menuIdList": [
            1121
        ]
    }
}
```

### 修改角色

URL

```
PUT /sys/role/edit
```

参数

```
{
    "roleId": 14,
    "roleName": "测试",
    "type": 2,
    "remark": "11",
    "menuIdList": [
        102,
        1012,
        1011,
        1009,
        1010,
        1
    ]
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除角色

URL

```
DELETE /sys/role/del
```

参数

```
[
    13,
    14
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

## 菜单管理

### 菜单查询

URL

```
GET /sys/menu/list
```

参数

```
无
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "id": 1094,
            "parentId": 0,
            "children": [
                {
                    "id": 1037,
                    "parentId": 1094,
                    "children": [],
                    "name": "小区管理",
                    "path": "community",
                    "menuType": 2,
                    "status": 0,
                    "icon": "table",
                    "sort": 1,
                    "hidden": "false"
                }
            ],
            "name": "物业管理",
            "path": "community",
            "menuType": 1,
            "status": 0,
            "icon": "tab",
            "sort": 4,
            "hidden": "false"
        }
    ]
}
```

### 添加菜单

URL

```
POST /sys/menu/add
```

参数

```
{
    "name": "test",
    "parentId": 0,
    "component": "",
    "icon": "",
    "path": "",
    "sort": 10,
    "status": 0,
    "menuType": 1,
    "hidden": "false"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 通过ID查询菜单

URL

```
GET /sys/menu/info
```

参数

```
1123
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "id": 1126,
        "parentId": 0,
        "name": "222",
        "path": "",
        "menuType": 1,
        "icon": "",
        "status": 0,
        "sort": 10,
        "hidden": "false",
        "component": ""
    }
}
```

### 修改菜单

URL

```
PUT /sys/menu/edit
```

参数

```
{
    "id": 1126,
    "name": "333",
    "parentId": 1094,
    "component": "123",
    "icon": "user",
    "path": "333",
    "sort": 10,
    "status": 0,
    "menuType": 1,
    "hidden": "false"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

### 删除菜单

URL

```
DELETE /sys/menu/del
```

参数

```
1123
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```

## 日志管理

### 日志查询

URL

```
GET /sys/log/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "username": "",
    "startDate": "",
    "endDate": ""
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 198,
        "pageSize": 10,
        "totalPage": 20,
        "currPage": 1,
        "list": [
            {
                "id": 198,
                "username": "admin",
                "operation": "删除菜单",
                "method": "com.villege.modules.controller.sys.SysMenuController.del()",
                "params": "[1121]",
                "time": 7,
                "ip": "127.0.0.1",
                "createTime": "2023-07-20 21:10:49"
            }
        ]
    }
}
```

### 日志搜索

URL

```
GET /sys/log/list
```

参数

```
{
    "page": 1,
    "limit": 10,
    "username": "adm",
    "startDate": "2023-07-13 21:45:07",
    "endDate": "2023-07-20 21:45:07",
    "operation": "添加"
}
```

返回

```
{
    "msg": "操作成功",
    "code": 200,
    "data": {
        "totalCount": 198,
        "pageSize": 10,
        "totalPage": 20,
        "currPage": 1,
        "list": [
            {
                "id": 194,
                "username": "admin",
                "operation": "添加菜单",
                "method": "com.villege.modules.controller.sys.SysMenuController.add()",
                "params": "{\"id\":1126,\"parentId\":0,\"name\":\"222\",\"path\":\"\",\"menuType\":1,\"icon\":\"\",\"status\":0,\"sort\":10,\"hidden\":\"false\",\"component\":\"\"}",
                "time": 8,
                "ip": "127.0.0.1",
                "createTime": "2023-07-20 21:04:03"
            }
        ]
    }
}
```

### 删除日志

URL

```
DELETE /sys/log/del
```

参数

```
[
    198,
    197
]
```

返回

```
{
    "msg": "操作成功",
    "code": 200
}
```





