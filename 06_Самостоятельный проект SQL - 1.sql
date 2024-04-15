-- Самостоятельный проект курса "Базовый SQL" по работе с базой данных, которая хранит информацию о венчурных фондах и инвестициях в компании-стартапы.

-- Таблица acquisition (информация о покупках одних компаний другими):
-- первичный ключ id — идентификатор или уникальный номер покупки;
-- внешний ключ acquiring_company_id — ссылается на таблицу company — идентификатор компании-покупателя, то есть той, что покупает другую компанию;
-- внешний ключ acquired_company_id — ссылается на таблицу company — идентификатор компании, которую покупают;
-- term_code — способ оплаты сделки: 
-- cash — наличными;
-- stock — акциями компании;
-- cash_and_stock — смешанный тип оплаты: наличные и акции.
-- price_amount — сумма покупки в долларах;
-- acquired_at — дата совершения сделки;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.

-- Таблица company содержит информацию о компаниях-стартапах:
-- первичный ключ id — идентификатор, или уникальный номер компании;
-- name — название компании;
-- category_code — категория деятельности компании, например: 
-- news — специализируется на работе с новостями;
-- social — специализируется на социальной работе.
-- status — статус компании: 
-- acquired — приобретена;
-- operating — действует;
-- ipo — вышла на IPO;
-- closed — перестала существовать.
-- founded_at — дата основания компании;
--closed_at — дата закрытия компании, которую указывают в том случае, если компании больше не существует;
-- domain — домен сайта компании;
-- network_username — профиль фонда в корпоративной сети биржи;
-- country_code — код страны, например, USA для США, GBR для Великобритании;
-- investment_rounds — число раундов, в которых компания участвовала как инвестор;
-- funding_rounds — число раундов, в которых компания привлекала инвестиции;
-- funding_total — сумма привлечённых инвестиций в долларах;
-- milestones — количество важных этапов в истории компании;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.

-- Таблица education хранит информацию об уровне образования сотрудников компаний:
-- первичный ключ id — уникальный номер записи с информацией об образовании;
-- внешний ключ person_id — ссылается на таблицу people — идентификатор человека, информация о котором представлена в записи;
-- degree_type — учебная степень, например: 
-- BA — Bachelor of Arts — бакалавр гуманитарных наук;
-- MS — Master of Science — магистр естественных наук.
-- instituition — учебное заведение, название университета;
-- graduated_at — дата завершения обучения, выпуска;
-- created_at — дата и время создания записи в таблице;
--updated_at — дата и время обновления записи в таблице.

-- Таблица fund хранит информацию о венчурных фондах:
-- первичный ключ id — уникальный номер венчурного фонда;
-- name — название венчурного фонда;
-- founded_at — дата основания фонда;
-- domain — домен сайта фонда;
-- network_username — профиль фонда в корпоративной сети биржи;
-- country_code — код страны фонда;
-- investment_rounds — число инвестиционных раундов, в которых фонд принимал участие;
-- invested_companies — число компаний, в которые инвестировал фонд;
-- milestones — количество важных этапов в истории фонда;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.

-- Таблица funding_round содержит информацию о раундах инвестиций:
-- первичный ключ id — уникальный номер инвестиционного раунда;
-- внешний ключ company_id — ссылается на таблицу company — уникальный номер компании, участвовавшей в инвестиционном раунде;
-- funded_at — дата проведения раунда;
-- funding_round_type — тип инвестиционного раунда, например: 
-- venture — венчурный раунд;
-- angel — ангельский раунд;
-- series_a — раунд А;
-- raised_amount — сумма инвестиций, которую привлекла компания в этом раунде в долларах;
-- pre_money_valuation — предварительная, проведённая до инвестиций оценка стоимости компании в долларах;
-- participants — количество участников инвестиционного раунда;
-- is_first_round — является ли этот раунд первым для компании;
-- is_last_round — является ли этот раунд последним для компании;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.

