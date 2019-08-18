# 通过 NavigationLink 离开首页后，自动隐藏 TabBar 的方法

## 思路

首先需要区分 `TabView`（后面简称 T） 和 `NavigationView`（后面简称 N） 是如何互相嵌套的，一般有两种嵌套方案：

1. 应用入口是一个 T，T 里面的每个首页都包在一个 N 里面
2. 应用入口是一个 N，N 的 rootViewController 是 T

-----
有事出去，下周再写
