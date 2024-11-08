const asyncHandler = require('express-async-handler');
const User = require('../models/userModel.js');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const registerUser = asyncHandler(async (req, res) => {
  try {
    const {
      name,
      email,
      password,
      role,
      grade,
      username,
      phone,
    } = req.body;

    const user = await User.findOne({ $or: [{ email: emailusername }, { username: emailusername }] });

    if (user) {
      return res.status(400).json({ message: 'User already exists' });
    }

    const passSalt = Number(process.env.PASS_SALT);

    const hashedPassword = await bcrypt.hash(password, passSalt);

    const newUser = await User.create({
      name,
      email,
      password: hashedPassword,
      role,
      grade,
      username,
      phone,
    });

    const token = jwt.sign({ username, email }, process.env.SALT);
    let newUserResult;
    if (newUser) {
      const { password, ...userWithoutPassword } = newUser;
      newUserResult = userWithoutPassword;
    }

    return res.status(201).json({ status: 201, token, message: 'User created Successfully', data: newUserResult });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

const loginUser = asyncHandler(async (req, res) => {
  try {
    const { emailusername, password } = req.body;
    const user = await User.findOne({ $or: [{ email: emailusername }, { username: emailusername }] });

    const match = await bcrypt.compare(password, user.password);

    if (!user || !match) {
      return res.status(400).json({ message: 'Invalid email or password' });
    }

    const token = jwt.sign({ username: user.username, email: user.email }, process.env.PASS_SALT);

    delete user.password;

    return res.status(200).json({ status: 200, token, message: 'User logged in successfully', data: user });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

const getAllUsers = asyncHandler(async (req, res) => {
  try {
    const users = await User.find();

    res.json({ status: 200, message: 'Users fetched successfully', data: users });

  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


const getUserById = asyncHandler(async (req, res) => {
  try {
    const { id } = req.params;
    const user = await User.findById({ _id: id });

    if (!user) return res.status(404).json({ message: 'User not found' });

    return res.json({ status: 200, message: 'User fetched successfully', data: user });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = {
  registerUser,
  loginUser,
  getAllUsers,
  getUserById,
};