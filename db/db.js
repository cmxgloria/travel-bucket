module.exports = {
  createPool: function() {
    let pool;
    if (process.env.PRODUCTION) {
      pool = new Pool({
        connectionString: process.env.DATABASE_URL
      });
    } else {
      pool = new pg.Pool({ database: "bucketdb" });
    }
    return pool;
  }
};
