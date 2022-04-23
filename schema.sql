DROP DATABASE IF EXISTS product_overview;

CREATE DATABASE product_overview;

\c product_overview

DROP TABLE IF EXISTS product CASCADE;

CREATE TABLE product (
  id SERIAL,
  "name" VARCHAR(100),
  slogan VARCHAR(600),
  "description" VARCHAR(600),
  category VARCHAR(50),
  default_price INT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS cart CASCADE;

CREATE TABLE cart (
  cart_id SERIAL,
  user_session INT NOT NULL,
  id INT,
  active INT,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (id)
  REFERENCES product(id)
);

DROP TABLE IF EXISTS feature CASCADE;

CREATE TABLE feature (
  feature_id SERIAL,
  id INT NOT NULL,
  feature VARCHAR(100),
  "value" VARCHAR(100),
  PRIMARY KEY (feature_id),
  FOREIGN KEY (id)
  REFERENCES product(id)
);

DROP TABLE IF EXISTS style CASCADE;

CREATE TABLE style (
  style_id SERIAL,
  id INT NOT NULL,
  "name" VARCHAR(100),
  sale_price INT,
  original_price INT,
  default_style INT,
  PRIMARY KEY (style_id),
  FOREIGN KEY (id)
  REFERENCES product(id)
);

DROP TABLE IF EXISTS photo CASCADE;

CREATE TABLE photo (
  photo_id SERIAL,
  style_id INT NOT NULL,
  "url" VARCHAR NOT NULL,
  thumbnail_url VARCHAR,
  PRIMARY KEY (photo_id),
  FOREIGN KEY (style_id)
  REFERENCES style(style_id)
);

DROP TABLE IF EXISTS sku CASCADE;

CREATE TABLE sku (
  sku_id SERIAL,
  style_id INT NOT NULL,
  size VARCHAR(20),
  quantity VARCHAR(20),
  PRIMARY KEY (sku_id),
  FOREIGN KEY (style_id)
  REFERENCES style(style_id)
);

-- IMPORTING DATA FROM CSV FILES

COPY product(id, name, slogan, description, category, default_price) FROM '/Users/cyntel/Desktop/CSV/product.csv' DELIMITER ',' CSV HEADER;

COPY cart(cart_id, user_session, id, active) FROM '/Users/cyntel/Desktop/CSV/cart.csv' DELIMITER ',' CSV HEADER;

COPY feature(feature_id, id, feature, "value") FROM '/Users/cyntel/Desktop/CSV/features.csv' DELIMITER ',' CSV HEADER;

COPY style(style_id, id, "name", sale_price, original_price, default_style) FROM '/Users/cyntel/Desktop/CSV/styles.csv' DELIMITER ',' CSV HEADER NULL 'null';

COPY photo(photo_id, style_id, url, thumbnail_url) FROM '/Users/cyntel/Desktop/CSV/photos.csv' DELIMITER ',' CSV HEADER;

COPY sku(sku_id, style_id, size, quantity) FROM '/Users/cyntel/Desktop/CSV/skus.csv' DELIMITER ',' CSV HEADER;

