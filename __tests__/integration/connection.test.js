const database = require('../../src/database/Connection');

it('should create a connection with the database', async () => {
  const connection = await database.connect();
  expect(connection.connection.authorized).toBe(true);
  connection.destroy();
});

it('should clear the database', async () => {
  await database.clear();
});
