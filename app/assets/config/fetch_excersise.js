fetch('/api/users/1/posts')
  .then(response => response.json())
  .then(data => console.log(data));