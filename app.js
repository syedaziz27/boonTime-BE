const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

const userRouter = require("./routes/user");
const videoRouter = require("./routes/video")


app.use(cors());
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());

app.use("/user", userRouter);
app.use("/video/", videoRouter);

module.exports = {
  app
};