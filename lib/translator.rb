# require modules here

def load_library(file_path)
  require "yaml"
  emoticons = YAML.load_file(file_path)
  hash = {}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  emoticons.each do |k,v|
    hash["get_meaning"][emoticons[k][1]] = k
    hash["get_emoticon"][emoticons[k][0]] = emoticons[k][1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  hash["get_emoticon"][emoticon] ? hash["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  hash["get_meaning"][emoticon] ? hash["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end