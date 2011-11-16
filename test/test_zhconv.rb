# encoding: utf-8

path = File.expand_path(File.dirname(__FILE__), "../lib")
$:.unshift(path) unless $:.include?(path)

require 'minitest/autorun'
require 'minitest/unit'
require "./lib/zhconv"

class TestZhConv < MiniTest::Unit::TestCase
  def test_conv_trad
    assert_equal "麵包",    ZhConv.convert("面包", "zh-tw")
    assert_equal "老撾",    ZhConv.convert("寮国", "zh-hk")
    assert_equal "中國人壽",  ZhConv.convert("中国人寿", "zh-hk")
    assert_equal "朗拿度",   ZhConv.convert("罗纳尔多", "zh-hk")
  end
  
  def test_conv_simp
    assert_equal "内存",    ZhConv.convert("記憶體", "zh-cn")
    assert_equal "布什",    ZhConv.convert("布殊", "zh-cn")
    assert_equal "数据库",   ZhConv.convert("資料庫", "zh-cn")
  end

end