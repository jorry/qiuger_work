##单元测试驱动代码的修改

问题前身:

* 安卓系统中的看到的界面都是由各种view组成的，每个view有一个ID，每个ID应该为唯一的，但是写的时候由于快速复制/粘贴可能会出现重复情况（findById），因此部分手机可能就会有问题

* 在有单元测试保护情况下的修改布局ID，

* 可能出现的问题，类型转换或者是找不到ID，空指针异常

根据要进行测试的内容来选择合适的测试代码，本案例主要测试UI相关的内容，所以选择安卓本身提供的
ActivityInstrumentationTestCase2 来进行测试

### 发现的问题
1. 存在继续关系的代码不好进行单元测试
2. 部分代码耦合性强
### 总结
* 对已测试的代码进行了重构
* 总结经验，并作记录
		
	1. 测试的Activity如果需要接收的参数 ，在setUp()里面以下的代码可以进行参数的传递
		
			Intent intent = new Intent();
	        intent.setClassName("com.iqianjin.client.activity.MainActivityGroup", "com.iqianjin.client.activity.AddBankActivity");
	        Bundle bundle =new Bundle();  
	        intent.putExtras(bundle);
	        setActivityIntent(intent);
	
	2. 测试UI部分需要在测试的函数写上注解  @UITheadTest
	   
	 		View view = this.baseRechargeActivity.getEmptyView(baseRechargeActivity);
	        LinearLayout  main = new LinearLayout(baseRechargeActivity);
	        main.addView(view);

	3. 采用ActivityInstrumentationTestCase2 测试会执行声明周期，所以在声明周期里面执行网络请求，是测试不了的。所以要进行解耦