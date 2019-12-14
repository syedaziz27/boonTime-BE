const express = require("express");
const userRouter = express.Router();
const userService = require("../services/user");

userRouter.post("/newuser", (req, res) => {
  const {
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
  } = req.body;

  userService
    .postUser(
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
    )
    .then(data => {
      res.status(200).json({
        data
      });
    })
    .catch(err =>
      res.status(400).json({
        err
      })
    );
});

module.exports = userRouter;
