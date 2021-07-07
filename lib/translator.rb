# require modules here
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)

  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

    emoticons.each do |k, v|
      emoticon_hash["get_emoticon"][v[0]] = emoticons[k][1]
      emoticon_hash["get_meaning"][v[1]] = k
    end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  result = load_library(path)["get_emoticon"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
    result = load_library(path)["get_meaning"][emoticon]
    result ? result : "Sorry, that emoticon was not found"
end
