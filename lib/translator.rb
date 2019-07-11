require 'yaml'

def load_library (file)
  emoji = YAML.load_file(file)
  new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoji.each {|key, value|
    counter=0 
    while emoji[key][counter] do
      new_hash["get_meaning"][emoji[key][counter]] = key
      counter +=1
    end 
  }
  new_hash["get_emoticon"] = {
    'O:)' => "☜(⌒▽⌒)☞",
    '>:(' => "ヽ(ｏ`皿′ｏ)ﾉ",
    ':O' => "(ΘεΘ;)",
    '%)' => "(゜.゜)",
    ':$' => "(#^.^#)",
    '><>' => ">゜))))彡",
    '8D' => "(^0_0^)",
    '=D' => "(￣ー￣)",
    ':)' => "(＾ｖ＾)",
    ":*" => "(*^3^)/~☆",
    ":'(" => "(Ｔ▽Ｔ)",
    ':o' => "o_O",
    ';)' => "(^_-)"
  }
    new_hash
end

def get_japanese_emoticon (file, emote)
  new_hash = load_library(file)
  new_hash["get_emoticon"].each {|key, value|
    #return key #new_hash["get_emoticon"]
    if key == emote
      return value
    end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning (file, emote)
    new_hash = load_library(file)
    new_hash["get_meaning"].each {|key, value|
    #return key #new_hash["get_emoticon"]
    if key == emote
      return value
    end
  }
  return "Sorry, that emoticon was not found"
end