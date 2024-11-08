const mongoose = require('mongoose');

const subjectSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    subjectCode: {
      type: String,
      unique: true,
      required: true,
    },
    grade: {
      type: String,
      required: true
    }
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model('subject', subjectSchema);