CREATE DATABASE bucketDB;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    github_id VARCHAR(255) 
);


CREATE TABLE bucket(
    id SERIAL PRIMARY KEY,
    city VARCHAR(255),
    city_photo VARCHAR(255),
    budget INTEGER,
    year INTEGER,
    month INTEGER,
    user_id INTEGER REFERENCES users (id)
);


CREATE TABLE activity(
    id SERIAL PRIMARY KEY,
    activity_title VARCHAR(255),
    activity_detail TEXT,
    activity_photo VARCHAR(255),
    bucket_id INTEGER REFERENCES bucket (id)
);




INSERT INTO bucket (city, city_photo,user_id) VALUES('MEl','http://test1',2);
INSERT INTO bucket (city, city_photo,user_id) VALUES('MEl2','http://test1',2);

INSERT INTO bucket (city, city_photo,user_id) VALUES('Melbourne','https://media0.giphy.com/media/OjAXR19wXcVNK/giphy.gif?cid=44b7432cb44aa59efae0724d92b88b146ff38d9f879ea563&rid=giphy.gif',1);
INSERT INTO bucket (city, city_photo, user_id, budget, year, month) VALUES('FrankFurk','https://media0.giphy.com/media/5BYt33NDLURd1Oq8UN/giphy-downsized.gif?cid=44b7432c30f47bbd2d4e61898c5ddbb97ae411b4f7154a69&rid=giphy-downsized.gif',1,5000,2022,7);


INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('ski','ski all day long','https://media2.giphy.com/media/FsF2iOxgHYa7m/giphy.gif?cid=6b76cd901a903545b30876bb6af270ed0ae1eb0162dd7595&rid=giphy.gif',3);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('run','run all day long','https://media3.giphy.com/media/yRXnlNNC9U7FC/giphy.gif?cid=6b76cd906a259474ae5068e625a15854574ca13ac16e4423&rid=giphy.gif',3);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('Swim','swim all day long','https://media3.giphy.com/media/t5LdxcD2jnDqw/giphy.gif?cid=6b76cd9037990c80f41214837e59070f11aae203bac4134a&rid=giphy.gif',3);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('Eat','eat anything all day long','https://media1.giphy.com/media/JdkSs3QlyJJvO/giphy.gif?cid=6b76cd9024c41e02d9bcfc931710fc40633b2a80f671543b&rid=giphy.gif',3);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('Swim','swim all day long','https://media0.giphy.com/media/kQ5laHax6S35K/giphy-downsized.gif?cid=44b7432ca21ee638ead15d005e58925cbeadb86d21d5e986&rid=giphy-downsized.gif',4);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('Eat','eat anything all day long','https://media1.giphy.com/media/xTiTnsU6IKXbH0atkA/giphy-downsized.gif?cid=44b7432cb478f751bc65faa5726650ae12f11a2c852e7106&rid=giphy-downsized.gif',4);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('ski','ski all day long','https://media0.giphy.com/media/l2JHY6zkjwNRmNiGk/giphy.gif?cid=44b7432c48d49e603cedbbe4e638b695b6e9948503d38624&rid=giphy.gif',4);
INSERT INTO activity (activity_title,activity_detail,activity_photo,bucket_id) VALUES('run','run all day long','https://media2.giphy.com/media/7kn27lnYSAE9O/giphy.gif?cid=44b7432cf3fc3fed0cde492f48a8f8d5c44e5f98c3d85d52&rid=giphy.gif',4);

INSERT INTO users (username, github_id) VALUES('jp1',12423423);
INSERT INTO users (username, github_id) VALUES('jp2',12423423);
INSERT INTO users (username, github_id) VALUES('sriramank1988',43689259);
INSERT INTO users (username, github_id) VALUES('cmxgloria',47142507);

