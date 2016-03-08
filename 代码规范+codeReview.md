###Android 开发规范：

####一. 规则

    1. 图片命名统一 ic_***.png

    2. 类命名规范：
        activity类，命名以Activity为后缀，如：LoginActivity
        fragment类，命名以Fragment为后缀，如：ShareDialogFragment
        service类，命名以Service为后缀，如：DownloadService
        adapter类，命名以Adapter为后缀，如：CouponListAdapter
        工具类，命名以Util为后缀，如：EncryptUtil
        模型类，命名以BO为后缀，如：CouponBO
        接口实现类，命名以Impl为后缀，如：ApiImpl

    3. 布局文件：依照UI功能区分
                          activity_main.xml
                           item_main.xml

    4.常量下划线区分

    5.控件缩写+控件id命名
        例如：TextView txt/控件缩写_范围_意义 txt_header_title;btn_login

#### 二. 注意事项
   
	1. Cursor 使用后及时关闭，并判断是否为空
  	2. 涉及到底层通讯录和相机等功能都需要异常处理
  	3. Dialog调用的地方，一定要在onDesotry()进行取消;Dialog显示的地方一定要判断isFinishing()
  	4. 注意数组越界的地方，必要时进行异常处理
  	5. 检查NULL
	6. WebView 清楚缓存过程中 异常处理
	
---

###CodeReview:

######目的：易读，可维护，可重用，知识共享，减少潜在的bug
######检查范围：
	1.代码结构：
		重复拷贝代码，没有进行封装
		没有准守public,private protected权限
		不恰当命名
		是否有良好的注释		

	2.业务逻辑
		是否有业务逻辑的错误或者业务逻辑不清晰，混乱
	
	3.异常检查
		NULL，Index 等异常的预处理
	
	4. 是否符合命名规范



---

