
## Примеры бизнес-задач которые решает база
    - Создание и взаимодействие с отзывами и вопросами: Это важно для поддержания обратной связи с клиентами и улучшения качества продуктов и услуг. Возможность оценки полезности дополнительно помогает выявлять наиболее ценные мнения.
    - Группировка и классификация продуктов: Это упрощает поиск и исследование товаров для пользователей, а также помогает в реализации персонализированных рекомендаций и маркетинговых стратегий.
    - Управление каталогом продуктов: Создание продуктов с уникальными атрибутами и типами поддерживает гибкость каталога и обеспечивает лучшее понимание характеристик товаров. Иерархия категорий и типов продуктов с атрибутами улучшает навигацию и поиск.
    - Личный кабинет пользователя: Включение функционала "Избранное", "Сравнение", управление корзиной и отслеживание заказов увеличивает удобство использования и лояльность пользователей.
    - Логистика и возвраты: Управление адресами доставки и точками самовывоза, а также процедуры возврата товаров, важны для обеспечения гладкого процесса покупки и послепродажного обслуживания.

## Возможные запросы/отчеты/поиск данных
- получение списка товаров с их названием, изображением, средней оценкой (расчет средней оценки на основании review)
- получение отдельной карточки товара 

## Таблицы

- [x] **product**

Товар.

| Field              | Name                   | Constraint                      | Level cardinality | Index |
|--------------------|------------------------|---------------------------------|-------------------|-------|
| id                 | Ключ                   |                                 | high              |       |
| name               | Название               |                                 | high              |       |
| type_fk            | Id типа                | REFERENCES type(id)             | middle            | x     |
| seller_fk          | Id продавца            | REFERENCES seller(id)           | middle            | x     |
| brand_fk           | Id брэнда              | REFERENCES brand(id)            | middle            | x     |
| protein_count      | Кол-во белка           | CHECK (protein_count >= 0)      | high              |       |
| fat_count          | Кол-во жиров           | CHECK (fat_count >= 0)          | high              |       |
| carbohydrate_count | Кол-во углеводов       | CHECK (carbohydrate_count >= 0) | high              |       |
| amount             | Кол-во товара осталось | CHECK (amount >= 0)             | high              |       |
| description        | Описание               |                                 |                   |       |
| storage_conditions | Условия хранения       |                                 |                   |       |
| composition        | Состав                 |                                 |                   |       |
| price              | Цена                   | CHECK (price >= 0)              | high              |       |
| discount           | Скидка                 | CHECK (discount >= 0)           | high              |       |

- [x] **review_product**

Отзыв на продукт.

| Field      | Name        | Constraint             | Level cardinality | Index |
|------------|-------------|------------------------|-------------------|-------|
| id         | Ключ        |                        |                   |       |
| product_fk | Id продукта | REFERENCES product(id) | middle            | x     |
| review_fk  | Id отзыва   | REFERENCES review(id)  | middle            |       |

- [x] **review**

Отзыв.

| Field         | Name                      | Constraint                              | Level cardinality | Index |
|---------------|---------------------------|-----------------------------------------|-------------------|-------|
| id            | Ключ                      |                                         |                   |       |
| user_fk       | Id пользователя           | REFERENCES user(id)                     | middle            |       |
| rating        | Отзыв                     | CHECK (rating > 0); CHECK (rating <= 5) | low               |       |
| dignities     | Достоинства               |                                         |                   |       |
| flaws         | Недостатки                |                                         |                   |       |
| comment       | Комментарий               |                                         |                   |       |
| like_count    | Сколько раз понравился    | CHECK (like_count >= 0)                 |                   |       |
| dislike_count | Сколько раз не понравился | CHECK (dislike_count >= 0)              |                   |       |
| created_at    | Дата создания             |                                         |                   |       |

- [x] **gallery_review**

Галлерея отзыва.

