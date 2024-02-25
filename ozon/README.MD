
## Примеры бизнес-задач которые решает база
    - Создание и взаимодействие с отзывами и вопросами: Это важно для поддержания обратной связи с клиентами и улучшения качества продуктов и услуг. Возможность оценки полезности дополнительно помогает выявлять наиболее ценные мнения.
    - Группировка и классификация продуктов: Это упрощает поиск и исследование товаров для пользователей, а также помогает в реализации персонализированных рекомендаций и маркетинговых стратегий.
    - Управление каталогом продуктов: Создание продуктов с уникальными атрибутами и типами поддерживает гибкость каталога и обеспечивает лучшее понимание характеристик товаров. Иерархия категорий и типов продуктов с атрибутами улучшает навигацию и поиск.
    - Личный кабинет пользователя: Включение функционала "Избранное", "Сравнение", управление корзиной и отслеживание заказов увеличивает удобство использования и лояльность пользователей.
    - Логистика и возвраты: Управление адресами доставки и точками самовывоза, а также процедуры возврата товаров, важны для обеспечения гладкого процесса покупки и послепродажного обслуживания.


## Таблицы

- [x] **product**

Товар.

| Field              | Name                   | Constraint | Level cardinality | Index |
|--------------------|------------------------|------------|-------------------|-------|
| id                 | Ключ                   |            |                   |       |
| name               | Название               |            |                   |       |
| type_fk            | Id типа                |            |                   |       |
| seller_fk          | Id продавца            |            |                   |       |
| brand_fk           | Id брэнда              |            |                   |       |
| protein_count      | Кол-во белка           |            |                   |       |
| fat_count          | Кол-во жиров           |            |                   |       |
| carbohydrate_count | Кол-во углеводов       |            |                   |       |
| amount             | Кол-во товара осталось |            |                   |       |
| description        | Описание               |            |                   |       |
| storage_conditions | Условия хранения       |            |                   |       |
| composition        | Состав                 |            |                   |       |
| price              | Цена                   |            |                   |       |
| discount           | Скидка                 |            |                   |       |

- [x] **review_product**

Отзыв на продукт.

| Field      | Name        | Constraint | Level cardinality | Index |
|------------|-------------|------------|-------------------|-------|
| id         | Ключ        |            |                   |       |
| product_fk | Id продукта |            |                   |       |
| review_fk  | Id отзыва   |            |                   |       |

- [x] **review**

Отзыв.

| Field         | Name                      | Constraint | Level cardinality | Index |
|---------------|---------------------------|------------|-------------------|-------|
| id            | Ключ                      |            |                   |       |
| user_fk       | Id пользователя           |            |                   |       |
| rating        | Отзыв                     |            |                   |       |
| dignities     | Достоинства               |            |                   |       |
| flaws         | Недостатки                |            |                   |       |
| comment       | Комментарий               |            |                   |       |
| like_count    | Сколько раз понравился    |            |                   |       |
| dislike_count | Сколько раз не понравился |            |                   |       |
| created_at    | Дата создания             |            |                   |       |

- [x] **gallery_review**

Галлерея отзыва.

| Field     | Name      | Constraint | Level cardinality | Index |
|-----------|-----------|------------|-------------------|-------|
| id        | Ключ      |            |                   |       |
| review_fk | Id отзыва |            |                   |       |
| priority  | Id отзыва |            |                   |       |

- [x] **answer_review**

Ответ отзыва.

| Field     | Name      | Constraint | Level cardinality | Index |
|-----------|-----------|------------|-------------------|-------|
| id        | Ключ      |            |                   |       |
| review_fk | Id отзыва |            |                   |       |
| answer_fk | Id ответа |            |                   |       |

- [x] **answer**

Ответ.

| Field         | Name                     | Constraint | Level cardinality | Index |
|---------------|--------------------------|------------|-------------------|-------|
| id            | Ключ                     |            |                   |       |
| user_fk       | Id пользователя          |            |                   |       |
| content       | Контент                  |            |                   |       |
| like_count    | Кол-во раз понравился    |            |                   |       |
| dislike_count | Кол-во раз не понравился |            |                   |       |

- [x] **tag_product**

Тег продукта.

| Field      | Name        | Constraint | Level cardinality | Index |
|------------|-------------|------------|-------------------|-------|
| id         | Ключ        |            |                   |       |
| product_fk | Id продукта |            |                   |       |
| tag_fk     | Id тега     |            |                   |       |

- [x] **tag**

Тег.

| Field           | Name                 | Constraint | Level cardinality | Index |
|-----------------|----------------------|------------|-------------------|-------|
| id              | Ключ                 |            |                   |       |
| name            | Название             |            |                   |       |
| media_file_link | Ссылка на медиа файл |            |                   |       |

- [x] **promotion_product**

Продукт акции.

| Field        | Name        | Constraint | Level cardinality | Index |
|--------------|-------------|------------|-------------------|-------|
| id           | Ключ        |            |                   |       |
| product_fk   | Id продукта |            |                   |       |
| promotion_fk | Id акции    |            |                   |       |

- [x] **promotion**

