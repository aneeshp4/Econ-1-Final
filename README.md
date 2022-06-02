# Econ-1-Final

Storing files used to calculate various values used in our paper

EVMarketHHICalculation.R uses rvest to read website data. Using [https://evadoption.com/ev-sales/evs-percent-of-vehicle-sales-by-brand/](https://evadoption.com/ev-sales/evs-percent-of-vehicle-sales-by-brand/"), we were able to find data on EV sales in the US in 2018, allowing us to identify the market share of different EV manufacturers.

Taking this data, we calculate the Herfindahl--Hirschman Index (HHI) of the US EV market to measure the concentration of the market and hence understand the market structure. <https://www.investopedia.com/terms/h/hhi.asp> states that an HHI of over 2,500 implies that the market is heavily concentrated, meaning the market is likely an oligopoly. Based on our calculations, we find the HHI of the US EV market in 2018 to be 3149, meaning that this market is an oligopoly.
