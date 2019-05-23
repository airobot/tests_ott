require 'rspec'

# Описание тестовых шагов
When(/^выполняю запрос$/) do
  
end

When(/^в ответ я должен получить следующие поля "([^"]*)"$/) do |arg|
  
end

When(/^проверяем доступность следующего API "([^"]*)"$/) do |uri|
  res = get_response(uri)
  if res.code != '200'
    raise "API недоступен. Статус: #{res.code}"
  end
end

When(/^передаю запрос "([^"]*)" c параметром "([^"]*)"$/) do |request, param|
  url = URI("#{request}#{param}")
  @response = get_request(url)
end

When(/^проверяю осуществляется ли редирект с сайта "([^"]*)"$/) do |url|
  request = get_response(url)
  if request['location'].nil?
    raise "Редиректа с данного адреса нет #{url}"
  else
    puts "Редирект с данного адреса #{url} есть #{request['location']}"
  end
end

When(/^получаю адрес редиректа с сайта "([^"]*)"$/) do |arg|

end

When(/^проверяю, что адрес редиректа с адреса "([^"]*)" соответствует следующему адресу "([^"]*)"$/) do | first_url, last_url|
  request = get_response(first_url)
  if request['location'] == last_url
    puts "OK"
  else
    raise "Редирект не соотвестствует адресу #{last_url}"
  end
end

When(/^проверяю наличие поля в ответе "([^"]*)"$/) do |field|
 res = parse_json(@response)
 puts res['result'].to_json
 test = parse_json(res['result'].to_json)
 puts test[0]
end

When(/^количество редиректов с адреса "([^"]*)" равно "([^"]*)"$/) do |url, redirect_count|
  count = 0
  begin
    request = get_response(url)
    url = request['location']
    count +=1
  end while request['location'] != nil
  puts count
  puts redirect_count
  expect(count).to eq redirect_count.to_i
  # if count != redirect_count.to_i
  #   raise "Количество редиректор не совпадает"
  # else
  #
  # end
end