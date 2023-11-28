// server.js

const express = require('express');
const cors = require('cors');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();
const models = require('../models'); // models 모듈을 가져오는 부분에서 오류 발생 가능성이 있습니다. 정의된 모듈이 아니라면 수정이 필요합니다.

const app = express();
app.use(cors());
const PORT = process.env.PORT || 3001;
const dbPath = '../DataBase/movieDB.db';

// 데이터베이스 연결
let db = new sqlite3.Database(dbPath, sqlite3.OPEN_READWRITE, (err) => {
  if (err) {
    console.error(err.message);
  } else {
    console.log('Connected to the movieDB database.');

    // Middleware 설정
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));

    // 영화 데이터를 제공하는 엔드포인트
    app.get('/api/movies', (req, res) => {
      db.all('SELECT * FROM Movies', [], (err, rows) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(rows);
        }
      });
    });

    // 새로운 엔드포인트 추가: 특정 영화 상세 정보 조회
    app.get('/api/movies/:movieId', (req, res) => {
      const movieId = req.params.movieId;

      db.get('SELECT * FROM Movies WHERE movieid = ?', [movieId], (err, row) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(row);
        }
      });
    });

    // 새로운 엔드포인트 추가: 영화 상영 정보 조회
    app.get('/api/showings', (req, res) => {
      const query = 'SELECT * FROM MovieShowings';

      db.all(query, [], (err, rows) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(rows);
        }
      });
    });

    // 영화 좌석 데이터를 제공하는 엔드포인트
    app.get('/api/seats', (req, res) => {
      db.all('SELECT * FROM Seats', [], (err, rows) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(rows);
        }
      });
    });
    // 새로운 엔드포인트 추가: 특정 상영 정보 조회
    app.get('/api/showings/:showingId', (req, res) => {
      const showingId = req.params.showingId;
    
      db.get('SELECT * FROM MovieShowings WHERE id = ?', [showingId], (err, row) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(row);
        }
      });
    });
    // 새로운 엔드포인트 추가: 특정 상영의 영화 정보 조회
    app.get('/api/showings/:showingId/movie', (req, res) => {
      const showingId = req.params.showingId;
    
      db.get('SELECT Movies.* FROM Movies JOIN MovieShowings ON Movies.movieid = MovieShowings.movieid WHERE MovieShowings.id = ?', [showingId], (err, row) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(row);
        }
      });
    });
    // 새로운 엔드포인트 추가: 특정 상영의 상영관 정보 조회
    app.get('/api/showings/:showingId/theater', (req, res) => {
      const showingId = req.params.showingId;
    
      db.get('SELECT Theaters.* FROM Theaters JOIN MovieShowings ON Theaters.theaterid = MovieShowings.theaterid WHERE MovieShowings.id = ?', [showingId], (err, row) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(row);
        }
      });
    });
    // 새로운 엔드포인트 추가: 특정 상영의 상영 시간 정보 조회
    app.get('/api/showings/:showingId/time', (req, res) => {
      const showingId = req.params.showingId;
    
      db.get('SELECT Times.* FROM Times JOIN MovieShowings ON Times.timeid = MovieShowings.timeid WHERE MovieShowings.id = ?', [showingId], (err, row) => {
        if (err) {
          console.error(err.message);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          res.json(row);
        }
      });
    });

    // 정적 파일을 제공할 디렉토리 설정
    app.use(express.static(path.join(__dirname, '../build')));

    // 모든 요청을 React 앱으로 라우팅
    app.get('*', (req, res) => {
      res.sendFile(path.join(__dirname, '../build', 'index.html'));
    });

    // 서버 시작
    app.listen(PORT, () => {
      console.log('서버가 동작중입니다.');
      // sequelize와 데이터베이스 연결작업
      // 데이터베이스 동기화
      models.sequelize
        .sync()
        .then(() => {
          console.log('DB연결 성공');
        })
        .catch((e) => {
          console.error(e);
          console.log('DB연결 에러');
          // 서버실행이 안되면 프로세서를 종료
          process.exit();
        });
    });
  }
});