| Field     | Name      | Constraint            | Level cardinality | Index |
|-----------|-----------|-----------------------|-------------------|-------|
| id        | Ключ      |                       |                   |       |
| review_fk | Id отзыва | REFERENCES review(id) | middle            | x     |
| priority  | Id отзыва |                       | middle            |       |

- [x] **answer_review**

Ответ отзыва.

| Field     | Name      | Constraint            | Level cardinality | Index |
|-----------|-----------|-----------------------|-------------------|-------|
| id        | Ключ      |                       |                   |       |
| review_fk | Id отзыва | REFERENCES review(id) | middle            | x     |
| answer_fk | Id ответа | REFERENCES answer(id) | high              | x     |

- [x] **answer**

Ответ.

| Field         | Name                     | Constraint                 | Level cardinality | Index |
|---------------|--------------------------|----------------------------|-------------------|-------|
| id            | Ключ                     |                            |                   |       |
| user_fk       | Id пользователя          | REFERENCES user(id)        |                   | x     |
| content       | Контент                  |                            |                   |       |
| like_count    | Кол-во раз понравился    | CHECK (like_count >= 0)    |                   |       |
| dislike_count | Кол-во раз не понравился | CHECK (dislike_count >= 0) |                   |       |

- [x] **tag_product**

Тег продукта.

| Field      | Name        | Constraint             | Level cardinality | Index |
|------------|-------------|------------------------|-------------------|-------|
| id         | Ключ        |                        |                   |       |
| product_fk | Id продукта | REFERENCES product(id) | middle            |       |
| tag_fk     | Id тега     | REFERENCES tag(id)     | middle            |       |

- [x] **tag**

Тег.

| Field           | Name                 | Constraint                                                  | Level cardinality | Index |
|-----------------|----------------------|-------------------------------------------------------------|-------------------|-------|
| id              | Ключ                 |                                                             |                   |       |
| name            | Название             |                                                             | high              | x     |
| media_file_link | Ссылка на медиа файл | media_link_format CHECK (media_file_link ~* '^https?://.*') | high              |       |

- [x] **promotion_product**

Продукт акции.

| Field        | Name        | Constraint               | Level cardinality | Index |
|--------------|-------------|--------------------------|-------------------|-------|
| id           | Ключ        |                          |                   |       |
| product_fk   | Id продукта | REFERENCES product(id)   | middle            | x     |
| promotion_fk | Id акции    | REFERENCES promotion(id) | middle            | x     |

- [x] **promotion**

Акция.

| Field | Name     | Constraint | Level cardinality | Index |
|-------|----------|------------|-------------------|-------|
| id    | Ключ     |            |                   |       |
| name  | Название |            | high              | x     |

- [x] **category_product**

Категория продукта.

| Field       | Name         | Constraint              | Level cardinality | Index |
|-------------|--------------|-------------------------|-------------------|-------|
| id          | Ключ         |                         |                   |       |
| category_fk | Id категории | REFERENCES category(id) | middle            | x     |
| product_fk  | Id продукта  | REFERENCES product(id)  | middle            | x     |

- [x] **category**

Категория.

| Field           | Name                      | Constraint              | Level cardinality | Index |
|-----------------|---------------------------|-------------------------|-------------------|-------|
| id              | Ключ                      |                         |                   |       |
| name            | Название                  |                         | high              | x     |
| parent_category | Id родительской категории | REFERENCES category(id) | middle            | x     |

- [x] **type**

Тип.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            | high              | x     |

- [x] **attribute_type**

Тип аттрибута.

| Field        | Name         | Constraint               | Level cardinality | Index |
|--------------|--------------|--------------------------|-------------------|-------|
| id           | Ключ         |                          |                   |       |
| type_fk      | Id типа      | REFERENCES type(id)      | middle            | x     |
| attribute_fk | Id аттрибута | REFERENCES attribute(id) | middle            | x     |

- [x] **attribute**

Аттрибут.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            | high              | x     |

- [x] **filling_attribute_rule**

Значение аттрибута.

