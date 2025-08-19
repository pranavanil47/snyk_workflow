const express = require('express');
const _ = require('lodash');
const minimist = require('minimist');

// NOTE: Code intentionally uses outdated libs and weak patterns to trigger SAST/SCA.
const app = express();

app.get('/', (req, res) => {
  const args = minimist((req.query.q || '').split(' '));
  // Intentionally naive: reflects user input directly (XSS-like sink demonstration)
  res.send(`<h1>snyk-test-kitchen</h1><p>You sent: ${req.query.q || ''}</p>`);
});

app.listen(3000, () => console.log('vulnerable-node listening on 3000'));
