# Input Data

This repo is the sister of [inputdatasecure](https://github.com/PlaceBasedCarbonCalculator/inputdatasecure) and is used by the main Carbon & Place [analysis repo](https://github.com/PlaceBasedCarbonCalculator/build).

This repo contains most of the input data used by Carbon & Place if it published with a licence that allows republication such as the [Open Goverment Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). This repo it not intended to serve as a usable data repository but merely provides transparency about data sources used and allows the [analysis repo](https://github.com/PlaceBasedCarbonCalculator/build) to be rerun.

## Usage

If you wish to fully recreate the Carbon & Place build:

1. Clone this repo alongside the `build` and `inputdatasecure` repos.
1. Follow instruction the `build` repo.

## Main Folder List

This table give a brief overview of the main types of data source.

| Folder  | Description |
| ------------- | ------------- |
| area_classifications  | ONS Area Classifications  |
| boundaries  | ONS / OS Boundary Data  |
| consumption  | DESNZ Consumption Footprints  |
| council_tax_scotland  | Scotland Council Tax Data |
| emission_factors  | DESNZ Emission Factors |
| epc  | Energy Performance Certificates  |
| gas_electric  | DESNZ Gas and Electricity Data  |
| house_price_age  | House Price Data   |
| income  |  ONS Income Data |
| INSPIRE  | Land Registry INSPIRE Polygons  |
| INSPIRE_scotland  | INSPIRE Polygons Scotland  |
| nomis  | Nomis Census data  |
| os_greenspace  | Ordnance Survey Open Greenspace  |
| os_grid  | Ordnance Survey British National Grid  |
| os_uprn  | Ordnance Survey Unique Property Reference Number  |
| os_zoomstack  | Ordnance Survey Open ZoomStack  |
| osm  |  OpenStreetMap |
| pct  |  Propensity to Cylce Tool |
| PLEF  | CREDS Positive Low Energy Futures  |
| poi  | OS Points of Interest  |
| population  | England and Wales population data  |
| population_scotland  | Scotland population data  |
| pt_frequency  | Frequency of Public Transport based on [UK2GTFS](https://itsleeds.github.io/UK2GTFS/) analysis  |
| rural_urban  | ONS  Rural/Urban classifications |
| vehicle_registrations  | DfT/DVLA data on vehicle registrations  |
| voa  | Valuation Office Agency data  |



## Licence

The [LICENCE](https://github.com/PlaceBasedCarbonCalculator/inputdatasecure/blob/main/LICENSE) file only applies to the repo structure and anything unique to Carbon & Place. Please check individual datasets and their original data owners as licence terms may be slightly different. 