-- Таблица investment содержит информацию об инвестициях венчурных фондов в компании-стартапы:
-- первичный ключ id — уникальный номер инвестиции;
-- внешний ключ funding_round_id — ссылается на таблицу funding_round — уникальный номер раунда инвестиции;
-- внешний ключ company_id — ссылается на таблицу company — уникальный номер компании-стартапа, в которую инвестируют;
-- внешний ключ fund_id — ссылается на таблицу fund — уникальный номер фонда, инвестирующего в компанию-стартап;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.

-- Таблица people содержит информацию о сотрудниках компаний-стартапов:
-- первичный ключ id — уникальный номер сотрудника;
-- first_name — имя сотрудника;
-- last_name — фамилия сотрудника;
-- внешний ключ company_id — ссылается на таблицу company — уникальный номер компании-стартапа;
-- network_username — профиль фонда в корпоративной сети биржи;
-- created_at — дата и время создания записи в таблице;
-- updated_at — дата и время обновления записи в таблице.


-- Задача 1. Отобразите все записи из таблицы company по компаниям, которые закрылись. Закрытые компании имеют статус 'closed'.
SELECT *
FROM company
WHERE status = 'closed';

-- Задача 2. Отобразите количество привлечённых средств для новостных компаний США. Используйте данные из таблицы company. Отсортируйте таблицу по убыванию значений в поле funding_total. Чем занимается компания, можно понять по значению в поле category_code. Чтобы объединить условия, используйте логический оператор.
SELECT funding_total
FROM company
WHERE category_code = 'news'
  AND country_code = 'USA'
ORDER BY funding_total DESC;

-- Задача 3. Найдите общую сумму сделок по покупке одних компаний другими в долларах. Отберите сделки, которые осуществлялись только за наличные с 2011 по 2013 год включительно. Всю информацию нужно взять из таблицы acquisition. Способ оплаты сделки указан в поле term_code.
SELECT SUM(price_amount)
FROM acquisition
WHERE term_code = 'cash'
  AND EXTRACT('year'
              FROM acquired_at) BETWEEN 2011 AND 2013;

-- Задача 4. Отобразите имя, фамилию и названия аккаунтов людей в поле network_username, у которых названия аккаунтов начинаются на 'Silver'. Получите срез по шаблону.
SELECT first_name,
       last_name,
       network_username
FROM people
WHERE network_username LIKE 'Silver%';

-- Задача 5. Выведите на экран всю информацию о людях, у которых названия аккаунтов в поле network_username содержат подстроку 'money', а фамилия начинается на 'K'. Получите срез по шаблону.
SELECT *
FROM people
WHERE network_username LIKE '%money%'
  AND last_name LIKE 'K%';

-- Задача 6. Для каждой страны отобразите общую сумму привлечённых инвестиций, которые получили компании, зарегистрированные в этой стране. Страну, в которой зарегистрирована компания, можно определить по коду страны. Отсортируйте данные по убыванию суммы. Используйте агрегирующую функцию и группировку. При сортировке тоже можно обращаться к результату агрегирующей функции.
SELECT country_code,
       SUM(funding_total)
FROM company
GROUP BY country_code
ORDER BY SUM(funding_total) DESC;

-- Задача 7. Составьте таблицу, в которую войдёт дата проведения раунда, а также минимальное и максимальное значения суммы инвестиций, привлечённых в эту дату. Оставьте в итоговой таблице только те записи, в которых минимальное значение суммы инвестиций не равно нулю и не равно максимальному значению. Не забудьте, что срез до и после группировки получают разными операторами.
SELECT funded_at,
       MIN(raised_amount),
       MAX(raised_amount)
FROM funding_round
GROUP BY funded_at
HAVING MIN(raised_amount) <> 0
AND MIN(raised_amount) <> MAX(raised_amount);

