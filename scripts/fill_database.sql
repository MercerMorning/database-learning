-- Заполнение таблицы user и basket
INSERT INTO ozon.basket (id) VALUES (1), (2), (3);

INSERT INTO ozon.user (email, password_hash, basket_fk) VALUES
                                                            ('user1@example.com', 'hash1', 1),
                                                            ('user2@example.com', 'hash2', 2),
                                                            ('user3@example.com', 'hash3', 3);

-- Заполнение таблицы type, seller и brand
INSERT INTO ozon.type (name) VALUES ('Electronics'), ('Clothing'), ('Groceries');

INSERT INTO ozon.seller (name) VALUES ('ElectroShop'), ('FashionStore'), ('FoodMarket');

INSERT INTO ozon.brand (name) VALUES ('ElectroBrand'), ('FashionBrand'), ('FoodBrand');

-- Заполнение таблицы product
INSERT INTO ozon.product (name, type_fk, seller_fk, brand_fk, protein_count, fat_count, carbohydrate_count, amount, description, storage_conditions, composition, price, discount) VALUES
                                                                                                                                                                                       ('Smartphone', 1, 1, 1, 0, 0, 0, 30, 'Latest model smartphone with high performance', 'Store at room temperature', 'Electronics', 500.00, 0.10),
                                                                                                                                                                                       ('Jeans', 2, 2, 2, 0, 0, 0, 50, 'Comfortable blue jeans', 'Keep dry and avoid direct sunlight', 'Denim', 40.00, 0.05),
                                                                                                                                                                                       ('Organic Milk', 3, 3, 3, 3.4, 3.6, 4.7, 100, 'Fresh organic milk from local farms', 'Keep refrigerated', 'Milk', 2.50, 0.00);

-- Заполнение таблицы review и review_product
INSERT INTO ozon.review (user_fk, rating, dignities, flaws, comment, like_count, dislike_count, created_at) VALUES
    (1, 5, 'Excellent camera quality', 'Expensive', 'Best phone I have ever used!', 100, 2, '2023-01-01 12:00:00');

INSERT INTO ozon.review_product (product_fk, review_fk) VALUES (1, 1);

-- Заполнение таблицы question, question_product
INSERT INTO ozon.question (user_fk, like_count, created_at) VALUES (2, 10, '2023-01-02 14:00:00');

INSERT INTO ozon.question_product (product_fk, question_fk) VALUES (1, 1);

-- Заполнение таблицы tag, tag_product
INSERT INTO ozon.tag (name, media_file_link) VALUES ('Trending', 'http://image.jpg');

INSERT INTO ozon.tag_product (product_fk, tag_fk) VALUES (1, 1);

-- Заполнение таблицы promotion, promotion_product
INSERT INTO ozon.promotion (name) VALUES ('Winter Sale');

INSERT INTO ozon.promotion_product (product_fk, promotion_fk) VALUES (1, 1);

-- Дополнительные таблицы, такие как attribute и product_attribute, могут быть заполнены по аналогичному принципу
-- Заполнение таблицы attribute, attribute_type, product_attribute, product_attribute_value
INSERT INTO ozon.attribute (name) VALUES ('Color'), ('Size'), ('Weight');

INSERT INTO ozon.attribute_type (type_fk, attribute_fk) VALUES
                                                            (1, 1), -- Electronics: Color
                                                            (2, 2), -- Clothing: Size
                                                            (3, 3); -- Groceries: Weight

INSERT INTO ozon.product_attribute (product_fk, attribute_fk) VALUES
                                                                  (1, 1),
                                                                  (2, 2),
                                                                  (3, 3);

INSERT INTO ozon.product_attribute_value (product_fk, attribute_fk, attribute_value) VALUES
                                                                                         (1, 1, 'Black'),
                                                                                         (2, 2, 'Medium'),
                                                                                         (3, 3, '500 grams');

