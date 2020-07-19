const throng = require('throng');

const WORKERS = process.env.WEB_CONCURRENCY || 1
const PORT = process.env.PORT || 5000

const start = () => {
  const express = require('express')
  const path = require('path')
  const app = express()

  app.use(express.static(path.resolve(__dirname, '../client/build')))

  // Handle api requests
  app.use('/api', require('./api/apiRouter'))

  // All remaining requests return the React app, so it can handle routing.
  app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, '../client/build', 'index.html'));
  })

  app.listen(PORT, () => { console.log('Listening on', PORT) })
}

throng({
  workers: WORKERS,
  lifetime: Infinity
}, start)