-- Задача 8. Создайте поле с категориями: для фондов, которые инвестируют в 100 и более компаний, назначьте категорию high_activity; для фондов, которые инвестируют в 20 и более компаний до 100, назначьте категорию middle_activity. Если количество инвестируемых компаний фонда не достигает 20, назначьте категорию low_activity. Отобразите все поля таблицы fund и новое поле с категориями. Создать новое поле с категориями можно оператором CASE.
SELECT *,
       CASE -- задаю условия отбора в новые поля

           WHEN invested_companies >= 100 THEN 'high_activity'
           WHEN invested_companies >= 20
                AND invested_companies < 100 THEN 'middle_activity'
           WHEN invested_companies < 20 THEN 'low_activity'
       END
FROM fund;

-- Задача 9. Для каждой из категорий, назначенных в предыдущем задании, посчитайте округлённое до ближайшего целого числа среднее количество инвестиционных раундов, в которых фонд принимал участие. Выведите на экран категории и среднее число инвестиционных раундов. Отсортируйте таблицу по возрастанию среднего. Сгруппируйте данные по категориям и вычислите среднее для каждой группы. Для округления используйте функцию ROUND.
SELECT CASE
           WHEN invested_companies>=100 THEN 'high_activity'
           WHEN invested_companies>=20 THEN 'middle_activity'
           ELSE 'low_activity'
       END AS activity,
       ROUND(AVG(investment_rounds))
FROM fund
GROUP BY activity
ORDER BY ROUND(AVG(investment_rounds));

-- Задача 10. Проанализируйте, в каких странах находятся фонды, которые чаще всего инвестируют в стартапы. Для каждой страны посчитайте минимальное, максимальное и среднее число компаний, в которые инвестировали фонды этой страны, основанные с 2010 по 2012 год включительно. Исключите страны с фондами, у которых минимальное число компаний, получивших инвестиции, равно нулю. Выгрузите десять самых активных стран-инвесторов: отсортируйте таблицу по среднему количеству компаний от большего к меньшему. Затем добавьте сортировку по коду страны в лексикографическом порядке.Используйте агрегирующие функции MIN, MAX и AVG. Для фильтрации диапазона по годам примените оператор BETWEEN.
SELECT country_code,
       MIN(invested_companies),
       MAX(invested_companies),
       AVG(invested_companies)
FROM fund
WHERE EXTRACT (YEAR
               FROM founded_at) IN (2010,
                                    2011,
                                    2012)
GROUP BY country_code
HAVING MIN(invested_companies) >0
ORDER BY AVG(invested_companies) DESC, country_code
LIMIT 10;

-- Задача 11. Отобразите имя и фамилию всех сотрудников стартапов. Добавьте поле с названием учебного заведения, которое окончил сотрудник, если эта информация известна. Необходимую информацию содержат несколько таблиц, нужно придумать способ присоединения.
SELECT p.first_name,
       p.last_name,
       e.instituition
FROM people AS p
LEFT JOIN education AS e ON p.id = e.person_id;

-- Задача 12. Для каждой компании найдите количество учебных заведений, которые окончили её сотрудники. Выведите название компании и число уникальных названий учебных заведений. Составьте топ-5 компаний по количеству университетов. Необходимая информация содержится в трёх таблицах. Одного присоединения будет недостаточно.
SELECT c.name,
       COUNT(DISTINCT e.instituition)
FROM company AS c
JOIN people AS p ON c.id = p.company_id
JOIN education AS e ON p.id = e.person_id
GROUP BY c.name
ORDER BY COUNT(DISTINCT e.instituition) DESC
LIMIT 5;

-- Задача 13. Составьте список с уникальными названиями закрытых компаний, для которых первый раунд финансирования оказался последним. Можно использовать подзапрос или присоединение.
SELECT name
FROM company AS c
JOIN funding_round AS fr ON c.id = fr.company_id
WHERE STATUS ='closed'
  AND is_first_round = 1
  AND is_last_round = 1
