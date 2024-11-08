const mongoose = require('mongoose');

const notesSchema = mongoose.Schema(
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
    standard: {
      type: String,
      required: true
    }
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model('notes', notesSchema);