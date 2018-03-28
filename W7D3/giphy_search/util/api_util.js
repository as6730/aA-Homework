export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax ({
    type: 'GET',
    url:  `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`
  });
}
