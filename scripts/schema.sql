-- Создаем таблицы
CREATE SCHEMA IF NOT EXISTS ozon;

-- Создание таблицы "basket"
CREATE TABLE IF NOT EXISTS ozon.basket (
                                           id SERIAL PRIMARY KEY
);

-- Пример создания таблицы "user"
CREATE TABLE IF NOT EXISTS ozon."user" (
                                           id SERIAL PRIMARY KEY,
                                           email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    basket_fk INTEGER REFERENCES ozon.basket(id)
    -- Определите остальные поля согласно вашим требованиям
    );

CREATE TABLE IF NOT EXISTS ozon.type (
                                         id SERIAL PRIMARY KEY,
                                         name VARCHAR(255) NOT NULL,
    CONSTRAINT type_name_unique UNIQUE (name)
    );

CREATE TABLE IF NOT EXISTS ozon.brand (
                                          id SERIAL PRIMARY KEY,
                                          name VARCHAR(255) NOT NULL,
    CONSTRAINT brand_name_unique UNIQUE (name)
    );

CREATE TABLE IF NOT EXISTS ozon.seller (
                                           id SERIAL PRIMARY KEY,
                                           name VARCHAR(255) NOT NULL,
    CONSTRAINT seller_name_unique UNIQUE (name)
    );

CREATE TABLE IF NOT EXISTS ozon.product (
                                            id SERIAL PRIMARY KEY,
                                            name VARCHAR(255) NOT NULL,
    type_fk INTEGER REFERENCES ozon.type(id),
    seller_fk INTEGER REFERENCES ozon.seller(id),
    brand_fk INTEGER REFERENCES ozon.brand(id),
    protein_count NUMERIC CHECK (protein_count >= 0),
    fat_count NUMERIC CHECK (fat_count >= 0),
    carbohydrate_count NUMERIC CHECK (carbohydrate_count >= 0),
    amount INTEGER CHECK (amount >= 0),
    description TEXT,
    storage_conditions TEXT,
    composition TEXT,
    price NUMERIC CHECK (price >= 0),
    discount NUMERIC CHECK (discount >= 0)
    );

