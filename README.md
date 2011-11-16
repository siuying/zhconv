利用 MediaWiki 作中文繁簡互換，支援不同地方中文用字上的分別(大陸、香港、台灣及新加坡)。 

例子：

(簡 > 繁)

* 面包 > 麵包 (zh-tw)
* 寮国 > 老撾 (zh-hk)
* 中国人寿 > 中國人壽 (zh-hk)
* 罗纳尔多 > 朗拿度 (zh-hk)

(繁 > 簡)

* 記憶體 > 内存 (zh-cn)
* 布殊 > 布什 (zh-cn)
* 資料庫 > 数据库(zh-cn)

### 說明

這個程式的概念源自 php 的 [mediawiki-zhconverter](https://github.com/tszming/mediawiki-zhconverter) 和 mediawiki 的 ZhConversion.php，不過實作上沒有任何關系。

它使用了七個轉換表來實現中文繁簡轉換：

1. 在 MediaWiki 內置的轉換表  [ZhConversion.php](http://svn.wikimedia.org/svnroot/mediawiki/trunk/phase3/includes/ZhConversion.php) 
2. 在 [MediaWiki:Conversiontable/zh-hans](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-hans) 中定義的簡體中文轉換表
3. 在 [MediaWiki:Conversiontable/zh-hant](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-hant) 中定義的繁體中文轉換表
4. 在 [MediaWiki:Conversiontable/zh-cn](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-cn) 中定義的大陸簡體轉換表
5. 在 [MediaWiki:Conversiontable/zh-tw](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-tw) 中定義的台灣正體轉換表
6. 在 [Mediawiki:Conversiontable/zh-hk](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-hk) 中定義的港澳繁體轉換表
7. 在 [Mediawiki:Conversiontable/zh-sg](http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/zh-sg) 中定義的新馬簡體轉換表

程式預設會在 Wikipedia 上找最新的中文轉換表，你也可以關閉這個功能。

### 使用方法

1. 安裝
```
gem install zhconv
```


2. 作出轉換
```
require 'rubygems'
require 'zhconv'
ZhConv.convert("zh-tw", "面包") // 返回 "麵包"
ZhConv.convert("zh-tw", "面包", false) // 返回 "麵包"，不使用最新的 wikipedia 轉換表
```