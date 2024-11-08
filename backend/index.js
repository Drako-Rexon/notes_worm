const path = require('path');
require('dotenv').config({ path: path.join(__dirname, './.env') });
const express = require('express');
const connection = require('./utils/connect_to_db.js');
const port = process.env.PORT || 3000;
const app = express();
// * routes
const authRoute = require('./routes/authRoutes.js');
const subjectRoute = require('./routes/subjectRoute.js');
const notesRoute = require('./routes/notesRoute.js');

app.use(express.json());

connection();

app.use('/api/v1/auth', authRoute);
app.use('/api/v1/subject', subjectRoute);
app.use('/api/v1/notes', notesRoute);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});