Акция.

| Field        | Name     | Constraint | Level cardinality | Index |
|--------------|----------|------------|-------------------|-------|
| id           | Ключ     |            |                   |       |
| name         | Название |            |                   |       |

- [x] **category_product**

Категория продукта.

| Field       | Name         | Constraint | Level cardinality | Index |
|-------------|--------------|------------|-------------------|-------|
| id          | Ключ         |            |                   |       |
| category_fk | Id категории |            |                   |       |
| product_fk  | Id продукта  |            |                   |       |

- [x] **category**

Категория.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            |                   |       |
| parent_category | Id родительской категории |            |                   |       |

- [x] **type**

Тип.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            |                   |       |

- [x] **attribute_type**

Тип аттрибута.

| Field        | Name         | Constraint | Level cardinality | Index |
|--------------|--------------|------------|-------------------|-------|
| id           | Ключ         |            |                   |       |
| type_fk      | Id типа      |            |                   |       |
| attribute_fk | Id аттрибута |            |                   |       |

- [x] **attribute**

Тип аттрибута.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            |                   |       |

- [x] **filling_attribute_rule**

Тип аттрибута.

| Field        | Name         | Constraint | Level cardinality | Index |
|--------------|--------------|------------|-------------------|-------|
| id           | Ключ         |            |                   |       |
| attribute_fk | Id аттрибута |            |                   |       |
| rule_fk      | Id правила   |            |                   |       |

- [x] **rule**

Правило.

| Field   | Name       | Constraint | Level cardinality | Index |
|---------|------------|------------|-------------------|-------|
| id      | Ключ       |            |                   |       |
| type    | Тип        |            |                   |       |

- [x] **brand**

Бренд.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            |                   |       |

- [x] **product_attribute**

Аттрибут продукта.

| Field        | Name         | Constraint | Level cardinality | Index |
|--------------|--------------|------------|-------------------|-------|
| id           | Ключ         |            |                   |       |
| product_fk   | Id продукта  |            |                   |       |
| attribute_fk | Id аттрибута |            |                   |       |

- [x] **question_product**

Вопрос про продукт.

| Field       | Name        | Constraint | Level cardinality | Index |
|-------------|-------------|------------|-------------------|-------|
| id          | Ключ        |            |                   |       |
| product_fk  | Id продукта |            |                   |       |
| question_fk | Id вопроса  |            |                   |       |

- [x] **question**

Вопрос.

| Field      | Name                  | Constraint | Level cardinality | Index |
|------------|-----------------------|------------|-------------------|-------|
| id         | Ключ                  |            |                   |       |
| user_fk    | Id пользователя       |            |                   |       |
| like_count | Кол-во раз понравился |            |                   |       |
| created_at | Дата и время создания |            |                   |       |

- [x] **question_answer**

Ответ на вопрос.

| Field       | Name       | Constraint | Level cardinality | Index |
|-------------|------------|------------|-------------------|-------|
| id          | Ключ       |            |                   |       |
| question_fk | Id вопроса |            |                   |       |
| answer_fk   | Id ответа  |            |                   |       |

- [x] **answer**

Ответ.

| Field         | Name                     | Constraint | Level cardinality | Index |
|---------------|--------------------------|------------|-------------------|-------|
| id            | Ключ                     |            |                   |       |
| user_fk       | Id пользователя          |            |                   |       |
| content       | Контент                  |            |                   |       |
| like_count    | Кол-во раз понравился    |            |                   |       |
| dislike_count | Кол-во раз не понравился |            |                   |       |

- [x] **seller**

Продавец.

| Field           | Name                      | Constraint | Level cardinality | Index |
|-----------------|---------------------------|------------|-------------------|-------|
| id              | Ключ                      |            |                   |       |
| name            | Название                  |            |                   |       |

- [x] **gallery_product**

Продавец.

| Field           | Name                 | Constraint | Level cardinality | Index |
|-----------------|----------------------|------------|-------------------|-------|
| id              | Ключ                 |            |                   |       |
| product_fk      | Id продукта          |            |                   |       |
| attribute_fk    | Id аттрибута         |            |                   |       |
| media_file_link | Ссылка на медиа файл |            |                   |       | 

- [x] **product_attribute_value**

Значение аттрибута продукта.

| Field           | Name               | Constraint | Level cardinality | Index |
|-----------------|--------------------|------------|-------------------|-------|
| id              | Ключ               |            |                   |       |
| product_fk      | Id продукта        |            |                   |       |
| attribute_fk    | Id аттрибута       |            |                   |       |
| attribute_value | Значение аттрибута |            |                   |       | 

- [x] **user**

Значение аттрибута продукта.

| Field           | Name               | Constraint | Level cardinality | Index |
|-----------------|--------------------|------------|-------------------|-------|
| id              | Ключ               |            |                   |       |
| email           | Email              |            |                   |       |
| password_hash   | Хэш пароля         |            |                   |       |
| password_hash   | Хэш пароля         |            |                   |       |

- [x] **contact**

Контакт.

