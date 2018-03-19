document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgb(50,20,100)";
  ctx.fillRect(10, 10, 55, 50);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "red";
  ctx.lineWidth = 7;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();

  ctx.setLineDash([]);
  ctx.beginPath();
  ctx.ellipse(100, 100, 50, 75, 45 * Math.PI / 180, 0, 2 * Math.PI);
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.setLineDash([2, 2]);
  ctx.moveTo(0, 200);
  ctx.lineTo(200, 0);
  ctx.stroke();
});
