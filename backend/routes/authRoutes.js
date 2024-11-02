const router = require('express').Router();
const {
  registerUser,
  loginUser,
  getAllUsers,
  getUserById,
} = require('../controllers/authController.js');

router.post('/register', registerUser);
router.post('/login', loginUser);

router.get('/get-all-users', getAllUsers);
router.get('/get-users-by-id/:id', getUserById);

module.exports = router;