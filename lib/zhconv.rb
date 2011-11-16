# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__))
$:.unshift(path) unless $:.include?(path)

require 'open-uri'

module ZhConv
  @converters = {}
  VARIANTS  = ["zh-hans", "zh-hant", "zh-cn", "zh-sg", "zh-tw", "zh-hk"]

  class Converter
    def initialize(url)
      @mapping = {}    
      table = open(url).read
      table.lines do |line|
        matches = line.match(/^[\*\"]([^\"=]+)\"?\s*=>\s*\"?([^\s\/\"]+)\s?.*\"?[;,]$/)
        if matches
          @mapping[matches[1].strip] = matches[2].strip
        end
      end
    end
    
    def convert(input)
      @mapping.each_key do |key|
        input.gsub!(key, @mapping[key])
      end
      input
    end
  end

  def self.convert(variant, message, use_web=true)    
    if use_web
      case variant
      when "zh-cn", "zh-sg"
        converter = web_converter(variant)
        message = converter.convert(message)
      when "zh-tw", "zh-hk"
        converter = web_converter(variant)
        message = converter.convert(message)
      end
    end
    
    case variant
    when "zh-cn", "zh-sg"
      converter = local_converter(variant)
      message = converter.convert(message)
    when "zh-tw", "zh-hk"
      converter = local_converter(variant)
      message = converter.convert(message)
    end
    
    if use_web  
      case variant
      when "zh-hans", "zh-cn", "zh-sg"
        converter = web_converter("zh-hans")
        message = converter.convert(message)
      when "zh-hant", "zh-tw", "zh-hk"
        converter = web_converter("zh-hant")
        message = converter.convert(message)
      end
    end
    
    case variant
    when "zh-hans", "zh-cn", "zh-sg"
      converter = local_converter("zh-hans")
      message = converter.convert(message)
    when "zh-hant", "zh-tw", "zh-hk"
      converter = local_converter("zh-hant")
      message = converter.convert(message)
    end

    message
  end

  def self.local_converter(variant)
    raise "variant #{variant} not supported" unless VARIANTS.index(variant)
    url = converter_url(variant, false)   
    @converters[url] ||= Converter.new(url)
  end

  def self.web_converter(variant)
    raise "variant #{variant} not supported" unless VARIANTS.index(variant)
    url = converter_url(variant, true)    
    @converters[url] ||= Converter.new(url)
  end
  
  def self.converter_url(variant, web_converter=false)
    if web_converter
      "http://zh.wikipedia.org/w/index.php?title=MediaWiki:Conversiontable/#{variant}&action=raw&templates=expand"
    else
      File.expand_path(File.dirname(__FILE__)) + "/../data/#{variant}.txt"
    end
  end
  
end