CREATE TABLE IF NOT EXISTS ozon.review (
                                           id SERIAL PRIMARY KEY,
                                           user_fk INTEGER REFERENCES ozon.user(id),
    rating INTEGER CHECK (rating > 0 AND rating <= 5),
    dignities TEXT,
    flaws TEXT,
    comment TEXT,
    like_count INTEGER CHECK (like_count >= 0),
    dislike_count INTEGER CHECK (dislike_count >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE
    );

CREATE TABLE IF NOT EXISTS ozon.review_product (
                                                   id SERIAL PRIMARY KEY,
                                                   product_fk INTEGER REFERENCES ozon.product(id),
    review_fk INTEGER REFERENCES ozon.review(id)
    );

-- Продолжите создание остальных таблиц по аналогии

-- Не забудьте создать таблицы, которые являются предпосылками для внешних ключей
-- например, user, attribute, rule, promotion, tag, basket, order, address_delivery, question, answer, refund, reason и т.д.

-- Создание таблицы "type"
CREATE TABLE IF NOT EXISTS ozon.type (
                                         id SERIAL PRIMARY KEY,
                                         name VARCHAR(255) NOT NULL UNIQUE
    );

-- Создание таблицы "brand"
CREATE TABLE IF NOT EXISTS ozon.brand (
                                          id SERIAL PRIMARY KEY,
                                          name VARCHAR(255) NOT NULL UNIQUE
    );

-- Создание таблицы "seller"
CREATE TABLE IF NOT EXISTS ozon.seller (
                                           id SERIAL PRIMARY KEY,
                                           name VARCHAR(255) NOT NULL UNIQUE
    );

-- Создание таблицы "product"
CREATE TABLE IF NOT EXISTS ozon.product (
                                            id SERIAL PRIMARY KEY,
                                            name VARCHAR(255) NOT NULL,
    type_fk INTEGER REFERENCES ozon.type(id),
    seller_fk INTEGER REFERENCES ozon.seller(id),
    brand_fk INTEGER REFERENCES ozon.brand(id),
    protein_count DECIMAL CHECK (protein_count >= 0),
    fat_count DECIMAL CHECK (fat_count >= 0),
    carbohydrate_count DECIMAL CHECK (carbohydrate_count >= 0),
    amount INTEGER CHECK (amount >= 0),
    description TEXT,
    storage_conditions TEXT,
    composition TEXT,
    price DECIMAL CHECK (price >= 0),
    discount DECIMAL CHECK (discount >= 0)
    );

-- Продолжение создания оставшихся таблиц...

-- Обратите внимание, что для упрощения я опустил создание некоторых таблиц,
-- таких как "user", "review", "gallery_review" и др., которые требуются для полного выполнения запроса.
-- Вы должны создать эти таблицы, прежде чем сможете установить внешние ключи, ссылающиеся на них.


-- И так далее для каждой таблицы, упомянутой в вашем запросе, учитывая все внешние ключи и ограничения.

-- Создание таблицы "attribute"
CREATE TABLE IF NOT EXISTS ozon.attribute (
                                              id SERIAL PRIMARY KEY,
                                              name VARCHAR(255) NOT NULL UNIQUE
    );

-- Создание таблицы "rule"
CREATE TABLE IF NOT EXISTS ozon.rule (
                                         id SERIAL PRIMARY KEY,
                                         type VARCHAR(255) CHECK (type IN ('radio', 'select', 'text', 'int', 'float'))
    );

-- Создание таблицы "attribute_type"
CREATE TABLE IF NOT EXISTS ozon.attribute_type (
                                                   id SERIAL PRIMARY KEY,
                                                   type_fk INTEGER REFERENCES ozon.type(id),
    attribute_fk INTEGER REFERENCES ozon.attribute(id)
    );

-- Создание таблицы "promotion"
CREATE TABLE IF NOT EXISTS ozon.promotion (
                                              id SERIAL PRIMARY KEY,
                                              name VARCHAR(255) NOT NULL UNIQUE
    );

-- Создание таблицы "tag"
CREATE TABLE IF NOT EXISTS ozon.tag (
                                        id SERIAL PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL UNIQUE,
    media_file_link TEXT CHECK (media_file_link ~* '^https?://.*')
    );

-- Создание таблицы "gallery_product"
CREATE TABLE IF NOT EXISTS ozon.gallery_product (
                                                    id SERIAL PRIMARY KEY,
                                                    product_fk INTEGER REFERENCES ozon.product(id),
    attribute_fk INTEGER REFERENCES ozon.attribute(id),
    media_file_link TEXT CHECK (media_file_link ~* '^https?://.*')
    );

-- Создание таблицы "product_attribute"
CREATE TABLE IF NOT EXISTS ozon.product_attribute (
                                                      id SERIAL PRIMARY KEY,
                                                      product_fk INTEGER REFERENCES ozon.product(id),
    attribute_fk INTEGER REFERENCES ozon.attribute(id)
    );

-- Создание таблицы "product_attribute_value"
CREATE TABLE IF NOT EXISTS ozon.product_attribute_value (
                                                            id SERIAL PRIMARY KEY,
                                                            product_fk INTEGER REFERENCES ozon.product(id),
    attribute_fk INTEGER REFERENCES ozon.attribute(id),
    attribute_value VARCHAR(255) NOT NULL
    );

-- Создание таблицы "review"
-- Предполагается, что таблица "user" уже создана
CREATE TABLE IF NOT EXISTS ozon.review (
                                           id SERIAL PRIMARY KEY,
                                           user_fk INTEGER REFERENCES ozon."user"(id),
    rating INTEGER CHECK (rating > 0 AND rating <= 5),
    dignities TEXT,
    flaws TEXT,
    comment TEXT,
    like_count INTEGER CHECK (like_count >= 0),
    dislike_count INTEGER CHECK (dislike_count >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );

-- Создание таблицы "gallery_review"
CREATE TABLE IF NOT EXISTS ozon.gallery_review (
                                                   id SERIAL PRIMARY KEY,
                                                   review_fk INTEGER REFERENCES ozon.review(id),
    priority INTEGER
    );

-- Создание таблицы "answer"
-- Обратите внимание, что для упрощения я повторно использовал имя таблицы "answer" для разных целей,
-- вам потребуется переименовать одну из таблиц, чтобы избежать конфликта имен.
CREATE TABLE IF NOT EXISTS ozon.answer (
                                           id SERIAL PRIMARY KEY,
                                           user_fk INTEGER REFERENCES ozon."user"(id),
    content TEXT,
    like_count INTEGER CHECK (like_count >= 0),
    dislike_count INTEGER CHECK (dislike_count >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );

-- Продолжение создания таблиц для "question", "basket", "order", и т.д.
-- В зависимости от ваших потребностей, вы можете добавить дополнительные таблицы и настройки.

-- Обратите внимание на необходимость создания таблицы "user", "basket" и других таблиц,
-- которые были упомянуты как ссылки в определениях таблиц, но не были полностью определены здесь.

-- Создание таблицы "question"
CREATE TABLE IF NOT EXISTS ozon.question (
                                             id SERIAL PRIMARY KEY,
                                             user_fk INTEGER REFERENCES ozon."user"(id),
    like_count INTEGER CHECK (like_count >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );

-- Создание таблицы "basket_product"
CREATE TABLE IF NOT EXISTS ozon.basket_product (
                                                   id SERIAL PRIMARY KEY,
                                                   basket_fk INTEGER REFERENCES ozon.basket(id),
    product_fk INTEGER REFERENCES ozon.product(id),
    amount INTEGER CHECK (amount >= 0)
    );

-- Создание таблицы "order"
CREATE TABLE IF NOT EXISTS ozon."order" (
                                            id SERIAL PRIMARY KEY,
                                            serial_number VARCHAR(255) NOT NULL,
    user_fk INTEGER REFERENCES ozon."user"(id),
    delivery_datetime TIMESTAMP WITHOUT TIME ZONE,
    status VARCHAR(255) CHECK (status IN ('ON_WAY', 'DELIVERED', 'WAIT_CONFIRM')),
    grade INTEGER CHECK (grade >= 0 AND grade <= 5),
    name_reciever VARCHAR(255),
    phone_reciever VARCHAR(255) CHECK (phone_reciever ~* '^\(\d{3}\) \d{3}-\d{4}$')
    );

-- Создание таблицы "order_product"
CREATE TABLE IF NOT EXISTS ozon.order_product (
                                                  id SERIAL PRIMARY KEY,
                                                  order_fk INTEGER REFERENCES ozon."order"(id),
    product_fk INTEGER REFERENCES ozon.product(id),
    price DECIMAL CHECK (price >= 0),
    amount INTEGER CHECK (amount >= 0),
    discount DECIMAL CHECK (discount >= 0),
    status VARCHAR(255) CHECK (status IN ('ON_WAY', 'DELIVERED', 'WAIT_CONFIRM'))
    );

-- Создание таблицы "address_delivery"
CREATE TABLE IF NOT EXISTS ozon.address_delivery (
                                                     id SERIAL PRIMARY KEY,
                                                     user_fk INTEGER REFERENCES ozon."user"(id),
    address TEXT NOT NULL,
    index VARCHAR(255),
    apartment_number INTEGER,
    level INTEGER CHECK (level > 0 AND level <= 100),
    intercom VARCHAR(255),
    comment TEXT
    );

-- Создание таблицы "delivery"
CREATE TABLE IF NOT EXISTS ozon.delivery (
                                             id SERIAL PRIMARY KEY,
                                             order_fk INTEGER REFERENCES ozon."order"(id),
    delivery_method VARCHAR(255) CHECK (delivery_method IN ('COURIER', 'PICKUP_POINT')),
    address_delivery_fk INTEGER REFERENCES ozon.address_delivery(id),
    grade INTEGER CHECK (grade >= 0 AND grade <= 5)
    );

-- Создание таблицы "refund"
CREATE TABLE IF NOT EXISTS ozon.refund (
                                           id SERIAL PRIMARY KEY,
                                           order_fk INTEGER REFERENCES ozon."order"(id),
    status VARCHAR(255) CHECK (status IN ('CONFIRMED', 'WAIT', 'REFUSED')),
    reason_fk INTEGER
    );

-- Обратите внимание на ссылку на таблицу "reason" в "refund", таблица "reason" должна быть создана

-- Создание таблицы "reason"
CREATE TABLE IF NOT EXISTS ozon.reason (
                                           id SERIAL PRIMARY KEY,
                                           comment TEXT
);

-- Создание таблицы "refund_product"
CREATE TABLE IF NOT EXISTS ozon.refund_product (
                                                   id SERIAL PRIMARY KEY,
                                                   refund_fk INTEGER REFERENCES ozon.refund(id),
    product_fk INTEGER REFERENCES ozon.product(id)
    );

-- Создание таблицы "pickup_point"
CREATE TABLE IF NOT EXISTS ozon.pickup_point (
                                                 id SERIAL PRIMARY KEY,
                                                 address TEXT NOT NULL,
                                                 delivery_hours VARCHAR(255) CHECK (delivery_hours ~* '^\d{2}:\d{2} - \d{2}:\d{2}$')
    );

-- Обратите внимание, что для создания таблицы "user", необходимо предварительно создать таблицу "basket",
-- так как в "user" есть ссылка на "basket". Данное условие уже учтено в предыдущем коде.
-- Создание таблицы "gallery_review"
CREATE TABLE IF NOT EXISTS ozon.gallery_review (
                                                   id SERIAL PRIMARY KEY,
                                                   review_fk INTEGER REFERENCES ozon.review(id),
    media_file_link TEXT CHECK (media_file_link ~* '^https?://.*'),
    priority INTEGER
    );

-- Создание таблицы "tag_product"
CREATE TABLE IF NOT EXISTS ozon.tag_product (
                                                id SERIAL PRIMARY KEY,
                                                product_fk INTEGER REFERENCES ozon.product(id),
    tag_fk INTEGER REFERENCES ozon.tag(id)
    );

-- Создание таблицы "promotion_product"
CREATE TABLE IF NOT EXISTS ozon.promotion_product (
                                                      id SERIAL PRIMARY KEY,
                                                      product_fk INTEGER REFERENCES ozon.product(id),
    promotion_fk INTEGER REFERENCES ozon.promotion(id)
    );

-- Создание таблицы "gallery_product"
CREATE TABLE IF NOT EXISTS ozon.gallery_product (
                                                    id SERIAL PRIMARY KEY,
                                                    product_fk INTEGER REFERENCES ozon.product(id),
    media_file_link TEXT CHECK (media_file_link ~* '^https?://.*'),
    priority INTEGER
    );

-- Создание таблицы "favorite"
CREATE TABLE IF NOT EXISTS ozon.favorite (
                                             id SERIAL PRIMARY KEY,
                                             user_fk INTEGER REFERENCES ozon."user"(id),
    product_fk INTEGER REFERENCES ozon.product(id)
    );

-- Создание таблицы "comparison"
CREATE TABLE IF NOT EXISTS ozon.comparison (
                                               id SERIAL PRIMARY KEY,
                                               user_fk INTEGER REFERENCES ozon."user"(id),
    product_fk INTEGER REFERENCES ozon.product(id)
    );

-- Создание таблицы "gallery_reason"
CREATE TABLE IF NOT EXISTS ozon.gallery_reason (
                                                   id SERIAL PRIMARY KEY,
                                                   reason_fk INTEGER REFERENCES ozon.reason(id),
    media_file_link TEXT CHECK (media_file_link ~* '^https?://.*')
    );

-- Создание таблицы "contact"
CREATE TABLE IF NOT EXISTS ozon.contact (
                                            id SERIAL PRIMARY KEY,
                                            user_fk INTEGER REFERENCES ozon."user"(id),
    name VARCHAR(255),
    surname VARCHAR(255)
    );

-- Создание таблицы "address_delivery" уже была создана, но убедитесь в правильности и полноте всех полей

-- Создание таблицы "answer_review"
-- Обратите внимание, что в предыдущем коде была таблица "answer". Если она предназначалась для ответов на отзывы,
-- тогда дополнительная таблица "answer_review" не требуется. Если же "answer" использовалась для других целей, следует уточнить структуру.

-- Для дополнительной таблицы "answer_review", которая не была указана в исходном запросе, но предполагается для связи ответов и отзывов:
CREATE TABLE IF NOT EXISTS ozon.answer_review (
                                                  id SERIAL PRIMARY KEY,
                                                  review_fk INTEGER REFERENCES ozon.review(id),
    answer_fk INTEGER REFERENCES ozon.answer(id)
    );

-- Создание таблицы "question_product"
-- Эта таблица предназначена для связи вопросов и продуктов, позволяя задавать вопросы по конкретным товарам
CREATE TABLE IF NOT EXISTS ozon.question_product (
                                                     id SERIAL PRIMARY KEY,
                                                     product_fk INTEGER REFERENCES ozon.product(id),
    question_fk INTEGER REFERENCES ozon.question(id)
    );

-- Создание таблицы "answer_question"
-- Предполагая, что ответы могут быть даны не только на отзывы, но и на вопросы пользователей о продуктах
CREATE TABLE IF NOT EXISTS ozon.answer_question (
                                                    id SERIAL PRIMARY KEY,
                                                    question_fk INTEGER REFERENCES ozon.question(id),
    answer_fk INTEGER REFERENCES ozon.answer(id)
    );

-- Создание таблицы "user_contact"
-- Дополнительная таблица для хранения контактной информации пользователя, если требуется отделить ее от основной таблицы пользователя
CREATE TABLE IF NOT EXISTS ozon.user_contact (
                                                 id SERIAL PRIMARY KEY,
                                                 user_fk INTEGER REFERENCES ozon."user"(id),
    contact_type VARCHAR(255),
    contact_value VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE
    );

-- Проверка на наличие таблицы "user"
-- Убедимся, что таблица "user" учтена с уникальным email и связью с корзиной
-- В предыдущих шагах таблица "user" была упомянута, но давайте подтвердим наличие необходимых полей
CREATE TABLE IF NOT EXISTS ozon."user" (
                                           id SERIAL PRIMARY KEY,
                                           email VARCHAR(255) NOT NULL UNIQUE CHECK (email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    password_hash TEXT NOT NULL,
    basket_fk INTEGER REFERENCES ozon.basket(id)
    );

-- Добавление индексов для оптимизации запросов
-- Например, создание индекса для часто используемых полей может значительно ускорить выборку данных
CREATE INDEX idx_product_name ON ozon.product(name);
CREATE INDEX idx_product_type ON ozon.product(type_fk);
CREATE INDEX idx_review_product ON ozon.review_product(product_fk);
CREATE INDEX idx_question_product ON ozon.question_product(product_fk);

-- Помните, что индексы следует создавать осознанно, так как они ускоряют чтение данных, но могут замедлить операции записи.

ALTER TABLE ozon.product ADD COLUMN tsvector_product_name__brand_name tsvector;

CREATE INDEX search_index_product_name__brand_name on ozon.product USING GIN (tsvector_product_name__brand_name);

CREATE FUNCTION product_trigger() RETURNS trigger AS $$
BEGIN
    NEW.tsvector_product_name__brand_name :=
        to_tsvector('english', NEW.name || ' ' || (select name from ozon.brand where id = NEW.brand_fk LIMIT 1));
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
                                                   ON ozon.product FOR EACH ROW EXECUTE FUNCTION product_trigger();

