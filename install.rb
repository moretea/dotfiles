#!/usr/bin/env ruby

exclude = [__FILE__]

path =  File.expand_path("../{*,.[^.]**}", __FILE__)
dir = File.dirname(path)
Dir[path].each do |f|
  system("cp -rf #{f} #{f.gsub(dir, "/home/maarten")}")
end