GROUP BY name;

-- Задача 14. Составьте список уникальных номеров сотрудников, которые работают в компаниях, отобранных в предыдущем задании. В этом задании нужно использовать несколько присоединений или подзапросов. Или комбинировать эти методы.
SELECT DISTINCT p.id
FROM people AS p
WHERE p.company_id IN
    (SELECT c.id
     FROM company AS c
     JOIN funding_round AS fr ON c.id = fr.company_id
     WHERE STATUS ='closed'
       AND is_first_round = 1
       AND is_last_round = 1
     GROUP BY c.id);

-- Задача 15. Составьте таблицу, куда войдут уникальные пары с номерами сотрудников из предыдущей задачи и учебным заведением, которое окончил сотрудник. Дополните предыдущий запрос.
SELECT p.id,
       e.instituition
FROM people AS p
LEFT JOIN education AS e ON p.id = e.person_id
WHERE p.company_id IN
    (SELECT c.id
     FROM company AS c
     JOIN funding_round AS fr ON c.id = fr.company_id
     WHERE STATUS ='closed'
       AND is_first_round = 1
       AND is_last_round = 1
     GROUP BY c.id)
GROUP BY p.id,
         e.instituition
HAVING instituition IS NOT NULL;

-- Задача 16. Посчитайте количество учебных заведений для каждого сотрудника из предыдущего задания. При подсчёте учитывайте, что некоторые сотрудники могли окончить одно и то же заведение дважды. К предыдущему запросу добавьте группировку и агрегирующую функцию.
SELECT p.id,
       COUNT(e.instituition)
FROM people AS p
LEFT JOIN education AS e ON p.id = e.person_id
WHERE p.company_id IN
    (SELECT c.id
     FROM company AS c
     JOIN funding_round AS fr ON c.id = fr.company_id
     WHERE STATUS ='closed'
       AND is_first_round = 1
       AND is_last_round = 1
     GROUP BY c.id)
GROUP BY p.id
HAVING COUNT(DISTINCT e.instituition) > 0;

-- Задача 17. Дополните предыдущий запрос и выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники разных компаний. Нужно вывести только одну запись, группировка здесь не понадобится. Используйте подзапрос, чтобы найти среднее от данных, которые вы получили в результате предыдущего запроса.
WITH base AS
  (SELECT p.id,
          COUNT(e.instituition)
   FROM people AS p
   LEFT JOIN education AS e ON p.id = e.person_id
   WHERE p.company_id IN
       (SELECT c.id
        FROM company AS c
        JOIN funding_round AS fr ON c.id = fr.company_id
        WHERE STATUS ='closed'
          AND is_first_round = 1
          AND is_last_round = 1
        GROUP BY c.id)
   GROUP BY p.id
   HAVING COUNT(DISTINCT e.instituition) >0)
SELECT AVG(COUNT)
FROM base;

-- Задача 18. Напишите похожий запрос: выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники Socialnet. Этот запрос похож на предыдущий, нужно только изменить условия для среза.
WITH pi AS
  (SELECT p.id,
          COUNT(e.instituition)
   FROM people AS p
   RIGHT JOIN education AS e ON p.id = e.person_id
   WHERE p.company_id IN
       (SELECT id
        FROM company
        WHERE name = 'Socialnet')
   GROUP BY p.id)
SELECT AVG(COUNT)
FROM pi;

-- Задача 19. Составьте таблицу из полей: name_of_fund — название фонда; name_of_company — название компании; amount — сумма инвестиций, которую привлекла компания в раунде. В таблицу войдут данные о компаниях, в истории которых было больше шести важных этапов, а раунды финансирования проходили с 2012 по 2013 год включительно. Начните с таблицы investment и присоедините к ней таблицы company и fund. Последней можете присоединить таблицу funding_round, но это только рекомендация. Вы можете написать запрос по-своему.
SELECT f.name AS name_of_fund,
       c.name AS name_of_company,
       fr.raised_amount AS amount
