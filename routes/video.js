const express = require('express');
const videoRouter = express.Router();
const videoService = require('../services/video');

videoRouter.post('/upload', (req, res) => {
    const {
        userId,
        title,
        thumbnailUrl,
        videoUrl,
        description
    } = req.body;

    videoService
        .upload(userId, title, thumbnailUrl, videoUrl, description)
        .then(data => {
            res.status(200).json({
                data
            })
        })
        .catch(err => {
            res.status(400).json({
                err
            })
        })
});

module.exports = videoRouter;