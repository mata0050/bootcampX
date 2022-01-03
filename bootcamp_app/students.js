const { Pool } = require('pg');

const pool = new Pool({
  user: 'michaelmatambo',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
});

pool
  .query(
    `
SELECT id, name, cohort_id
FROM students
LIMIT 5;
`
  )
  .then((res) => {
    console.log(res.rows);
  })
  .catch((err) => console.error('query error', err.stack));

// ---------------------------

pool
  .query(
    `
SELECT students.id, students.name, cohorts.name as cohorts
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE '${process.argv[2]}%'
LIMIT ${process.argv[3]};
`
  )
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.id} and was in the ${user.cohorts} cohort`
      );
    });
  });


