import { Controller } from "@hotwired/stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="timeline"
export default class extends Controller {
  static targets = ["chart"];

  static values = {
    labels: Array,
    dates: Array,
  };

  connect() {
    console.log("Connected to timeline controller");

    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  disconnect() {
    this.chart.destroy();
  }

  get chartOptions() {
    var series_data = this.labelsValue.map((label, index) => ({
      x: label,
      y: this.datesValue[index].map((date) => new Date(date).getTime()),
    }));

    return {
      series: [
        {
          data: series_data,
        },
      ],
      chart: {
        height: 100 * this.labelsValue.length + 20,
        type: "rangeBar",
        animations: {
          enabled: false,
        },
      },
      plotOptions: {
        bar: {
          horizontal: true,
        },
      },
      xaxis: {
        type: "datetime",
        min: new Date().getTime(),
      },
      annotations: {
        xaxis: [
          {
            x: new Date().getTime(),
            strokeDashArray: 3,
            borderColor: "#f00",
            label: {
              borderColor: "#775DD0",
              style: {
                color: "#fff",
                background: "#775DD0",
              },
              text: "",
            },
          },
        ],
      },
    };
  }
}

// annotations: {
//   xaxis: [
//     {
//       x: new Date().getTime(),
//       strokeDashArray: 0,
//       borderColor: "#775DD0",
//       label: {
//         borderColor: "#775DD0",
//         style: {
//           color: "#fff",
//           background: "#775DD0"
//         },
//         text: "Today"
//       }
//     }
//   ]

// }
// };
