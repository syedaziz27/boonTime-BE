DROP DATABASE IF EXISTS boontime;
CREATE DATABASE boontime;

\c boontime;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    pic_url VARCHAR,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    zip INT NOT NULL,
    bio VARCHAR,
    dob VARCHAR,
    uid VARCHAR,
    social_media VARCHAR,
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
    (username,
    email,
    pic_url,
    city,
    state,
    zip,
    bio,
    dob,social_media,skin_type,skin_color,hair_type, verified_email
    )
VALUES
    ('name', 'email', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'social media', 'skin-type', 'skin color', 'hair-type', false ),
    ('name2', 'email2', 'url', 'city', 'state', '12312', 'bio', '13/32/2344', 'social media', 'skin-type', 'skin color', 'hair-type', false );

INSERT INTO products
    (
    user_id, name, img_url,rating, link_url, description
    )
VALUES
    (
        1, 'prod_name', 'url', 5, 'link', 'good'
);

INSERT INTO follow
    (follower_id, following_id)
VALUES
    (1, 2),
    (2, 1);

INSERT INTO videos
    (
    user_id, title, thumbnail_url, video_url, views,likes, dislikes
    )
VALUES
    (
        1, 'title', 'turl', 'vurl', 12, 2, 2);

INSERT INTO comments
    (
    video_id,user_id, comment, likes, response_to
    )
VALUES
    (
        1, 1, 'hi', 2, 1
);