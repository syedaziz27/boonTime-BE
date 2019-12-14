const { db } = require("./dbConnect");
const userService = {};

userService.postUser = (
  username,
  email,
  picUrl,
  city,
  state,
  zip,
  bio,
  dob,
  uid,
  socialMedia,
  skinType,
  skinColor,
  hairType
) => {
  const sql = `
            INSERT INTO users (username,email,pic_url,city,state,zip,bio,dob,uid,social_media,skin_type,skin_color,hair_type)
            VALUES ($[username],$[email],$[picUrl],$[city],$[state],$[zip],$[bio],$[dob],$[uid],$[socialMedia],$[skinType],$[skinColor],$[hairType])
            RETURNING id;
        `;
  return db.one(sql, {
    username,
    email,
    picUrl,
    city,
    state,
    zip,
    bio,
    dob,
    uid,
    socialMedia,
    skinType,
    skinColor,
    hairType
  });
};

userService.verifyEmail = id => {
  const sql = `
        UPDATE users 
        SET verified_email = true
        WHERE id = $[id]
        RETURNING id;
    `;

  return db.one(sql, { id });
};

userService.subscribeToChannel = (followerId, followingId) => {
  const sql = `
        INSERT INTO follow (follower_id, following_id)
        VALUES ($[followerId], $[followingId])
        RETURNING follower_id, following_id;
    `;
  return db.one(sql, { followerId, followingId });
};

module.exports = userService;
