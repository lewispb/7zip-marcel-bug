require "bundler/inline"

gemfile do
  source 'https://rubygems.org'
  gem "marcel"
  gem "mimemagic"
end

# Linux: apt install 7zip, or p7zip-full
# Mac: brew install sevenzip

puts "Compressing a text file..."

`7za a -tzip -mx0 test.zip compress_me.txt`

FileUtils.mv("test.zip", "test")
puts "Marcel MimeType: #{Marcel::MimeType.for(File.open("test"))}"
puts "MimeMagic MimeType: #{MimeMagic.by_magic(File.open("test"))}"
File.delete("test")

puts "Compressing a directory containing a html file..."

`7za a -tzip -mx0 test.zip sample_html`

FileUtils.mv("test.zip", "test")
puts "Marcel MimeType: #{Marcel::MimeType.for(File.open("test"))}"
puts "MimeMagic MimeType: #{MimeMagic.by_magic(File.open("test"))}"
File.delete("test")
