# Advertising and monthly sales

Open `presentation.html` in a web browser. It is self-contained and works offline.
Use Right Arrow or Space to advance slides and reveal findings. Press S for speaker notes, F for full screen, and Esc for an overview. Speaker view availability can vary with browser restrictions for local files.

Seven main slides cover the assignment in about five minutes. Two appendix slides provide residual diagnostics and the actual R model summary.

## Edit and render

All presentation files live in `groupactivity01/presentation/`. Edit `presentation.qmd`, then run from this directory:

```sh
quarto render presentation.qmd
```

Requires Quarto, R, knitr, and rmarkdown. The presentation uses base R for calculations and inline SVG data charts. `charts.R` controls the charts and `presentation.css` controls typography and animations. No extra R packages or online assets are required.

The source reads `../data/group2_advertising_sales.csv` directly. The project keeps one dataset in its existing `data/` folder. Units follow the existing `../graph.R`. Original project files remain unchanged.

The p-value expectation is explicitly reconstructed from the plot because the existing project files do not record a prediction made before inspecting the test. Replace that sentence if the group has a documented original expectation.

The supplied screenshot mentions Google Slides. This presentation follows the explicit request for Quarto.
