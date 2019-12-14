const {
    db
} = require('./dbConnect');
const videoService = {};

videoService.upload = (userId, title, thumbnailUrl, videoUrl, description) => {

    const sql = `
        INSERT INTO videos (user_id, title, thumbnail_url, video_url, description)
        VALUES ($[userId], $[title], $[thumbnailUrl], $[videoUrl], $[description])
        RETURNING id;
    `
    return db.one(sql, {
        userId,
        title,
        thumbnailUrl,
        videoUrl,
        description
    });
}

module.exports = videoService;