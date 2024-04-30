1) Запрос с регулярным выражением:
   ```
   select * from ozon.product where name ilike 'IphOne %'
   ```
2) Запрос с использованием left join, inner join
   ```
   select * from ozon.product
   inner join ozon.promotion_product on ozon.promotion_product.product_fk = ozon.product.id
   inner join ozon.promotion on ozon.promotion_product.promotion_fk = ozon.promotion.id
   left join ozon.brand on ozon.product.brand_fk = brand.id
   ```
   1) Если начать с LEFT JOIN, вы можете включить в результат строки из левой таблицы, даже если в правой таблице нет соответствующих записей.
   2) Если начать с INNER JOIN, вы сразу ограничите результаты только теми строками, которые имеют соответствия во всех соединяемых таблицах.
3) Запрос на добавление с выводом информации о добавленных строках 
```
INSERT INTO ozon.brand (id, name) VALUES (DEFAULT, 'Otus') returning id
```
4) Запрос с обновлением данные используя UPDATE FROM. Обновление кол-ва товара если в корзине кол-во больше чем есть по факту
```
UPDATE ozon.basket_product
SET amount=subquery.amount
FROM (SELECT * from ozon.product) as subquery
where ozon.basket_product.amount > subquery.amount
```
5) Запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
```
delete from ozon.basket_product
using ozon.product
where ozon.product.amount < ozon.basket_product.amount
```