-- Заполнение таблицы address_delivery для пользователей
INSERT INTO ozon.address_delivery (user_fk, address, index, apartment_number, level, intercom, comment) VALUES
                                                                                                            (1, '1234 Main St, Anytown, AT 12345', '12345', 101, 10, '1234', 'Leave at front door'),
                                                                                                            (2, '5678 Second St, Othertown, OT 67890', '67890', 202, 20, '5678', 'Call upon arrival');

-- Заполнение таблицы order, order_product
INSERT INTO ozon.order (serial_number, user_fk, delivery_datetime, status, grade) VALUES
                                                                                      ('ORD001', 1, '2023-04-01 09:00:00', 'ON_WAY', 5),
                                                                                      ('ORD002', 2, '2023-04-02 10:00:00', 'ON_WAY', 4);

INSERT INTO ozon.order_product (order_fk, product_fk, price, amount, discount, status) VALUES
                                                                                           (1, 1, 500.00, 1, 0.10, 'ON_WAY'),
                                                                                           (2, 2, 40.00, 2, 0.05, 'ON_WAY');

-- Заполнение таблицы delivery
INSERT INTO ozon.delivery (order_fk, delivery_method, address_delivery_fk, grade) VALUES
                                                                                      (1, 'COURIER', 1, 5),
                                                                                      (2, 'COURIER', 2, 4);

-- Заполнение таблицы refund, refund_product, reason
INSERT INTO ozon.reason (comment) VALUES ('Damaged item'), ('Incorrect item');

INSERT INTO ozon.refund (order_fk, status, reason_fk) VALUES
                                                          (1, 'CONFIRMED', 1),
                                                          (2, 'CONFIRMED', 2);

INSERT INTO ozon.refund_product (refund_fk, product_fk) VALUES
                                                            (1, 1),
                                                            (2, 2);

-- Заполнение таблицы gallery_product
INSERT INTO ozon.gallery_product (product_fk, attribute_fk, media_file_link) VALUES
                                                                                 (1, 1, 'http://image.jpg'),
                                                                                 (2, 2, 'http://image.jpg');

-- Заполнение таблицы contact
INSERT INTO ozon.contact (user_fk, name, surname) VALUES
                                                      (1, 'John', 'Doe'),
                                                      (2, 'Jane', 'Smith');

-- Заполнение таблицы pickup_point
INSERT INTO ozon.pickup_point (address, delivery_hours) VALUES
                                                            ('789 Third St, Thirdtown, TT 34567', '09:00 - 19:00'),
                                                            ('234 Fourth St, Fourthtown, FT 45678', '10:00 - 20:00');

-- Заполнение таблицы favorite и comparison
INSERT INTO ozon.favorite (user_fk, product_fk) VALUES
                                                    (1, 1),
                                                    (2, 2);

INSERT INTO ozon.comparison (user_fk, product_fk) VALUES
                                                      (1, 3),
                                                      (2, 1);

-- Заполнение таблицы rule и filling_attribute_rule
INSERT INTO ozon.rule (type) VALUES ('radio'), ('radio');

-- INSERT INTO ozon.filling_attribute_rule (attribute_fk, rule_fk) VALUES
--                                                                     (1, 1),
--                                                                     (2, 2);

-- Заполнение таблицы gallery_review и gallery_reason
INSERT INTO ozon.gallery_review (review_fk, priority) VALUES
    (1, 1);

INSERT INTO ozon.gallery_reason (reason_fk, media_file_link) VALUES
    (1, 'http://image.jpg');

-- Заполнение таблицы answer, answer_review
-- INSERT INTO ozon.answer (user_fk, question_fk, content, like_count, dislike_count, created_at) VALUES
--     (2, 1, 'Yes, this model supports 4K.', 5, 0, '2023-04-15');

-- INSERT INTO ozon.answer_review (review_fk, answer_fk) VALUES
--     (1, 1);

-- Заполнение таблицы basket_product
INSERT INTO ozon.basket_product (basket_fk, product_fk, amount) VALUES
                                                                    (1, 1, 1),
                                                                    (1, 2, 2);

