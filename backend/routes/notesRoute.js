const router = require('express').Router();
const {
  registerUser,
  loginUser,
  getAllUsers,
  getUserById,
  addInformation,
} = require('../controllers/notesController.js');

module.exports = router;