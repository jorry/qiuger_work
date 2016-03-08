1. {} 和{{}}的区别
	
		一个是定义好的对象	
		1. <Text style = {styles.contentText}>  数据来源</Text>
		styles.contentText 是定义的样式
		一个是在{{定义对象}}
		2. <Text style = {{textDecorationLine:'underline'}}></Text>
		而{{在这里面定义样式}}

2. construcotor

3.AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

4.flex 占用屏幕中的剩余空间

5.  按键点击

<Text style = {{textDecorationLine:'underline'}}
          onPress = {() => {
              this.props.navigatoe.push({
              component:WebViewPage,title:'Gank.io',
              url:'http://gank.io' })
            }}
          >http://gank.io</Text>
6.页面切换