-- Заполнение таблицы question_product
INSERT INTO ozon.question_product (product_fk, question_fk) VALUES
    (1, 1);

-- Последние добавления для создания полного набора тестовых данных
-- Это поможет в тестировании различных функций и запросов в вашей базе данных

-- Заполнение таблицы order_product
INSERT INTO ozon.order_product (order_fk, product_fk, price, amount, discount, status) VALUES
                                                                                           (1, 3, 2.50, 3, 0.00, 'ON_WAY'),
                                                                                           (2, 1, 500.00, 1, 0.10, 'ON_WAY');

-- Заполнение таблицы delivery
INSERT INTO ozon.delivery (order_fk, delivery_method, address_delivery_fk, grade) VALUES
                                                                                      (1, 'COURIER', 1, 5),
                                                                                      (2, 'COURIER', 2, 4);

-- Заполнение таблицы refund, refund_product, reason
INSERT INTO ozon.reason (comment) VALUES ('Delayed delivery'), ('Changed mind');

INSERT INTO ozon.refund (order_fk, status, reason_fk) VALUES
                                                          (1, 'CONFIRMED', 1),
                                                          (2, 'CONFIRMED', 2);

INSERT INTO ozon.refund_product (refund_fk, product_fk) VALUES
                                                            (1, 3),
                                                            (2, 1);

-- Заполнение таблицы gallery_product
INSERT INTO ozon.gallery_product (product_fk, attribute_fk, media_file_link) VALUES
                                                                                 (1, 1, 'http://image.jpg'),
                                                                                 (2, 2, 'http://image.jpg'),
                                                                                 (3, 3, 'http://image.jpg');

-- Заполнение таблицы contact
INSERT INTO ozon.contact (user_fk, name, surname) VALUES
                                                      (3, 'Alice', 'Johnson'),
                                                      (3, 'Bob', 'Williams');

-- Последние добавления для создания полного набора тестовых данных

-- Заполнение таблицы refund
INSERT INTO ozon.refund (order_fk, status, reason_fk) VALUES
                                                          (1, 'CONFIRMED', 2),
                                                          (2, 'CONFIRMED', 1);

-- Заполнение таблицы gallery_reason
INSERT INTO ozon.gallery_reason (reason_fk, media_file_link) VALUES
                                                                 (2, 'http://image.jpg'),
                                                                 (1, 'http://image.jpg');

-- Заполнение таблицы basket_product
INSERT INTO ozon.basket_product (basket_fk, product_fk, amount) VALUES
                                                                    (2, 3, 2),
                                                                    (3, 1, 1),
                                                                    (3, 2, 1);

-- Заполнение таблицы question_product
-- INSERT INTO ozon.question_product (product_fk, question_fk) VALUES
--                                                                 (2, 2),
--                                                                 (3, 3);

-- Заполнение таблицы pickup_point
INSERT INTO ozon.pickup_point (address, delivery_hours) VALUES
                                                            ('123 Main St, City, CZ 12345', '09:00 - 18:00'),
                                                            ('456 Elm St, Town, TZ 56789', '10:00 - 20:00');

-- Последние добавления данных для завершения набора тестовых данных

-- Заполнение таблицы answer
-- INSERT INTO ozon.answer (user_fk, question_fk, content, like_count, dislike_count, created_at) VALUES
--     (3, 2, 'Yes, this book is available in hardcover edition.', 8, 1, '2023-05-01 09:00:00');

-- Заполнение таблицы answer_review
-- INSERT INTO ozon.answer_review (review_fk, answer_fk) VALUES
--     (1, 1);
--
-- -- Заполнение таблицы gallery_review
-- INSERT INTO ozon.gallery_review (review_fk, priority) VALUES
--     (1, 1);

-- Заполнение таблицы address_delivery
INSERT INTO ozon.address_delivery (user_fk, address, index, apartment_number, level, intercom, comment) VALUES
    (3, '789 Oak St, Village, VZ 78901', '78901', 303, 30, '7890', 'Leave at back door');

