const Subject = require('../models/subjectModel.js');
const asyncHandler = require('express-async-handler');

const addSubject = asyncHandler(async (req, res) => {
  try {
    const { name, subjectCode, standard } = req.body;

    const existingSubject = await Subject.findOne({ subjectCode });
    if (existingSubject) {
      return res.status(400).json({ status: 400, message: 'Subject code already exists' });
    }

    const newSubject = await Subject.create({
      name,
      subjectCode,
      standard,
    });

    res.status(201).json(newSubject);
  } catch (err) {
    res.status(500).json({ status: 500, message: 'Failed to add subject', error: err.message });
  }
});

const getSubjects = asyncHandler(async (req, res) => {
  try {
    const subjects = await Subject.find();
    res.status(200).json({ status: 200, data: subjects });
  } catch (err) {
    res.status(500).json({ message: 'Failed to fetch subjects', error: err.message });
  }
});

const deleteSubject = asyncHandler(async (req, res) => {
  try {
    const { id } = req.params;

    const deletedSubject = await Subject.findByIdAndDelete(id);

    if (!deletedSubject) {
      return res.status(404).json({ message: 'Subject not found' });
    }

    res.status(200).json({ message: 'Subject deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Failed to delete subject', error: err.message });
  }
});

const getSubjectsByClass = asyncHandler(async (req, res) => {
  const { std } = req.query;
  try {
    const subjects = await Subject.find({ standard: std });

    if (!subjects.length) {
      return res.status(404).json({ message: 'No subjects found for the given standard' });
    }

    res.status(200).json({ status: 200, data: subjects });


  } catch (err) { }
});

module.exports = {
  addSubject,
  getSubjects,
  deleteSubject,
  getSubjectsByClass,
};
