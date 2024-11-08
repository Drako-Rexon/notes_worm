const path = require('path');
require('dotenv').config({ path: path.join(__dirname, './.env') });
const express = require('express');
const authRoute = require('./routes/authRoutes.js');
const subjectRoute = require('./routes/subjectRoute.js');
const connection = require('./utils/connect_to_db.js');
const port = process.env.PORT || 3000;
const app = express();

app.use(express.json());

connection();

app.use('/api/v1/auth', authRoute);
app.use('/api/v1/subject', subjectRoute);
app.use('/api/v1/subject', authRoute);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});