-- Завершение добавления данных для всех таблиц

-- Заполнение таблицы order_product
INSERT INTO ozon.order_product (order_fk, product_fk, price, amount, discount, status) VALUES
                                                                                           (1, 3, 2.50, 3, 0.00, 'ON_WAY'),
                                                                                           (2, 1, 500.00, 1, 0.10, 'ON_WAY');

-- Заполнение таблицы delivery
INSERT INTO ozon.delivery (order_fk, delivery_method, address_delivery_fk, grade) VALUES
                                                                                      (1, 'COURIER', 1, 5),
                                                                                      (2, 'COURIER', 2, 4);

-- Заполнение таблицы refund, refund_product, reason
INSERT INTO ozon.reason (comment) VALUES ('Delayed delivery'), ('Changed mind');

INSERT INTO ozon.refund (order_fk, status, reason_fk) VALUES
                                                          (1, 'CONFIRMED', 1),
                                                          (2, 'CONFIRMED', 2);

INSERT INTO ozon.refund_product (refund_fk, product_fk) VALUES
                                                            (1, 3),
                                                            (2, 1);

-- Заполнение таблицы gallery_product
INSERT INTO ozon.gallery_product (product_fk, attribute_fk, media_file_link) VALUES
                                                                                 (1, 1, 'http://image.jpg'),
                                                                                 (2, 2, 'http://image.jpg'),
                                                                                 (3, 3, 'http://image.jpg');

-- Заполнение таблицы contact
INSERT INTO ozon.contact (user_fk, name, surname) VALUES
                                                      (3, 'Alice', 'Johnson'),
                                                      (3, 'Bob', 'Williams');

-- Последние добавления для создания полного набора тестовых данных


-- -- Заполнение таблицы refund_reason
-- INSERT INTO ozon.refund_reason (refund_fk, reason_fk) VALUES
--                                                           (1, 2),
--                                                           (2, 1);
--
-- -- Заполнение таблицы favorite_product
-- INSERT INTO ozon.favorite_product (user_fk, product_fk) VALUES
--                                                             (1, 2),
--                                                             (3, 1);
--
-- -- Заполнение таблицы comparison_product
-- INSERT INTO ozon.comparison_product (user_fk, product_fk) VALUES
--                                                               (1, 3),
--                                                               (3, 2);


-- Заполнение таблицы filling_attribute_rule
-- INSERT INTO ozon.filling_attribute_rule (attribute_fk, rule_fk) VALUES
--                                                                     (1, 1),
--                                                                     (2, 2),
--                                                                     (3, 1);

-- Завершение добавления данных для всех таблиц


-- Заполнение таблицы attribute_value
-- INSERT INTO ozon.attribute_value (attribute_fk, value) VALUES
--                                                            (1, 'Black'),
--                                                            (2, 'Large'),
--                                                            (3, '700 grams');

-- Заполнение таблицы product_attribute_value
-- INSERT INTO ozon.product_attribute_value (product_fk, attribute_fk, value_fk) VALUES
--                                                                                   (1, 1, 1),
--                                                                                   (2, 2, 2),
--                                                                                   (3, 3, 3);

-- Завершение добавления данных для всех таблиц


-- INSERT INTO ozon.media_file (link) VALUES
--                                        ('link_to_image_1'),
--                                        ('link_to_image_2'),
--                                        ('link_to_image_3');
--
-- -- Заполнение таблицы media_file_link
-- INSERT INTO ozon.media_file_link (product_fk, media_file_fk) VALUES
--                                                                  (1, 1),
--                                                                  (2, 2),
--                                                                  (3, 3);
--
-- -- Завершение добавления данных для всех таблиц
--
-- -- Заполнение таблицы gallery_reason_link
-- INSERT INTO ozon.gallery_reason_link (reason_fk, media_file_fk) VALUES
--                                                                     (1, 1),
--                                                                     (2, 2);

-- Завершение добавления данных для всех таблиц
