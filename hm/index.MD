1) Создан индекс для поля product_fk в таблице отзывов на продукт
```
CREATE INDEX idx_review_product ON ozon.review_product(product_fk);
```
Комментарий: индекс нужен для получения всех отзывов продукта
2) Результат команды explain, в которой используется данный индекс
```
explain select * from ozon.review_product where ozon.review_product.product_fk = 1

```
![alt text](/assets/product_review_explain_index.png)
3) Индекс для полнотекстового поиска
```
explain select ozon.product.name from ozon.product
                         where ozon.product.tsvector_product_name__brand_name @@to_tsquery('iphone & electrobrand');
```
Комментарий: индекс нужен для полнотекстового поиска по названию продукта и бренда. Например: смартфон samsung
4) Индекс на поле с функцией
```
create index price_with_discount ON ozon.product ((ozon.product.price - ozon.product.discount))
```
Комментарий: индекс нужен для вычисления цены с учетом скидки
5) Индекс на несколько полей
```
CREATE INDEX idx_nutritional_info
    ON ozon.product (protein_count, fat_count, carbohydrate_count);
```
Комментарий: индекс нужен для того чтобы найти продукты подходящие по бжу
7) Проблемы и решения
   1. пытался получить среднюю оценку всех товаров с помощью запроса

    ```
    explain select ozon.product.id, avg(rating) from ozon.product
    inner join ozon.review_product on ozon.product.id = ozon.review_product.product_fk
    inner join ozon.review on ozon.review_product.review_fk = ozon.review.id
    group by ozon.product.id
    ```
    
    не смог при join добится index scan. Получилось с помощью where in
    
    ```
    explain select avg(ozon.review.rating)
    from ozon.review_product
    inner join ozon.review on ozon.review_product.review_fk = ozon.review.id
    where ozon.review_product.product_fk in (1)
    group by ozon.review_product.product_fk
    ```
   2. Для полнотекстового поиска поле нужно постоянно сетить. Решил с помощью триггера
   ```
   CREATE FUNCTION product_trigger() RETURNS trigger AS $$
   BEGIN
   NEW.tsvector_product_name__brand_name :=
   to_tsvector('english', NEW.name || ' ' || (select name from ozon.brand where id = NEW.brand_fk LIMIT 1));
   RETURN NEW;
   END;
   $$ LANGUAGE plpgsql;
   
   CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
   ON ozon.product FOR EACH ROW EXECUTE FUNCTION product_trigger();
   ```
   3. Часть индексов не отрабатывало на небольшом объеме данных, наполнение БД помогает