| Field   | Name            | Constraint | Level cardinality | Index |
|---------|-----------------|------------|-------------------|-------|
| id      | Ключ            |            |                   |       |
| user_fk | Id пользователя |            |                   |       |
| name    | Имя             |            |                   |       |
| surname | Фамилия         |            |                   |       |

- [x] **favorite**

Избранное.

| Field      | Name            | Constraint | Level cardinality | Index |
|------------|-----------------|------------|-------------------|-------|
| id         | Ключ            |            |                   |       |
| user_fk    | Id пользователя |            |                   |       |
| product_fk | Id продукта     |            |                   |       |

- [x] **сomparison**

Сравнение.

| Field      | Name            | Constraint | Level cardinality | Index |
|------------|-----------------|------------|-------------------|-------|
| id         | Ключ            |            |                   |       |
| user_fk    | Id пользователя |            |                   |       |
| product_fk | Id продукта     |            |                   |       |

- [x] **address_delivery**

Адрес доставки.

| Field            | Name             | Constraint | Level cardinality | Index |
|------------------|------------------|------------|-------------------|-------|
| id               | Ключ             |            |                   |       |
| user_fk          | Id пользователя  |            |                   |       |
| address          | Адрес            |            |                   |       |
| index            | Индекс           |            |                   |       |
| apartment_number | Номер квартиры   |            |                   |       |
| level            | Этаж             |            |                   |       |
| intercom         | Домофон          |            |                   |       |
| comment          | Комментарий      |            |                   |       |
| name_reciever    | Имя получателя   |            |                   |       |
| phone_reciever   | Номер получателя |            |                   |       |

- [x] **basket**

Корзина.

| Field      | Name            | Constraint | Level cardinality | Index |
|------------|-----------------|------------|-------------------|-------|
| id         | Ключ            |            |                   |       |
| user_fk    | Id пользователя |            |                   |       |

- [x] **basket_product**

Продукт корзины.

| Field      | Name        | Constraint | Level cardinality | Index |
|------------|-------------|------------|-------------------|-------|
| id         | Ключ        |            |                   |       |
| basket_fk  | Id корзины  |            |                   |       |
| product_fk | Id продукта |            |                   |       |
| amount     | Кол-во      |            |                   |       |

- [x] **pickup_point**

Точка самовывоза.

| Field          | Name          | Constraint | Level cardinality | Index |
|----------------|---------------|------------|-------------------|-------|
| id             | Ключ          |            |                   |       |
| address        | Адрес         |            |                   |       |
| delivery_hours | Часы доставки |            |                   |       |

- [x] **order**

Заказ.

| Field             | Name                  | Constraint | Level cardinality | Index |
|-------------------|-----------------------|------------|-------------------|-------|
| id                | Ключ                  |            |                   |       |
| user_fk           | Id пользователя       |            |                   |       |
| delivery_datetime | Дата и время доставки |            |                   |       |
| status            | Статус                |            |                   |       |
| grade             | Оценка                |            |                   |       |

- [x] **order_product**

Продукт заказа.

| Field      | Name        | Constraint | Level cardinality | Index |
|------------|-------------|------------|-------------------|-------|
| id         | Ключ        |            |                   |       |
| order_fk   | Id заказа   |            |                   |       |
| product_fk | Id продукта |            |                   |       |
| price      | Цена        |            |                   |       |
| amount     | Кол-во      |            |                   |       |
| discount   | Скидка      |            |                   |       |
| status     | Статус      |            |                   |       |

- [x] **delivery**

Доставка.

| Field               | Name               | Constraint | Level cardinality | Index |
|---------------------|--------------------|------------|-------------------|-------|
| id                  | Ключ               |            |                   |       |
| order_fk            | Id заказа          |            |                   |       |
| delivery_method     | Метод доставки     |            |                   |       |
| address_delivery_fk | Id адреса доставки |            |                   |       |
| grade               | Оценка             |            |                   |       |

- [x] **refund**

Возврат.

| Field     | Name       | Constraint | Level cardinality | Index |
|-----------|------------|------------|-------------------|-------|
| id        | Ключ       |            |                   |       |
| order_fk  | Id заказа  |            |                   |       |
| status    | Статус     |            |                   |       |
| reason_fk | Id причины |            |                   |       |

- [x] **refund_product**

Продукт возврата.

| Field      | Name        | Constraint | Level cardinality | Index |
|------------|-------------|------------|-------------------|-------|
| id         | Ключ        |            |                   |       |
| refund_fk  | Id возврата |            |                   |       |
| product_fk | Id продукта |            |                   |       |


- [x] **reason**

Причина.

| Field   | Name        | Constraint | Level cardinality | Index |
|---------|-------------|------------|-------------------|-------|
| id      | Ключ        |            |                   |       |
| comment | Комментарий |            |                   |       |

- [x] **gallery_reason**

Причина.

| Field           | Name                 | Constraint | Level cardinality | Index |
|-----------------|----------------------|------------|-------------------|-------|
| id              | Ключ                 |            |                   |       |
| reason_fk       | Id причины           |            |                   |       |
| media_file_link | Ссылка на медиа файл |            |                   |       |
