DROP DATABASE IF EXISTS boontime;
CREATE DATABASE boontime;

\c boontime;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    pic_url VARCHAR,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    zip VARCHAR NOT NULL,
    bio VARCHAR,
    birthday VARCHAR,
    uid VARCHAR,
    website VARCHAR,
    facebook VARCHAR,
    twitter VARCHAR,
    instagram VARCHAR,
    skin_type VARCHAR,
    skin_color VARCHAR,
    hair_type VARCHAR,
    verified_email BOOLEAN
);

CREATE TABLE products
(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR,
    img_url VARCHAR,
    product_type VARCHAR NOT NULL,
    rating INT,
    link_url VARCHAR NOT NULL,
    description VARCHAR
);

CREATE TABLE follow
(
    follower_id INT REFERENCES users(id) ON DELETE CASCADE,
    following_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE videos
(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR NOT NULL,
    thumbnail_url VARCHAR NOT NULL,
    video_url VARCHAR NOT NULL,
    upload_date TIMESTAMP NOT NULL DEFAULT NOW(),
    views INT,
    likes INT,
    dislikes INT,
    description VARCHAR
);

CREATE TABLE comments
(
    id SERIAL PRIMARY KEY,
    video_id INT REFERENCES videos(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    comment VARCHAR,
    likes INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    response_to INT REFERENCES comments(id) ON DELETE CASCADE
);

INSERT INTO
users
    (
    first_name,
    last_name,
    username,
    email,
    pic_url,
    city,
    state,
    zip,
    bio,
    birthday,website,skin_type,skin_color,hair_type, verified_email
    )
VALUES
    ('Rich', 'green', 'richmoney', 'Green@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'black', 'kinky', false ),
    ('name2', 'lastname', 'idk', 'email2', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'skin color', 'hair-type', false ),
    ('Syed ', 'aziz', 'azizzzz', 'Syed@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'brown', 'straight', false ),
    ('Van', 'tran', 'vannytranny', 'Van@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'very light', 'straight curly', false ),
    ('Jorge', 'bellini', 'bologna', 'Jorge@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'light', 'curly', false ),
    ('Robert', 'abreu', 'wobbie', 'Rob@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'brownish', 'straight', false ),
    ('Rupa', 'datta', 'rupaaa', 'Rupa@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'brown', 'straight', false ),
    ('Daniel', 'ashley', 'justin', 'Dan@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'black', 'curly', false ),
    ('Carlos', 'TA', 'Los', 'Los@gmail.com', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'website', 'skin-type', 'medium brown', 'curly', false );
INSERT INTO products
    (
    user_id, name, img_url, rating, product_type, link_url, description
    )
VALUES
    (1, 'super berry hydrate', 'https://www.sephora.com/product/superberry-hydrate-glow-dream-mask-P440307?icid2=products%20grid:p440307', 5, 'skin', 'link', 'good'),
    (2, 'Illuminating Hydrator - Radiance + Smoothing', 'https://www.sephora.com/product/sephora-collection-illuminating-hydrator-radiance-smoothing-P455215?icid2=products%20grid:p455215', 5, 'skin', 'link', 'good'),
    (3, 'The Dewy Skin Cream', 'https://www.sephora.com/product/the-dewy-skin-cream-P441101?icid2=products%20grid:p441101', 5, 'skin', 'link', 'good'),
    (4, 'Isle Paradise', 'https://www.sephora.com/product/self-tanning-drops-P431180?icid2=products%20grid:p431180', 5, 'skin', 'link', 'good'),
    (5, 'Green Clean', 'https://www.sephora.com/product/green-clean-makeup-meltaway-cleansing-balm-P417238?icid2=products%20grid:p417238', 5, 'skin', 'link', 'good'),
    (6, 'Tatcha', 'https://www.sephora.com/product/polished-rice-enzyme-powder-P426340?icid2=products%20grid:p426340', 5, 'skin', 'link', 'good');

INSERT INTO follow
    (follower_id, following_id)
VALUES
    (1, 2),
    (2, 3),
    (3, 2),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 4),
    (9, 3);

INSERT INTO videos
    (
    user_id, title, thumbnail_url, video_url, views,likes, dislikes
    )
VALUES
    (1, 'title', 'turl', 'vurl', 12, 2, 2),
    (2, 'title', 'turl', 'vurl', 12, 2, 2),
    (3, 'title', 'turl', 'vurl', 12, 2, 2),
    (4, 'title', 'turl', 'vurl', 12, 2, 2),
    (5, 'title', 'turl', 'vurl', 12, 2, 2),
    (6, 'title', 'turl', 'vurl', 12, 2, 2),
    (7, 'title', 'turl', 'vurl', 12, 2, 2),
    (8, 'title', 'turl', 'vurl', 12, 2, 2),
    (9, 'title', 'turl', 'vurl', 12, 2, 2),
    (1, 'title', 'turl', 'vurl', 12, 2, 2),
    (2, 'title', 'turl', 'vurl', 12, 2, 2),
    (3, 'title', 'turl', 'vurl', 12, 2, 2),
    (3, 'title', 'turl', 'vurl', 12, 2, 2);

INSERT INTO comments
    (
    video_id,user_id, comment, likes, response_to
    )
VALUES
    (1, 1, 'hi', 2, 1),
    (2, 2, 'Yes', 2, 1),
    (3, 3, 'No', 2, 1),
    (4, 1, 'HAHA', 2, 1),
    (5, 2, 'lol', 2, 1),
    (6, 5, 'I cant believe it', 2, 1),
    (7, 4, 'No way', 2, 1),
    (8, 4, 'Youre bull shitten', 2, 1),
    (9, 6, 'Whooaaaa', 2, 1);