| Field        | Name         | Constraint               | Level cardinality | Index |
|--------------|--------------|--------------------------|-------------------|-------|
| id           | Ключ         |                          |                   |       |
| attribute_fk | Id аттрибута | REFERENCES attribute(id) | middle            | x     |
| rule_fk      | Id правила   | REFERENCES rule(id)      | middle            | x     |

- [x] **rule**

Правило.

| Field   | Name       | Constraint                                                       | Level cardinality | Index |
|---------|------------|------------------------------------------------------------------|-------------------|-------|
| id      | Ключ       |                                                                  |                   |       |
| type    | Тип        | CHECK (user_input IN ('radio', 'select', 'text', 'int', 'float') | low               |       |

- [x] **brand**

Бренд.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            | high              | x     |

- [x] **product_attribute**

Аттрибут продукта.

| Field        | Name         | Constraint               | Level cardinality | Index |
|--------------|--------------|--------------------------|-------------------|-------|
| id           | Ключ         |                          |                   |       |
| product_fk   | Id продукта  | REFERENCES product(id)   | middle            | x     |
| attribute_fk | Id аттрибута | REFERENCES attribute(id) | middle            | x     |

- [x] **question_product**

Вопрос про продукт.

| Field       | Name        | Constraint              | Level cardinality | Index |
|-------------|-------------|-------------------------|-------------------|-------|
| id          | Ключ        |                         |                   |       |
| product_fk  | Id продукта | REFERENCES product(id)  | middle            | x     |
| question_fk | Id вопроса  | REFERENCES question(id) | middle            | x     |

- [x] **question**

Вопрос.

| Field      | Name                  | Constraint              | Level cardinality | Index |
|------------|-----------------------|-------------------------|-------------------|-------|
| id         | Ключ                  |                         |                   |       |
| user_fk    | Id пользователя       | REFERENCES user(id)     | middle            | ч     |
| like_count | Кол-во раз понравился | CHECK (like_count >= 0) |                   |       |
| created_at | Дата и время создания |                         |                   |       |

- [x] **question_answer**

Ответ на вопрос.

| Field       | Name       | Constraint              | Level cardinality | Index |
|-------------|------------|-------------------------|-------------------|-------|
| id          | Ключ       |                         |                   |       |
| question_fk | Id вопроса | REFERENCES question(id) | middle            | x     |
| answer_fk   | Id ответа  | REFERENCES answer(id)   | middle            | x     |

- [x] **answer**

Ответ.

| Field         | Name                     | Constraint                 | Level cardinality | Index |
|---------------|--------------------------|----------------------------|-------------------|-------|
| id            | Ключ                     |                            |                   |       |
| user_fk       | Id пользователя          | REFERENCES user(id)        | middle            | x     |
| content       | Контент                  |                            |                   |       |
| like_count    | Кол-во раз понравился    | CHECK (like_count >= 0)    |                   |       |
| dislike_count | Кол-во раз не понравился | CHECK (dislike_count >= 0) |                   |       |

- [x] **seller**

Продавец.

| Field | Name     | Constraint | Level cardinality | Index |
|-------|----------|------------|-------------------|-------|
| id    | Ключ     |            |                   |       |
| name  | Название |            | high              | x     |

- [x] **gallery_product**

Продавец.

| Field           | Name                 | Constraint                                 | Level cardinality | Index |
|-----------------|----------------------|--------------------------------------------|-------------------|-------|
| id              | Ключ                 |                                            |                   |       |
| product_fk      | Id продукта          | REFERENCES product(id)                     | middle            | x     |
| attribute_fk    | Id аттрибута         | REFERENCES attribute(id)                   | middle            | x     |
| media_file_link | Ссылка на медиа файл | CHECK (media_file_link ~* '^https?://.*'); |                   |       | 

- [x] **product_attribute_value**

Значение аттрибута продукта.

| Field           | Name               | Constraint               | Level cardinality | Index |
|-----------------|--------------------|--------------------------|-------------------|-------|
| id              | Ключ               |                          |                   |       |
| product_fk      | Id продукта        | REFERENCES product(id)   | middle            | x     |
| attribute_fk    | Id аттрибута       | REFERENCES attribute(id) | middle            | x     |
| attribute_value | Значение аттрибута |                          | high              | x     | 

- [x] **user**

Пользователь.

| Field         | Name       | Constraint                                                          | Level cardinality | Index |
|---------------|------------|---------------------------------------------------------------------|-------------------|-------|
| id            | Ключ       |                                                                     |                   |       |
| email         | Email      | CHECK (email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') | high              |       |
| password_hash | Хэш пароля |                                                                     |                   |       |
| password_hash | Хэш пароля |                                                                     |                   |       |

- [x] **contact**

Контакт.

| Field   | Name            | Constraint          | Level cardinality | Index |
|---------|-----------------|---------------------|-------------------|-------|
| id      | Ключ            |                     |                   |       |
| user_fk | Id пользователя | REFERENCES user(id) | high              | x     |
| name    | Имя             |                     |                   |       |
| surname | Фамилия         |                     |                   |       |

- [x] **favorite**

Избранное.

| Field      | Name            | Constraint             | Level cardinality | Index |
|------------|-----------------|------------------------|-------------------|-------|
| id         | Ключ            |                        |                   |       |
| user_fk    | Id пользователя | REFERENCES user(id)    | middle            | x     |
| product_fk | Id продукта     | REFERENCES product(id) | middle            | x     |

- [x] **сomparison**

Сравнение.

| Field      | Name            | Constraint             | Level cardinality | Index |
|------------|-----------------|------------------------|-------------------|-------|
| id         | Ключ            |                        |                   |       |
| user_fk    | Id пользователя | REFERENCES user(id)    | middle            | x     |
| product_fk | Id продукта     | REFERENCES product(id) | middle            | x     |

- [x] **address_delivery**

Адрес доставки.

| Field            | Name             | Constraint                                        | Level cardinality | Index |
|------------------|------------------|---------------------------------------------------|-------------------|-------|
| id               | Ключ             |                                                   |                   |       |
| user_fk          | Id пользователя  | REFERENCES user(id)                               | middle            | x     |
| address          | Адрес            |                                                   |                   |       |
| index            | Индекс           |                                                   |                   |       |
| apartment_number | Номер квартиры   |                                                   |                   |       |
| level            | Этаж             | CHECK (level > 0); CHECK (level <= 100)           |                   |       |
| intercom         | Домофон          |                                                   |                   |       |
| comment          | Комментарий      |                                                   |                   |       |
| name_reciever    | Имя получателя   |                                                   |                   |       |
| phone_reciever   | Номер получателя | CHECK (phone_number ~* '^\(\d{3}\) \d{3}-\d{4}$') |                   |       |

- [x] **basket**

Корзина.

| Field   | Name            | Constraint          | Level cardinality | Index |
|---------|-----------------|---------------------|-------------------|-------|
| id      | Ключ            |                     |                   |       |
| user_fk | Id пользователя | REFERENCES user(id) |                   |       |

- [x] **basket_product**

Продукт корзины.

| Field      | Name        | Constraint             | Level cardinality | Index |
|------------|-------------|------------------------|-------------------|-------|
| id         | Ключ        |                        |                   |       |
| basket_fk  | Id корзины  | REFERENCES basket(id)  |                   | x     |
| product_fk | Id продукта | REFERENCES product(id) |                   | x     |
| amount     | Кол-во      | CHECK (amount >= 0)    |                   |       |

- [x] **pickup_point**

Точка самовывоза.

| Field          | Name          | Constraint                                              | Level cardinality | Index |
|----------------|---------------|---------------------------------------------------------|-------------------|-------|
| id             | Ключ          |                                                         |                   |       |
| address        | Адрес         |                                                         |                   |       |
| delivery_hours | Часы доставки | CHECK (delivery_hours ~* '^\d{2}:\d{2} - \d{2}:\d{2}$') |                   |       |

- [x] **order**

Заказ.

| Field             | Name                  | Constraint                                                        | Level cardinality | Index |
|-------------------|-----------------------|-------------------------------------------------------------------|-------------------|-------|
| id                | Ключ                  |                                                                   |                   |       |
| user_fk           | Id пользователя       | REFERENCES user(id)                                               |                   | x     |
| delivery_datetime | Дата и время доставки |                                                                   |                   |       |
| status            | Статус                | CHECK (delivery_status IN ('ON_WAY', 'DELIVERED', 'WAIT_CONFIRM') |                   |       |
| grade             | Оценка                | CHECK (amount >= 0); CHECK (amount <= 5)                          |                   |       |

- [x] **order_product**

Продукт заказа.

| Field      | Name        | Constraint                                                        | Level cardinality | Index |
|------------|-------------|-------------------------------------------------------------------|-------------------|-------|
| id         | Ключ        |                                                                   |                   |       |
| order_fk   | Id заказа   | REFERENCES order(id)                                              | middle            | x     |
| product_fk | Id продукта | REFERENCES product(id)                                            | middle            | x     |
| price      | Цена        | CHECK (price >= 0)                                                |                   |       |
| amount     | Кол-во      | CHECK (amount >= 0)                                               |                   |       |
| discount   | Скидка      | CHECK (discount >= 0)                                             |                   |       |
| status     | Статус      | CHECK (delivery_status IN ('ON_WAY', 'DELIVERED', 'WAIT_CONFIRM') | low               |       |

- [x] **delivery**

Доставка.

| Field               | Name               | Constraint                                            | Level cardinality | Index |
|---------------------|--------------------|-------------------------------------------------------|-------------------|-------|
| id                  | Ключ               |                                                       |                   |       |
| order_fk            | Id заказа          | REFERENCES order(id)                                  | middle            | x     |
| delivery_method     | Метод доставки     | CHECK (delivery_status IN ('COURIER', 'PICKUP_POINT') |                   |       |
| address_delivery_fk | Id адреса доставки | REFERENCES address_delivery(id)                       |                   |       |
| grade               | Оценка             | CHECK (grade >= 0); CHECK (grade <= 0)                |                   |       |

- [x] **refund**

Возврат.

| Field     | Name       | Constraint                                                 | Level cardinality | Index |
|-----------|------------|------------------------------------------------------------|-------------------|-------|
| id        | Ключ       |                                                            |                   |       |
| order_fk  | Id заказа  | REFERENCES order(id)                                       | high              | x     |
| status    | Статус     | CHECK (delivery_status IN ('CONFIRMED', 'WAIT', 'REFUSED') | low               |       |
| reason_fk | Id причины | REFERENCES reason(id)                                      |                   | x     |

- [x] **refund_product**

Продукт возврата.

| Field      | Name        | Constraint             | Level cardinality | Index |
|------------|-------------|------------------------|-------------------|-------|
| id         | Ключ        |                        |                   |       |
| refund_fk  | Id возврата | REFERENCES refund(id)  | middle            | x     |
| product_fk | Id продукта | REFERENCES product(id) | middle            | x     |


- [x] **reason**

Причина.

| Field   | Name        | Constraint | Level cardinality | Index |
|---------|-------------|------------|-------------------|-------|
| id      | Ключ        |            |                   |       |
| comment | Комментарий |            |                   |       |

- [x] **gallery_reason**

Причина.

| Field           | Name                 | Constraint                                 | Level cardinality | Index |
|-----------------|----------------------|--------------------------------------------|-------------------|-------|
| id              | Ключ                 |                                            |                   |       |
| reason_fk       | Id причины           | REFERENCES reason(id)                      | middle            |       |
| media_file_link | Ссылка на медиа файл | CHECK (media_file_link ~* '^https?://.*'); |                   |       |
