const express = require("express");
const app = express();
const cors = require("cors");
const userRouter = require("./routes/user");
const bodyParser = require("body-parser");

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/user", userRouter);

module.exports = {
  app
};
