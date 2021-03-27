const mysql = require('mysql2/promise');

async function connect() {
  const host = process.env.DB_HOST || 'localhost';
  const user = process.env.DB_USERNAME || 'root';
  const password = process.env.DB_PASSWORD || '';
  const database = process.env.DB_NAME || 'db_songfy';

  if (global.connection && global.connection.state !== 'disconnected')
    return global.connection;

  const connection = await mysql.createConnection({
    host,
    user,
    password,
    database,
  });

  connection.connect(function (err) {
    if (err) {
      console.log(`connectionRequest Failed ${err.stack}`);
      throw new Error('Error while connecting to the database');
    } else {
      console.log(`DB connectionRequest Successful ${connection.threadId}`);
    }
  });

  global.connection = connection;
  return connection;
}

async function clear() {
  const connection = await connect();
  connection.connect();
  const result = await connection.query('SHOW TABLES');
  console.log(result);
}

async function close() {
  if (global.connection) global.connection.destroy();
}

module.exports = {
  connect,
  clear,
};
