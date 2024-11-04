const router = require('express').Router();
const {
  registerUser,
  loginUser,
  getAllUsers,
  getUserById,
  addInformation,
} = require('../controllers/authController.js');

router.post('/register', registerUser);
router.post('/login', loginUser);

router.put('/add-info', addInformation);

router.get('/get-all-users', getAllUsers);
router.get('/get-users-by-id/:id', getUserById);

module.exports = router;