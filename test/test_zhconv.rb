# encoding: utf-8

require 'test/unit'
require "zhconv"

class TestZhConv < Test::Unit::TestCase
  def test_conv_trad    
    assert_equal "歷史",    ZhConv.convert("zh-hant", "历史", false)
    assert_equal "麵包",    ZhConv.convert("zh-hant", "面包", false)
    assert_equal "獅子山",    ZhConv.convert("zh-hant", "狮子山", false)
    assert_equal "五隻",    ZhConv.convert("zh-hant", "五只", false)
    
    text_zh_tw = "蜻蜓，是一種屬於蜻蛉目的昆蟲，於春天到秋天時發生，有細長翅膀與腹部。"
    text_zh_cn = "蜻蜓，是一种属于蜻蛉目的昆虫，于春天到秋天时发生，有细长翅膀与腹部。"
    assert_equal text_zh_tw, ZhConv.convert("zh-hant", text_zh_cn, false)
  end

  def test_conv_trad_web
    assert_equal "五隻",    ZhConv.convert("zh-hant", "五只")
  end

  def test_conv_hk
    assert_equal "歷史",    ZhConv.convert("zh-hk", "历史", false)
    assert_equal "麵包",    ZhConv.convert("zh-hk", "面包", false)
    assert_equal "獅子山",    ZhConv.convert("zh-hk", "狮子山", false)
    assert_equal "羅納爾多",    ZhConv.convert("zh-hk", "罗纳尔多", false)
  end
  
  def test_conv_hk_web
    assert_equal "朗拿度",    ZhConv.convert("zh-hk", "罗纳尔多")
  end

  def test_conv_simp
    assert_equal "历史",    ZhConv.convert("zh-hans", "曆史", false)
    assert_equal "面包",    ZhConv.convert("zh-hans", "麵包", false)
    assert_equal "远程控制",    ZhConv.convert("zh-hans", "遠程控制", false)

    text_zh_tw = "蜻蜓，是一種屬於蜻蛉目的昆蟲，於春天到秋天時發生，有細長翅膀與腹部。"
    text_zh_cn = "蜻蜓，是一种属于蜻蛉目的昆虫，于春天到秋天时发生，有细长翅膀与腹部。"
    assert_equal text_zh_cn, ZhConv.convert("zh-hans", text_zh_tw, false)
  end
  
  def test_conv_simp_web
    assert_equal "远程控制",    ZhConv.convert("zh-hans", "遠程控制")
  end
  
  def test_conv_cn_web
    assert_equal "冰激凌",    ZhConv.convert("zh-cn", "冰淇淋")
  end
  
  def test_conv_sg_web
    assert_equal "健力士世界纪录",    ZhConv.convert("zh-sg", "吉尼斯世界纪录")
    assert_equal "纽西兰",    ZhConv.convert("zh-sg", "新西蘭")
  end
  
  def test_text
    text_zh_tw = "蜻蜓，是一種屬於蜻蛉目的昆蟲，於春天到秋天時發生，有細長翅膀與腹部。"
    text_zh_cn = "蜻蜓，是一种属于蜻蛉目的昆虫，于春天到秋天时发生，有细长翅膀与腹部。"
    assert_equal text_zh_cn, ZhConv.convert("zh-cn", text_zh_tw, false)
  end

end