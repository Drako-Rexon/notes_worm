const router = require('express').Router();
const {
  addSubject,
} = require('../controllers/subjectController.js');

router.post('/add-subject', addSubject);

module.exports = router;