# HadGEM3-RFMIP-Tier2

This repository contains the global-annual-mean historical + SSP2-4.5 (1850-2099) ERF timeseries simulated by HadGEM3-GC3.1-LL RFMIP (Pincus et al., 2016) Tier II simulations.

Tim Andrews

Met Office Hadley Centre.

September 2020.

## Data description

ERF is calculated as the difference in net TOA radiative flux between the RFMIP Tier II `piClim-histall`, `piClim-histghg`,`piClim-histaer`, `piClim-histnat` and `piClim-control` HadGEM3-GC3.1-LL experiments.  The global-annual-mean data runs from 1850-2099 inclusive.  Fluxes are positive downards. The data contains three ensemble members (r1i1p1f3, r2i1p1f3, r3i1p1f3) as well as the ensemble-mean. Unprocessed raw netCDF data can be accessed via the CMIP6/ESGF database (https://pcmdi.llnl.gov/CMIP6/).

## Data files

The data files have been produced using `idl_calculate_erf_timeseries.pro`.

| Filename | Description |
| -------- | ----------- |
| `HadGEM3-GC31-LL_1850-2099_piClim-histall_ERF.csv` | Global-annual-mean historical Total ERF timeseries |
| `HadGEM3-GC31-LL_1850-2099_piClim-histghg_ERF.csv` | Global-annual-mean historical WMGHG ERF timeseries |
| `HadGEM3-GC31-LL_1850-2099_piClim-histaer_ERF.csv` | Global-annual-mean historical aersosol ERF timeseries |
| `HadGEM3-GC31-LL_1850-2099_piClim-histnat_ERF.csv` | Global-annual-mean historical natural ERF timeseries |

## Effective Radiaitve Forcing

The global-annual-mean ERF timeseries is shown in `Figure_ERF.pdf`.  Created with `idl_plot_erf.pro`.

## Citation

Please contact the author (timothy.andrews@metoffice.gov.uk).

### License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
