// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx1 = document.getElementById("myAreaChart-1");
var ctx2 = document.getElementById("myAreaChart-2");
var myLineChart = new Chart(ctx1, {
  type: 'line',
  data: {
<<<<<<< HEAD
    labels: ["Ngày 1", "Ngày 2", "Ngày 3", "Ngày 4", "Ngày 5", "Ngày 6", "Ngày 7"],
=======
    labels: ["1/2/2022", "2/2/2022", "3/2/2022", "4/2/2022", "5/2/2022", "6/2/2022", "7/2/2022"],
>>>>>>> f493b52ff6e45a512479540fea13ab79e7e32551
    datasets: [{
      label: "Sản Phẩm",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
<<<<<<< HEAD
      data: [10000, 30162, 26263, 18394, 18287, 28682, 31274],
=======
      data: [5, 10, 15, 20, 25, 30, 35],
>>>>>>> f493b52ff6e45a512479540fea13ab79e7e32551
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 100,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
var myLineChart = new Chart(ctx2, {
  type: 'line',
  data: {
    labels: ["20/6/2022", "2/2/2022", "3/2/2022", "4/2/2022", "5/2/2022", "6/2/2022", "7/2/2022"],
    datasets: [{
      label: "Sản Phẩm",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [5, 10, 15, 20,5, 10, 15],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 100,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
