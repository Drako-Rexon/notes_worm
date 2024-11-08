const mongoose = require('mongoose');

const userSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    email: {
      type: String,
      unique: true,
      required: true,
    },
    username: {
      type: String,
      unique: true,
      required: true,
    },
    standard: {
      type: String,
    },
    role: {
      type: String,
    },
    password: {
      type: String,
      required: true
    }
  },
  {
    timestamps: true
  }
);
 
module.exports = mongoose.model('User', userSchema);