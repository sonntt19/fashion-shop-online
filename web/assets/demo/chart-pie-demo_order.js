// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChartOrder");
var myPieChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
        labels: [
            'Đã hủy',
            'Thành công',
            'Đã gửi'
        ],
        datasets: [{
                label: 'My First Dataset',
                data: [11, 16, 7],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(75, 192, 192)',
                    'rgb(255, 205, 86)'
                ]
            }]
    },
    options: {}
});
