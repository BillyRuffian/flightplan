import { Controller } from "@hotwired/stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="timeline"
export default class extends Controller {
  static targets = ["chart"];

  static values = {
    labels: Array,
    series: Array,
  };

  connect() {
    console.log("Connected to timeline controller");
    console.log(this.labelsValue);
    console.log(this.seriesValue);
  }

  initialize() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  get chartOptions() {
    return {
      chart: {
        type: "pie",
        height: "400px",
        width: "400px",
      },
      series: this.seriesValue,
      labels: this.labelsValue,
    };
  }
}
