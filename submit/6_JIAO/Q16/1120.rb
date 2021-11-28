require 'open-uri'

  puts 'jp.teuters.comのurlを入力してください'

  url = gets.to_s

  page = open(url, &:read)

  get_title(page)
  puts ""
  
  get_content(page)
  puts ""
  
  get_time(page)

end

def get_title(page)
  title = page.scan(%r!<h1 class=".+">(.+?)<\/h1>!)
  puts "タイトル：#{title[0][0]}"
end

def get_content(page)
  title = page.scan(%r!<p class="Paragraph.+?">(.+?)<\/p>!)
  print '本文: '
  title.each { |i| puts i }
end

def get_time(page)
  title = page.scan(%r!"updated_at":"(\d{4}-\d{2}-\d{2})T!)
  puts "日時：#{title[0][0]}"
end