FROM investment AS i
LEFT JOIN company AS c ON c.id = i.company_id
LEFT JOIN fund AS f ON i.fund_id = f.id
INNER JOIN
  (SELECT*
   FROM funding_round
   WHERE funded_at BETWEEN '2012-01-01' AND '2013-12-31') AS fr ON fr.id = i.funding_round_id
WHERE c.milestones > 6;

-- Задача 20. Выгрузите таблицу, в которой будут такие поля: название компании-покупателя; сумма сделки; название компании, которую купили; сумма инвестиций, вложенных в купленную компанию; доля, которая отображает, во сколько раз сумма покупки превысила сумму вложенных в компанию инвестиций, округлённая до ближайшего целого числа. Не учитывайте те сделки, в которых сумма покупки равна нулю. Если сумма инвестиций в компанию равна нулю, исключите такую компанию из таблицы. Отсортируйте таблицу по сумме сделки от большей к меньшей, а затем по названию купленной компании в лексикографическом порядке. Ограничьте таблицу первыми десятью записями. Самая важная таблица — acquisition. Эта таблица содержит информацию о покупках одних компаний другими, поэтому данные из неё пропасть не должны. Выбирайте способ присоединения внимательно.
WITH acquiring AS
  (SELECT c.name AS buyer,
          a.price_amount AS price,
          a.id AS KEY
   FROM acquisition AS a
   LEFT JOIN company AS c ON a.acquiring_company_id = c.id
   WHERE a.price_amount > 0),
     acquired AS
  (SELECT c.name AS acquisition,
          c.funding_total AS investment,
          a.id AS KEY
   FROM acquisition AS a
   LEFT JOIN company AS c ON a.acquired_company_id = c.id
   WHERE c.funding_total > 0)
SELECT an.buyer,
       an.price,
       ad.acquisition,
       ad.investment,
       ROUND(an.price / ad.investment) AS uplift
FROM acquiring AS an
JOIN acquired AS ad ON an.KEY = ad.KEY
ORDER BY price DESC,
         acquisition
LIMIT 10;

-- Второй вариант
SELECT buy_c.name AS name_acquiring_company,
       ac.price_amount,
       sell_c.name AS name_acquired_company,
       sell_c.funding_total,
       ROUND(ac.price_amount / sell_c.funding_total) AS price_to_funding_rate
FROM acquisition AS ac
LEFT JOIN company AS buy_c ON ac.acquiring_company_id = buy_c.id
LEFT JOIN company AS sell_c ON ac.acquired_company_id = sell_c.id
WHERE ac.price_amount > 0
  AND sell_c.funding_total > 0
ORDER BY ac.price_amount DESC,
         name_acquired_company
LIMIT 10;

-- Задача 21. Выгрузите таблицу, в которую войдут названия компаний из категории social, получившие финансирование с 2010 по 2013 год включительно. Проверьте, что сумма инвестиций не равна нулю. Выведите также номер месяца, в котором проходил раунд финансирования. Отберите компании, которые участвовали в раундах с 2010 по 2013 год включительно и привлекли любую сумму инвестиций, не равную нулю. Вам понадобятся таблицы company и funding_round.
SELECT c.name AS social_co,
       EXTRACT (MONTH
                FROM fr.funded_at) AS funding_month
FROM company AS c
LEFT JOIN funding_round AS fr ON c.id = fr.company_id
WHERE c.category_code = 'social'
  AND fr.funded_at BETWEEN '2010-01-01' AND '2013-12-31'
  AND fr.raised_amount <> 0;

