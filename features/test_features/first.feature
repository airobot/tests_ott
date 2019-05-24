# encoding: UTF-8
# language: ru

Функция: Тестовое задание OTT

  Структура сценария: Задание 1 API Request
    И проверяем доступность следующего API "https://www.onetwotrip.com/_hotels/api/suggestRequest"
    И передаю запрос "https://www.onetwotrip.com/_hotels/api/suggestRequest?query=" c параметром "<параметр>"
    И в поле "<поле>" я должен увидеть значение "<ответ>"

    Примеры:
    |параметр|поле      |ответ   |
    |Смоленск|id        |491687  |
    |Смоленск|type      |geo     |
    |Смол    |name_ascii|Smolensk|
    |Smol    |id        |491687  |
    |Smolensk|type      |geo     |
    |Smolensk|name_ascii|Smolensk|

  Структура сценария: API Request

    И передаю запрос "https://www.onetwotrip.com/_hotels/api/suggestRequest?query=" c параметром "<параметр>"
    И проверяю наличие значения "<параметр>" в полях "<поле>" в ответе для типа "<тип>"

    Примеры:
      |параметр        |поле      |тип    |
      |KvartiraSvobodna|name_ascii|hotel  |
      |Горнолыжный     |name      |tourism|
      |apartament      |name      |hotel  |

  Сценарий: Redirection
    Дано проверяю осуществляется ли редирект с сайта "https://onetwotrip.com/"
    Дано проверяю осуществляется ли редирект с сайта "https://www.onetwotrip.com/"
    И проверяю, что адрес редиректа с адреса "https://onetwotrip.com/" соответствует следующему адресу "https://www.onetwotrip.com/"
    И количество редиректов с адреса "https://onetwotrip.com/" равно "3"
#    Дано проверяю осуществляется ли редирект с сайта "https://www.onetwotrip.com/ru/"