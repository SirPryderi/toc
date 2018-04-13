#!/usr/bin/ruby

filename, options = ARGV

if filename == nil or filename.empty?
  filename = 'README.md'
end

File.open(filename, 'r') do |f|
  f.each_line do |line|
    forbidden_words = ['Table of Contents', 'toc', 'TOC', 'define', 'pragma']
    next if !line.start_with?('#') || forbidden_words.any? {|w| line =~ /#{w}/}

    title = line.gsub('#', '').strip
    href = title.gsub(/[^a-zA-Z\-\d\s]/, '').gsub(' ', '-').downcase
    puts '  ' * (line.count('#')-1) + "* [#{title}](\##{href})"
  end
end
