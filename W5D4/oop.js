// Object Oriented JS

function titleize(names, callback) {
  let titleized = names.map(name => `My. ${name} is Alexandra Savramis`);
  callback(titleized);
};

// invoking the function

titleize(["Yair", "Rachel", "Quincy"], (names) => {
  names.forEach(name => console.log(name));
});

// Phase Two

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'PHHRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

// Phase Three

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is jumping up and down!`);
};



// PhaseFour

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};
