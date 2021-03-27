require('dotenv').config();

const fs = require('fs');

const mysql = require('mysql2/promise');

const host = process.env.HOST || 'localhost';
const user = process.env.USER || 'root';
const password = process.env.PASSWORD || '';

(async () => {
  try {
    const connection = await mysql.createConnection({
      host,
      user,
      password,
    });
    await connection.connect();

    const migration = await fs.readFileSync(
      __dirname + '/files/songfy.sql',
      'utf-8'
    );

    await connection.query(migration);

    await connection.end();
  } catch (err) {
    console.log('Error while migrating');
    console.log(err);
  }
})();
