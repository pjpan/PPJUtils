# PPJUtils

this Utils is used to deal with PMML file using Java

- R 这个文件夹主要用来针对xgboost模型，利用r2pmmlpackage 转换成pmml的时候，需要使用genDMatrix的函数，但是原作者本身的代码效率不高，所以进行了改写
- Java/PMML 这个文件夹主要是开发了一个通用的Java调用PMML的Jar包，详细调用方法请查看[Readme文件](./Java/PMML/README.md)
- Utils主要包含了中国国内的城市的经纬度维表，用来进行经纬度的变换
