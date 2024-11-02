const asyncHandler = require('express-async-handler');
const User = require('../models/userModel.js');

const registerUser = asyncHandler(async (req, res) => {
  try {
    const {
      name,
      email,
      password,
      phone,
      lastname,
      firstname
    } = req.body;

    const user = await User.findOne({ email });

    if (user) {
      return res.status(400).json({ message: 'User already exists' });
    }

    const newUser = await User.create({
      name,
      email,
      password,
      firstname,
      lastname,
      phone
    });

    return res.json({ status: 201, message: 'User created Successfully', data: newUser });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


const loginUser = asyncHandler(async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });

    if (!user || !(await user.matchPassword(password))) {
      return res.status(400).json({ message: 'Invalid email or password' });
    }

    return res.json({ status: 200, message: 'User logged in successfully', data: user });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

const getAllUsers = asyncHandler(async (req, res) => {
  try {
    const users = await User.find({});

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