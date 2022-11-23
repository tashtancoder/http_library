const String githubUrl = 'https://api.github.com/users/mojombo';
const String githubToken = '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';
const githubHeaders = {
  'Content-Type': 'application/json',
  'Authorization': 'bearer $githubToken'
};

// test APIS
const String status200Url = 'https://f121aabf-ad81-458d-baaa-872cac5a3e0c.mock.pstmn.io/status200';
const String status400Url = 'https://f121aabf-ad81-458d-baaa-872cac5a3e0c.mock.pstmn.io/status400';