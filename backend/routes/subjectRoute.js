const router = require('express').Router();
const {
  addSubject,
  getSubjects,
  deleteSubject,
  getSubjectsByClass,
} = require('../controllers/subjectController.js');

router.post('/add', addSubject);

router.get('/', getSubjects);
router.get('/:std', getSubjectsByClass);

router.delete('/:id', deleteSubject);

module.exports = router;