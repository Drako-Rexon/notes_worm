const User = require('../models/userModel');
const jwt = require('jsonwebtoken');
const asyncHandler = require('express-async-handler');

const authMiddleware = asyncHandler(async (req, res, next) => {
  let token;
  if (req?.headers?.authorization?.startsWith("Bearer")) {
    token = req.headers.authorization.split(" ")[1];
    try {
      if (token) {
        const decoded = jwt.verify(token, process.env.JWT_SALT);
        const user = await User.findById(decoded?.id);
        req.user = user;
        next();
      }
    } catch (err) {
      throw new Error("Authorized token expired, Please login again");
    }
  } else {
    throw new Error("Authorized token is not provided");
  }
});

const isAdmin = asyncHandler(async (req, res, next) => {
  const { email, username } = req.user;
  const user = await User.findOne({ $or: [{ email: email }, { username: username }] });

  if (adminUser.role !== "admin") {
    throw new Error("You are not an admin");
  } else {
    next();
  }
});

module.exports = { authMiddleware, isAdmin };