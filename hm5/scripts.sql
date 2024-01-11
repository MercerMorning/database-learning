-- запрос с регулярным выражением. Поиск продуктов с определенным шаблоном имени производителя
SELECT * from storehouse.product JOIN storehouse.producer p on p.id = product.producer_fk where storehouse.producer.name  ~ 'производитель№[0-9]+';

-- INNER JOIN используется для соединения таблиц product, producer, product_category, и category. Это означает, что в результат будут включены только те строки, для которых найдены соответствующие записи во всех этих таблицах.
-- LEFT JOIN используется для соединения таблиц vendor_product и review. Это означает, что в результат будут включены все строки из предыдущих соединений, даже если соответствующие записи в таблицах vendor_product и review отсутствуют.
-- Если начать с LEFT JOIN, вы можете включить в результат строки из левой таблицы, даже если в правой таблице нет соответствующих записей.
-- Если начать с INNER JOIN, вы сразу ограничите результаты только теми строками, которые имеют соответствия во всех соединяемых таблицах.
SELECT
    p.name AS ProductName,
    pr.name AS ProducerName,
    c.name AS CategoryName,
    r.score AS ReviewScore,
    r.review AS ReviewText
FROM product AS p
    INNER JOIN producer AS pr ON p.producer_fk = pr.id
    INNER JOIN product_category AS pc ON p.id = pc.product_fk
    INNER JOIN category AS c ON pc.category_fk = c.id
    LEFT JOIN vendor_product AS vp ON p.id = vp.product_fk
    LEFT JOIN review AS r ON vp.id = r.vendor_product_fk;

-- Запрос на добавление данных с выводом информации о добавленных строках.
INSERT INTO product (id, producer_fk, name, description)
VALUES
    (1, 1, 'Продукт 1', 'Описание продукта 1'),
    (2, 2, 'Продукт 2', 'Описание продукта 2')
    RETURNING id, name;

-- Запрос с обновлением данные используя UPDATE FROM
UPDATE vendor_product
SET price = price * 1.1
    FROM product
WHERE vendor_product.product_fk = product.id
  AND product.producer_fk = 123;

-- Запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
DELETE FROM product
    USING product_category, category
WHERE product.id = product_category.product_fk
  AND product_category.category_fk = category.id
  AND category.name = 'НазваниеКатегории';
