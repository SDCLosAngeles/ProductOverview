-- DROP DATABASE IF EXISTS product_overview;

-- CREATE DATABASE product_overview;

DROP TABLE IF EXISTS product CASCADE;

CREATE TABLE product (
  product_id INT NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  slogan VARCHAR(600) NOT NULL,
  "description" VARCHAR(600) NOT NULL,
  category VARCHAR(50) NOT NULL,
  default_price INT NOT NULL,
  PRIMARY KEY (product_id)
);

DROP TABLE IF EXISTS cart CASCADE;

CREATE TABLE cart (
  cart_id INT NOT NULL,
  user_session INT NOT NULL,
  product_id INT NOT NULL,
  active INT NOT NULL,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (product_id)
  REFERENCES product(product_id)
);

DROP TABLE IF EXISTS feature CASCADE;

CREATE TABLE feature (
  feature_id INT NOT NULL,
  product_id INT NOT NULL,
  feature VARCHAR(100) NOT NULL,
  "value" VARCHAR(100) NOT NULL,
  PRIMARY KEY (feature_id),
  FOREIGN KEY (product_id)
  REFERENCES product(product_id)
);

DROP TABLE IF EXISTS style CASCADE;

CREATE TABLE style (
  style_id INT NOT NULL,
  product_id INT NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  sale_price INT,
  original_price INT,
  default_style INT,
  PRIMARY KEY (style_id),
  FOREIGN KEY (product_id)
  REFERENCES product(product_id)
);

DROP TABLE IF EXISTS photo CASCADE;

CREATE TABLE photo (
  photo_id INT NOT NULL,
  style_id INT NOT NULL,
  "url" VARCHAR NOT NULL,
  thumbnail_url VARCHAR NOT NULL,
  PRIMARY KEY (photo_id),
  FOREIGN KEY (style_id)
  REFERENCES style(style_id)
);

DROP TABLE IF EXISTS sku CASCADE;

CREATE TABLE sku (
  sku_id INT NOT NULL,
  style_id INT NOT NULL,
  size VARCHAR(20) NOT NULL,
  quantity VARCHAR(20) NOT NULL,
  PRIMARY KEY (sku_id),
  FOREIGN KEY (style_id)
  REFERENCES style(style_id)
);

-- IMPORTING DATA FROM CSV FILES

-- COPY product(product_id, name, slogan, description, category, default_price) FROM '/Users/cyntel/Desktop/CSV/product.csv' DELIMITER ',' CSV HEADER;

-- COPY cart(cart_id, user_session, product_id, active) FROM '/Users/cyntel/Desktop/CSV/cart.csv' DELIMITER ',' CSV HEADER;

-- COPY feature(feature_id, product_id, feature, "value") FROM '/Users/cyntel/Desktop/CSV/features.csv' DELIMITER ',' CSV HEADER;

-- COPY photo(photo_id, style_id, url, thumbnail_url) FROM '/Users/cyntel/Desktop/CSV/photos.csv' DELIMITER ',' CSV HEADER;

-- COPY sku(sku_id, style_id, size, quantity) FROM '/Users/cyntel/Desktop/CSV/skus.csv' DELIMITER ',' CSV HEADER;

-- COPY style(style_id, product_id, "name", sale_price, original_price, default_style) FROM '/Users/cyntel/Desktop/CSV/styles.csv' DELIMITER ',' CSV HEADER NULL 'null';
