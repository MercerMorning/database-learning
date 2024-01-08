## Схема БД
![schema](/assets/schema.png "schema")

## Примеры бизнес-задач которые решает база
    - Фиксация покупок товаров у определенных поставщиков
    - Ведение наличия определенных товаров у поставщиков
    - Возможность хранить цену товара для каждого поставщика отдельно
    - Возможность делать расчет суммы покупки без привязки к самим товарам. Может быть полезно при расчете скидки
    - Возможность поиска одного продукта в нескольких категориях
    - Возможность отображать покупки конкретных покупателей
    - Создание заказов из корзины с последующим очищением товаров из корзины (которые были заказаны)

## Возможные запросы\отчеты\поиски данных
    - поиск товаров по частичному совпадению названия
    - поиск всех продуктов по названию определенной категории

    - отчет всех покупок пользователя за май месяц
    - отчет цены на один и тот же товар у разных поставщиков, при условии что он есть в наличии
    - отчет списка товаров и цены на него у разных поставщиков
    - отчет покупателей, отсортированный по суммарному счету за все заказы
    - отчет по всем продуктам из заказа

## Таблицы

- [x] **product**

Товар.

| Field       | Name          | Constraint  | Level cardinality | Index |
|-------------|---------------|-------------|-------------------|-------|
| id          | Ключ          | Primary key | high              |       |
| producer_fk | Производитель | NOT NULL    | middle            |       |
| name        | Название      | NOT NULL    | high              | X     |
| description | Описание      |             | high              |       |

- [x] **category**

Категория.

| Field       | Name          | Constraint  | Level cardinality | Index |
|-------------|---------------|-------------|-------------------|-------|
| id          | Ключ          | Primary key | high              |       |
| name        | Название      | NOT NULL    | high              | X     |

- [x] **product_category**

Категория продукта.

| Field       | Name      | Constraint  | Level cardinality | Index |
|-------------|-----------|-------------|-------------------|-------|
| id          | Ключ      | Primary key | high              |       |
| product_fk  | Товар     | NOT NULL    | middle            |       |
| category_fk | Категория | NOT NULL    | middle            |       |

- [x] **producer**

Производитель.

| Field | Name     | Constraint                  | Level cardinality | Index |
|-------|----------|-----------------------------|-------------------|-------|
| id    | Ключ     | Primary key                 | high              |       |
| name  | Название | NOT NULL                    | high              | X     |
| inn   | ИНН      | NOT NULL, LENGTH(INN) == 12 | high              | X     |


- [x] **vendor**

Поставщик.

| Field | Name     | Constraint                  | Level cardinality | Index |
|-------|----------|-----------------------------|-------------------|-------|
| id    | Ключ     | Primary key                 | high              |       |
| name  | Название | NOT NULL                    | high              | X     |
| inn   | ИНН      | NOT NULL, LENGTH(INN) == 12 | high              | X     |

- [x] **vendor_product**

Продукт поставщика.

| Field      | Name       | Constraint  | Level cardinality | Index |
|------------|------------|-------------|-------------------|-------|
| id         | Ключ       | Primary key | high              |       |
| vendor_fk  | Поставщик  | NOT NULL    | middle            | X     |
| product_fk | Товар      | NOT NULL    | middle            | X     |
| price      | Цена       | NOT NULL    |                   | X     |
| amount     | Количество | NOT NULL    |                   |       |


- [x] **sale**

Продажа.

| Field       | Name                  | Constraint  | Level cardinality | Index |
|-------------|-----------------------|-------------|-------------------|-------|
| id          | Ключ                  | Primary key | high              |       |
| customer_fk | Покупатель            | NOT NULL    | middle            | X     |
| total       | Итоговая сумма        | NOT NULL    |                   | X     |
| created_at  | Дата и время создания | NOT NULL    | middle            | X     |

- [x] **sale_product**

Товар продажи.

| Field             | Name              | Constraint  | Level cardinality | Index |
|-------------------|-------------------|-------------|-------------------|-------|
| id                | Ключ              | Primary key | high              |       |
| amount            | Количество товара | NOT NULL    |                   |       |
| total             | Итоговая сумма    | NOT NULL    |                   |       |
| sale_fk           | Продажа           | NOT NULL    | middle            |       |
| vendor_product_fk | Товар поставщика  | NOT NULL    | middle            |       |

- [x] **customer**

Покупатель.

| Field      | Name           | Constraint  | Level cardinality | Index |
|------------|----------------|-------------|-------------------|-------|
| id         | Ключ           | Primary key | high              |       |
| first_name | Имя            | NOT NULL    | middle            |       |
| last_name  | Фамилия        | NOT NULL    | middle            |       |
| phone      | Номер телефона | NOT NULL    | high              |       |



5. Кардинальность полей/описание индексов/ограниченияproduct, price) - составной индекс для ускоренного поиска цен на продукты у поставщиков
    - **customers**
        - поля:
          - id - высокая кардинальность 
          - first_name - средняя кардинальность [not null]
          - second_name - средняя кардинальность [not null]
          - phone - высокая кардинальность [not null, regex ^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$]

## Создание кластера PostgreSQL
    - добавляем файл docker/docker-compose.yml, в котором есть директива postgres ![1](/assets/docker/1.png "1")
    - пользователь для подключения к бд указан в конфиге ![2](/assets/docker/2.png "2")
    - командой docker-compose up поднимаем контейнер с кластером postgres ![3](/assets/docker/3.png "3")
    - с помощью плагина просмотра БД в idea phpstorm подключаемся к postgres ![4](/assets/docker/4.png "4")
    - убеждамся в том что подключение прошло коррекно ![5](/assets/docker/5.png "5")