import React, { useState, useEffect } from 'react';
import { useHistory, useLocation } from 'react-router-dom';
import Box from '@material-ui/core/Box';
import Button from '@material-ui/core/Button';  
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import { FormControlLabel, Radio } from '@material-ui/core';
import axios from 'axios';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    padding: theme.spacing(3),
  },
  center: { textAlign: 'center' },
  navy: { color: 'navy' },
  button: { marginTop: theme.spacing(3) },
}));

function MovieDetailsPage() {
  const classes = useStyles();
  const history = useHistory();
  const location = useLocation();
  const [selectedTheaters, setSelectedTheaters] = useState([]);
  const [selectedTime, setSelectedTime] = useState([]);
  const [isAdmin, setIsAdmin] = useState(false);
  const movieFromLocationState = location.state ? location.state.movie : null;
  const [styles, setStyles] = useState([]);
  const [movie, setMovie] = useState(null);
  
  const [seats, setSeats] = useState([
    { id: 1, selected: false },
    { id: 2, selected: false },
    { id: 3, selected: false },
  ]);

  const [movieShowings, setMovieShowings] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3001/api/showings')
      .then(response => {
        setMovieShowings(response.data);
      })
      .catch(error => {
        console.error('Error fetching showings: ', error);
      });
  }, []);

  // 수정된 부분: 선택된 영화의 상영 정보 가져오기
  const selectedMovieShowings = movieShowings.filter(showing => showing.movieid === movie?.movieid);

  const handleTheaterChange = (event) => {
    if (isAdmin) {
      setSelectedTheaters((prev) =>
        event.target.checked ? [...prev, event.target.value] : prev.filter((theater) => theater !== event.target.value)
      );
    } else {
      setSelectedTheaters([event.target.value]);
    }
  };
  
  const handleTimeChange = (event) => {
    if (isAdmin) {
      setSelectedTime((prev) =>
        event.target.checked ? [...prev, event.target.value] : prev.filter((time) => time !== event.target.value)
      );
    } else {
      setSelectedTime([event.target.value]);
    }
  };

  const handleUpdateClick = () => {
    const updatedMovie = { ...movie, theater: selectedTheaters, time: selectedTime };
    // 예약한 좌석 정보도 함께 업데이트할 수 있으면 업데이트
    // 예: updatedMovie.seats = selectedSeats;
    
    setMovie(updatedMovie);
    localStorage.setItem('movies', JSON.stringify(updatedMovie));
    alert('상영관과 상영시간이 수정되었습니다.');
    history.goBack();
  };    

  const handleConfirmClick = () => {
    const selectedSeats = seats.filter((seat) => seat.selected).map((seat) => seat.id);
    const selectedTheater = selectedTheaters.join(', ');

    // selectedTime를 state로 사용하므로, 함수 내에서 새로운 변수로 선언할 필요 없음
    alert(`영화: ${movie?.title}\n상영관: ${selectedTheater}\n상영시간: ${selectedTime}`);
    history.push({
      pathname: '/CinemaSeat',
      state: {
        seats: selectedSeats,
        movieTitle: movie?.title,
        theater: selectedTheater,
        time: selectedTime,
      },
    });
  };

  useEffect(() => {
    // location.state의 movie가 변경될 때마다 useEffect를 통해 movie를 업데이트
    setMovie(movieFromLocationState);
  }, [movieFromLocationState]);

  return (
    <Box className={styles.root}>
      <Typography variant="h3" component="h3" className={`${styles.center} ${styles.navy}`} gutterBottom>
        영화 상세 정보
      </Typography>
      <Typography variant="h4" component="h4" className={`${styles.center} ${styles.navy}`} gutterBottom>
        {movie?.title}
      </Typography>
      <Typography variant="h6" component="h6" className={`${styles.center} ${styles.navy}`} gutterBottom>
        상영관 선택
      </Typography>
        {isAdmin ? (
          // 나머지 코드는 그대로 유지됩니다.
          null
      ) : (
        selectedMovieShowings.map((showing, index) => {
          return (
            <FormControlLabel
              key={index}
              control={
                <Radio
                  checked={selectedTheaters.includes(showing.theaterid)}
                  onChange={handleTheaterChange}
                  value={showing.theaterid}
                  name="theater"
                  color="primary"
                />
              }
              label={`상영관: ${showing.theatername}`}
            />
          );
        })
      )}
      <Typography variant="h6" component="h6" className={`${styles.center} ${styles.navy}`} gutterBottom>
        상영시간 선택
      </Typography>
        {isAdmin ? (
          // 나머지 코드는 그대로 유지됩니다.
          null
      ) : (
        selectedMovieShowings.map((showing, index) => {
          return (
            <FormControlLabel
              key={index}
              control={
                <Radio
                  checked={selectedTime.includes(showing.timeid)}
                  onChange={handleTimeChange}
                  value={showing.timeid}
                  name="time"
                  color="primary"
                />
              }
              label={`상영시간: ${showing.time}`}
            />
          );
        })
      )}
        {isAdmin ? (
          // 나머지 코드는 그대로 유지됩니다.
          null
        ) : (
          <Button variant="contained" color="primary" onClick={handleConfirmClick} className={styles.button}>
            확인
          </Button>
        )}
      </Box>
    );
  }
    
    

  export default MovieDetailsPage;
