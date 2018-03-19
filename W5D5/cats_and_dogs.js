function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();


Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);

// In general, call is more convenient when you know ahead of time
// what arguments you want to pass. apply is more useful when someone is
// going to give you an array of arguments to use. There is a slight
// performance cost to using apply because the arguments need to be unpacked.
