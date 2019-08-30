# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  emotes = {:get_meaning => {}, :get_emoticon => {}}
  yaml_file = YAML.load_file(file)
      
  # the keys are the meanings and the values are their emoticon arrays
  yaml_file.each do |emote_meaning, emote_array| 
    # the keys inside the 'get_meaning' hash are the Japanese emoticons
    # the emoticon keys inside the 'get_meaning' hash point to their meanings
    emotes[:get_meaning][emote_array[1]] = emote_meaning
    
    #the keys inside the 'get_emoticon' hash are the English emoticons
    #the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents
    emotes[:get_emoticon][emote_array[0]] = emote_array[1]
  end
  return emotes
end

def get_japanese_emoticon(file, given_emote)
  emotes = load_library(file)
  emotes[:get_emoticon].each do |eng_emote, jap_emote|
    if given_emote == eng_emote
      return jap_emote
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, given_emote)
  emotes = load_library(file)
  emotes[:get_meaning].each do |jap_emote, meaning|
    if given_emote == jap_emote
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end