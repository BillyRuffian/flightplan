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
    const series_data = this.labelsValue.map((label, index) => ({
      x: label,
      y: this.datesValue[index].map((date) => new Date(date).getTime()),
      goals: [
        {
          name: "Break",
          value: new Date("2024-09-01").getTime(),
          strokeColor: "#fff",
        },
      ],
    }));
    const earliest_start_date = Math.min.apply(
      Math,
      this.datesValue.map((a) => new Date(a[0]).getTime()),
    );
    const today = new Date().getTime();

    return {
      series: [
        {
          data: series_data,
        },
      ],
      chart: {
        height: 80 * this.labelsValue.length + 20,
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
        min: today < earliest_start_date ? today : earliest_start_date,
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
