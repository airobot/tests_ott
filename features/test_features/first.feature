# encoding: UTF-8
# language: ru

Функция: Тестовое задание OTT

  Сценарий: Задание 1 API Request
    И проверяем доступность следующего API "https://www.onetwotrip.com/_hotels/api/suggestRequest"
    И передаю запрос "https://www.onetwotrip.com/_hotels/api/suggestRequest" c параметром "?query=Smol&limit=7&lang=ru&locale=ru&currency=RUB"
    И в ответ я должен получить следующие поля ""
    И проверяю наличие поля в ответе ""

  Сценарий: Redirection
    Дано проверяю осуществляется ли редирект с сайта "https://onetwotrip.com/"
    Дано проверяю осуществляется ли редирект с сайта "https://www.onetwotrip.com/"
    И проверяю, что адрес редиректа с адреса "https://onetwotrip.com/" соответствует следующему адресу "https://www.onetwotrip.com/"
    И количество редиректов с адреса "https://onetwotrip.com/" равно "3"