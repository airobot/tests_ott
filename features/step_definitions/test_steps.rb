require 'uri'
require 'net/http'

# Описание тестовых шагов
When(/^выполняю запрос$/) do
  
end

When(/^в ответ я должен получить следующие поля "([^"]*)"$/) do |arg|
  
end

When(/^проверяем доступность следующего API "([^"]*)"$/) do |uri|
  # uri = URI('http://example.com/index.html')
  res = Net::HTTP.get_response(URI.parse(uri))
  if res.code != '200'
    raise "API недоступен. Статус: #{res.code}"
  end
end

When(/^передаю запрос "([^"]*)" c параметром "([^"]*)"$/) do |arg1, arg2|

end

When(/^проверяю осуществляется ли редирект с сайта "([^"]*)"$/) do |arg|

end

When(/^получаю адрес редиректа с сайта "([^"]*)"$/) do |arg|

end

When(/^проверяю, что адрес редиректа соответствует следующему адресу "([^"]*)"$/) do |arg|

end