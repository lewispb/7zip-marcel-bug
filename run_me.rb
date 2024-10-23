require "bundler/inline"

gemfile do
  source 'https://rubygems.org'
  gem "marcel"
end

# Linux: apt install 7zip, or p7zip-full
# Mac: brew install sevenzip

`7za a -tzip -mx0 test.zip compress_me.txt`

FileUtils.mv("test.zip", "test")
puts Marcel::MimeType.for(File.open("test"))
File.delete("test")

`7za a -tzip -mx0 test.zip sample_html`
FileUtils.mv("test.zip", "test")
puts Marcel::MimeType.for(File.open("test"))
File.delete("test")
