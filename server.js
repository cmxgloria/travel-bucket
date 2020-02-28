const db = require("./db/db");
const express = require("express");
const app = express();
const axios = require("axios");
// const port = 8080
const port = 8080 || process.env.PORT;
const pg = require("pg");
const clientID = "4dd63b646b0043412be0";
const clientSecret = "38c0d44c22477f4abd8da92c5b90dae6cac0557f";
app.set("views", "./views");
app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.get("/", (req, res) => {
  res.render("login");
});
app.get("/oauth/redirect", (req, res) => {
  const requestToken = req.query.code;
  axios({
    method: "post",
    url: `https://github.com/login/oauth/access_token?client_id=${clientID}&client_secret=${clientSecret}&code=${requestToken}`,
    headers: {
      accept: "application/json"
    }
  }).then(response => {
    const accessToken = response.data.access_token;
    axios({
      method: "get",
      url: "https://api.github.com/user",
      headers: {
        Authorization: "token " + accessToken
      }
    }).then(({ data }) => {
      const pool = db.createPool();
      pool.query("select * from bucket where user_id = 1;").then(dbres => {
        res.render("bucketlist", { data, dbinfo: dbres.rows });
      });
    });
  });
});

app.get("/view/detail/bucketid/:id", (req, res) => {
  const pool = new pg.Pool({ database: "bucketdb" });
  const bucketid = req.params.id;
  pool.query("select * from bucket where id = $1;", [bucketid]).then(dbRes => {
    pool
      .query("select * from activity where bucket_id = $1;", [bucketid])
      .then(activityRes => {
        res.render("viewdetails", {
          bucketinfo: dbRes.rows[0],
          activity: activityRes.rows
        });
      });
  });
});

app.listen(port, () => {
  console.log(`listening in port ${port}`);
});
