// Simple Timeout

function hammertime() {
  alert('HAMMERTIME');
}

window.setTimeout(hammertime, 5000);

console.log("whatever");

// Timeout Plus Closure

function hammertime(time) {
  window.setTimeout(function(){
    alert(time + " is hammertime!");
  }, time);
}

// tea and biscuits

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(choice) {
  let first, second;

  reader.question('Would you like some tea?', function (res) {
    console.log(`You would like ${res}.`);
    reader.question('Would you like some biscuits?', function (res) {
      console.log(`You would like ${res}.`);
      
      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';

      choice(firstRes, secondRes)
    });
  });
}

teaAndBiscuits(function(choice) {
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
})