-- Задача 22. Отберите данные по месяцам с 2010 по 2013 год, когда проходили инвестиционные раунды. Сгруппируйте данные по номеру месяца и получите таблицу, в которой будут поля: номер месяца, в котором проходили раунды; количество уникальных названий фондов из США, которые инвестировали в этом месяце; количество компаний, купленных за этот месяц; общая сумма сделок по покупкам в этом месяце. Чтобы вычислить номер месяца проведения раундов, используйте значения в поле funded_at в таблице funding_round. Два последних поля — с количеством купленных компаний и с суммой сделок — можно получить, взяв данные из таблицы acquisition. Используйте общие табличные выражения — будет легче не запутаться в присоединении.
WITH fundings AS
  (SELECT EXTRACT(MONTH
                  FROM CAST(fr.funded_at AS DATE)) AS funding_month,
          COUNT(DISTINCT f.id) AS us_funds
   FROM fund AS f
   LEFT JOIN investment AS i ON f.id = i.fund_id
   LEFT JOIN funding_round AS fr ON i.funding_round_id = fr.id
   WHERE f.country_code = 'USA'
     AND EXTRACT(YEAR
                 FROM CAST(fr.funded_at AS DATE)) BETWEEN 2010 AND 2013
   GROUP BY funding_month),
     acquisitions AS
  (SELECT EXTRACT(MONTH
                  FROM CAST(acquired_at AS DATE)) AS funding_month,
          COUNT(acquired_company_id) AS bought_co,
          SUM(price_amount) AS sum_total
   FROM acquisition
   WHERE EXTRACT(YEAR
                 FROM CAST(acquired_at AS DATE)) BETWEEN 2010 AND 2013
   GROUP BY funding_month)
SELECT fnd.funding_month,
       fnd.us_funds,
       acq.bought_co,
       acq.sum_total
FROM fundings AS fnd
LEFT JOIN acquisitions AS acq ON fnd.funding_month = acq.funding_month;

-- Задача 23. Составьте сводную таблицу и выведите среднюю сумму инвестиций для стран, в которых есть стартапы, зарегистрированные в 2011, 2012 и 2013 годах. Данные за каждый год должны быть в отдельном поле. Отсортируйте таблицу по среднему значению инвестиций за 2011 год от большего к меньшему. Вы уже решали похожую задачу на курсе. Для каждой страны посчитайте среднюю сумму инвестиций в стартапы, основанные в 2011 году. Проделайте то же самое для 2012 и 2013 года. Объедините получившиеся таблицы по стране.
WITH inv_2011 AS
  (SELECT country_code AS country,
          AVG(funding_total) AS inv_2011
   FROM company
   WHERE EXTRACT(YEAR
                 FROM founded_at::DATE) IN(2011,
                                           2012,
                                           2013)
   GROUP BY country,
            EXTRACT(YEAR
                    FROM founded_at)
   HAVING EXTRACT(YEAR
                  FROM founded_at) = '2011'),
     inv_2012 AS
  (SELECT country_code AS country,
          AVG(funding_total) AS inv_2012
   FROM company
   WHERE EXTRACT(YEAR
                 FROM founded_at::DATE) IN(2011,
                                           2012,
                                           2013)
   GROUP BY country,
            EXTRACT(YEAR
                    FROM founded_at)
   HAVING EXTRACT(YEAR
                  FROM founded_at) = '2012'),
     inv_2013 AS
  (SELECT country_code AS country,
          AVG(funding_total) AS inv_2013
   FROM company
   WHERE EXTRACT(YEAR
                 FROM founded_at::DATE) IN(2011,
                                           2012,
                                           2013)
   GROUP BY country,
            EXTRACT(YEAR
                    FROM founded_at)
   HAVING EXTRACT(YEAR
                  FROM founded_at) = '2013')
SELECT inv_2011.country,
       inv_2011,
       inv_2012,
       inv_2013
FROM inv_2011
INNER JOIN inv_2012 ON inv_2011.country = inv_2012.country
INNER JOIN inv_2013 ON inv_2012.country = inv_2013.country
ORDER BY inv_2011 DESC;
