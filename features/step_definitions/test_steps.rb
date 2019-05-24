require 'rspec'


# Описание тестовых шагов
When(/^проверяем доступность следующего API "([^"]*)"$/) do |url|
  res = get_response(url)
  if res.code != '200'
    raise "API недоступен. Статус: #{res.code}"
  end
end

When(/^передаю запрос "([^"]*)" c параметром "([^"]*)"$/) do |request, param|
  url = URI("#{request}#{URI::encode(param)}")
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

When(/^проверяю, что адрес редиректа с адреса "([^"]*)" соответствует следующему адресу "([^"]*)"$/) do | first_url, last_url|
  request = get_response(first_url)
  if request['location'] == last_url
    puts "OK"
  else
    raise "Редирект не соотвестствует адресу #{last_url}"
  end
end

When(/^в поле "([^"]*)" я должен увидеть значение "([^"]*)"$/) do |field, text|
 text_field = json_results[0][field]
 expect(text_field) == text
end

When(/^количество редиректов с адреса "([^"]*)" равно "([^"]*)"$/) do |url, redirect_count|
  count = 0
  begin
    request = get_response(url)
    url = request['location']
    count +=1
  end while request['location'] != nil
  expect(count).to eq redirect_count.to_i
end

When(/^проверяю наличие значения "([^"]*)" в полях "([^"]*)" в ответе для типа "([^"]*)"$/) do |text, field, type|
  for i in 0..(json_results.count - 1)
    text_field = json_results[i][field]
    if json_results[i]['type'] == type
      expect(text_field.downcase).to include(text.downcase)
    end
  end
end