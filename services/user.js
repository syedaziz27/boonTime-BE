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

module.exports = userService;
